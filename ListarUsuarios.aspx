<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="ListarUsuarios.aspx.vb" Inherits="ListUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/jquery.dataTables.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dataTables.ReloadAjax.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dataTables.Processing.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>
        Ejemplo de uso de JQuery</h2>
    <hr />
    <h3>
        Segundo ejemplo</h3>
    <h4>
        Listar una tabla en la BD utilizando JQuery AJAX, JSON y DataTables</h4>
        <br />
    <div>
        <table border="0" cellpadding="0" cellspacing="0" id="tbl_usuarios">
            <thead>
                <tr>
                    <th>
                        Nombre
                    </th>
                    <th>
                        Paterno
                    </th>
                    <th>
                        Materno
                    </th>
                    <th>
                        Ingreso
                    </th>
                    <th>
                        Genero
                    </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            var oTable = $('#tbl_usuarios').dataTable({
                "bProcessing": true,
                "bServerSide": false,                
                "sAjaxSource": "WSUsuarios.asmx/listar_usuarios",
                aoColumns: [
                    { "mData": "nombre" },
                    { "mData": "paterno" },
                    { "mData": "materno" },
                    { "mData": "ingreso" },
                    { "mData": "genero" }
                ],                
                "fnServerData": function (sSource, aoData, fnCallBack) {
                    this.fnProcessingIndicator(true);                    
                    $.ajax({
                        type: "POST",
                        url: sSource,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: '',
                        success: function (response) {
                            var json = $.parseJSON(response.d);
                            fnCallBack(json);
                            oTable.fnProcessingIndicator(false);                            
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>
