<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioAlta.aspx.cs" Inherits="TPC_Ferrari_Iglesias.FormularioAlta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulariesito de altas vistescomoes </title>
    <%--esto es es cdn para poder usar bootstrap--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron">
            <div>
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox runat="server" ID="txtNombre" />
            </div>
            <div>
                <asp:Label Text="idTipo" runat="server" />
                <asp:TextBox runat="server" ID="txtIdTipo" />
            </div>
            <asp:Label Text="Descripcion" runat="server" />
            <asp:TextBox runat="server" ID="txtDescripcion" />
            <div>
                <asp:Label Text="Talle" runat="server" />
                <asp:TextBox runat="server" ID="txtTalle" />
            </div>
            <asp:Label Text="Color" runat="server" />
            <asp:TextBox runat="server" ID="txtColor" />
            <div>
                <asp:Label Text="Imagen" runat="server" />
                <asp:TextBox runat="server" ID="txtImagen" />
            </div>
            <div>
                <asp:Label Text="Precio" runat="server" />
                <asp:TextBox runat="server" ID="txtPrecio" />
            </div>
        </div>

        <div>   
            <asp:Button Text="Guardar" id="btnGuardar" OnClick="btnGuardar_Click" runat="server" />
            <a  href="AbmProductos.aspx"class="btn-primary">Cancelar    </a>

        </div>

    </form>
</body>
</html>
