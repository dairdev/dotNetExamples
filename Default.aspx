<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Ejemplo de uso de JQuery</h2>
    <hr />
    <h3>
        Primer ejemplo</h3>
    <h4>
        Traer informacion de una tabla en la BD utilizando JQuery AJAX y JSON</h4>
        <p>
            Presione el boton Ver <button type="button" id="ver_usuario">Ver</button> para ver los datos del usuario Dennis
        </p>
        <div id="respuesta">
            <dl>
                <dt>Nombres</dt>
                <dd id="nombre"></dd>
                <dt>Genero</dt>
                <dd id="genero"></dd>
                <dt>Ingreso</dt>
                <dd id="ingreso"></dd>
            </dl>
        </div>
        <script type="text/javascript">
            $("#ver_usuario").click(function () {
                $.ajax({
                    type: "POST",
                    url: "WSUsuarios.asmx/ver_usuario",
                    data: '{"nombre": "Dennis"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var json = $.parseJSON(response.d);
                        $("#nombre").html(json.nombre + " " + json.paterno + " " + json.materno);
                        var genero = 'Masculino';
                        if (json.genero == 'F') {
                            genero = 'Femenino';
                        }
                        $("#genero").html(genero);
                        $("#ingreso").html(json.ingreso);
                    }
                });
            });
        </script>
</asp:Content>
