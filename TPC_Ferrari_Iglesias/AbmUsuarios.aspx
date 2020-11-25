<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AbmUsuarios.aspx.cs" Inherits="TPC_Ferrari_Iglesias.AbmUsuarios" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="row">
        <div class="col">
            <table class="table">
                <tr>
                    <td><strong>ID</strong></td>
                     <td><strong>CONTRASEÑA</strong></td>
                     <td><strong>TIPO-USUARIO</strong></td>
                     <td><strong>NOMBRE-USUARIO</strong></td>
                     <td><strong>NOMBRE</strong></td>
                     <td><strong>APELLIDO</strong></td>
                     <td><strong>DNI</strong></td>
                </tr>
                <%foreach (var item in ListaUsuarios)
                    {%>
               
                    <tr>
                         <td><%=item.Id %></td>
                         <td><%=item.Contrasenia%></td>
                         <td><%=item.TipoUsuario%></td>
                         <td><%=item.NombreUsuario%></td>
                         <td><%=item.Nombre%></td>
                         <td><%=item.Apellido%></td>
                         <td><%=item.DNI%></td>
                    </tr>
                    <% } %>
            </table>

        </div>

    </div>
</div>

</asp:Content>