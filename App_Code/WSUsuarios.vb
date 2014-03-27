Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Linq
Imports System.Data.Linq
Imports DataContext
Imports Newtonsoft.Json.Linq

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class WSUsuarios
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function ver_usuario(ByVal nombre As String) As String
        Dim dbx As New TestContext
        Dim record = (From u In dbx.Usuarios Where u.nombre.Equals(nombre) Select u).FirstOrDefault
        Dim result = JObject.FromObject(record)
        Return result.ToString
    End Function

    <WebMethod()> _
    Public Function agregar_usuario(ByVal nombre As String, ByVal paterno As String, ByVal materno As String, ByVal ingreso As String, ByVal genero As String) As String
        Dim result As String = "Success"
        Dim dbx As New TestContext
        Dim record As New Usuario
        With record
            .nombre = nombre
            .paterno = paterno
            .materno = materno
            .ingreso = CInt(ingreso)
            .genero = CChar(genero)
        End With
        dbx.Usuarios.InsertOnSubmit(record)
        dbx.SubmitChanges()
        Return result
    End Function

    <WebMethod()> _
    Public Function listar_usuarios() As String        
        Dim dbx As New TestContext
        Dim records = (From u In dbx.Usuarios Select u)
        Dim recordsJson As New JObject
        With recordsJson
            .Add(New JProperty("sEcho", 1))
            .Add(New JProperty("iTotalRecords", records.Count))
            .Add(New JProperty("aaData", New JArray( _
                                    From r As Usuario In records _
                                    Select New JObject( _
                                            New JProperty("nombre", r.nombre), _
                                            New JProperty("paterno", r.paterno), _
                                            New JProperty("materno", r.materno), _
                                            New JProperty("ingreso", r.ingreso), _
                                            New JProperty("genero", CStr(r.genero))
                               ))))
        End With
        Return recordsJson.ToString
    End Function
End Class