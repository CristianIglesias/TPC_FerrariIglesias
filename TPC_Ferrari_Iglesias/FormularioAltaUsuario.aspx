<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioAltaUsuario.aspx.cs" Inherits="TPC_Ferrari_Iglesias.FormularioAltaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>FORMULARIO DE ALTA PARA USUARIOS</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <link rel="stylesheet" href="../css/FormAltaUsuarios.css" />

</head>
<body >
    <div class="recuadro">
    <form id="form1" runat="server">
        <div class="container" style="align-content: center">

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
                <asp:Label Text="NombreUsuario" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtNombreUsuario" CssClass="caja" />
            </div>

            <div class="form-group">
                <asp:Label Text="TipoUsuario" runat="server" CssClass="label" />
                <asp:DropDownList runat="server" ID="DdlTipo"  CssClass="caja" AutoPostBack="false">
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
                <asp:Label Text="Estado" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtEstado" CssClass="caja" />
            </div>

            <div style="margin-top: 30px; margin-bottom: 20px">
                <asp:Button Text="Guardar" ID="btnGuardar" CssClass="button"  OnClick="btnGuardar_Click" runat="server" />
                <a href="AbmUsuarios.aspx" class="btn btn-primary">Cancelar</a>


            </div>
        </div>
    </form>
        </div>
</body>
</html>
