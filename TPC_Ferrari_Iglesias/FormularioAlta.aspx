<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioAlta.aspx.cs" Inherits="TPC_Ferrari_Iglesias.FormularioAlta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario de alta </title>
    <%--esto es es cdn para poder usar bootstrap--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <link rel="stylesheet" href="../css/FormAlta.css" />
    <%--ESTO (de arribe) ES PARA CONECTARLO CON LA CARPETA DE CSS Q CREE LLAMADA FORMALTA--%>

    <link href="popup.css" rel="stylesheet" type="text/css" />
    <%--esto es para probar si podemos hacer una ventanita de pop up de mensaje de exito--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron">
            <div>
                <asp:Label Text="Nombre" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="caja" />
            </div>
            <div>
                <asp:Label Text="idTipo" runat="server" CssClass="label" />
                <asp:DropDownList runat="server" ID="DdlTipo" CssClass="form-control">
                </asp:DropDownList>
            </div>

         <%--               <div>
                <asp:Label Text="idTipo" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtIdTipo" CssClass="caja" />
            </div>
         --%>   <asp:Label Text="Descripcion" runat="server" CssClass="label" />
            <asp:TextBox runat="server" ID="txtDescripcion" CssClass="caja" />
            <div>
                <asp:Label Text="Talle" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtTalle" CssClass="caja" />
            </div>
            <asp:Label Text="Color" runat="server" CssClass="label" />
            <asp:TextBox runat="server" ID="txtColor" CssClass="caja" />
            <div>
                <asp:Label Text="Imagen" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtImagen" CssClass="caja" />
            </div>
            <div>
                <asp:Label Text="Precio" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="caja" />
            </div>
        </div>

        <div>
            <asp:Button Text="Guardar" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" />
            <a href="AbmProductos.aspx" class="btn btn-primary">Cancelar    </a>

        </div>
        <%-- <div>
            <p><a href="#popup">Abrir Popup</a></p>
        </div>
        <div id="popup" class="overlay">
            <div id="popupBody">
                <h2>Exito</h2>
                <a id="cerrar" href="#">&times;</a>
                <div class="popupContent">
                    <p>Cargaste bien la remerita!</p>
                </div>
            </div>
        </div>--%>
    </form>
</body>
</html>
