<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioAltaUsuario.aspx.cs" Inherits="TPC_Ferrari_Iglesias.FormularioAltaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>FORMULARIO DE ALTA PARA USUARIOS</title>
    <link rel="stylesheet" href="../css/FormAltaUsuarios.css" />
   
</head>
<body style="background-image: url(' https://image.freepik.com/foto-gratis/3d-render-mesa-madera-rustica-fondo-luces-bokeh_1048-6341.jpg'); background-size: cover;">
    <form id="form1" runat="server">
        <div class="container">
            <div>
                <asp:Label Text="NombreUsuario" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtNombreUsuario" CssClass="caja" />
            </div>


            <div>
                <asp:Label Text="TipoUsuario" runat="server" CssClass="label" />
                <asp:DropDownList runat="server" ID="DdlTipo" CssClass="form-control" AutoPostBack="false">
                </asp:DropDownList>
            </div>

            <div>
                <asp:Label Text="Contraseña" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtContraseña" CssClass="caja" />
                <%-- <div>
                <asp:Label Text="" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="" CssClass="caja" />
            </div>--%>
            </div>
            <div>
                <asp:Label Text="Nombre" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="caja" />
            </div>
            <div>
                <asp:Label Text="Apellido" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="caja" />
            </div>
            <div>
                <asp:Label Text="DNI" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtDNI" CssClass="caja" />
            </div>


            <div>
                <asp:Button Text="Guardar" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" />
                <a href="AbmUsuarios.aspx" class="btn btn-primary">Cancelar    </a>


            </div>
            </div>
    </form>
</body>
</html>
