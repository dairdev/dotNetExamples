<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="InsertExample.aspx.vb" Inherits="InsertExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>
        Ejemplo de uso de JQuery</h2>
    <hr />
    <h3>
        Segundo ejemplo</h3>
    <h4>
        Insertar un registro en una tabla en la BD utilizando JQuery AJAX y JSON</h4>
    <div>
        <p>
        <input type="text" id="txt_nombre" placeholder="Nombre" />
        </p>
        <p>
        <input type="text" id="txt_paterno" placeholder="Ap. Paterno" />
        </p>
        <p>
        <input type="text" id="txt_materno" placeholder="Ap. Materno" />
        </p>
        <p>
        <input type="text" id="txt_ingreso" placeholder="Ingreso" />
        </p>
        <p>
        <select id="cmb_genero">
            <option>---Genero---</option>
            <option value='F'>Femenino</option>
            <option value='M'>Masculino</option>
        </select>
        </p>
        <p>
            <button type="submit" id="btn_submit">Guardar</button>
        </p>
    </div>
    <script type="text/javascript">
        /* When the page was loaded */
        $(function () {
            $("#btn_submit").click(function () {
                $.ajax({
                    type: "POST",
                    url: "WSUsuarios.asmx/agregar_usuario",
                    data: '{"nombre": "' + $("#txt_nombre").val() + '", "paterno": "' + $("#txt_paterno").val() + '", "materno": "' + $("#txt_materno").val() + '", "ingreso": "' + $("#txt_ingreso").val() + '", "genero": "' + $("#cmb_genero").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d === "Success") {
                            alert("Registrado con exito");
                        } else {
                            alert(response.d);
                        }
                    }
                });
                return false;
            });
        });
    </script>
</asp:Content>