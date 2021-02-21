<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reporte Compras Clientes.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Reporte_Compras_Clientes" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="background-color:lightslategray; width: 100%; margin-top: 30px;  border-radius:5px;">
        <div class="row">
            <div class="col">
                <table class="table">
                    <tr>
                        <td><strong>ID</strong></td>
                        <td><strong>NOMBRE-USUARIO</strong></td>
                       <%-- <td><strong>CONTRASEÑA</strong></td>--%>
                        <td><strong>NOMBRE</strong></td>
                        <td><strong>APELLIDO</strong></td>
                        <td><strong>DNI</strong></td>
                        <td><strong>TIPO-USUARIO</strong></td>
                        <td><strong>Cantidad Compras</strong></td>
                        <td><strong>Ticket Promedio</strong></td>
                    </tr>
                    <%foreach (var item in ((List<Dominio.Usuario>)Session["ListaUsuarios"]))
                        {%>

                    <tr>
                        <td><%=item.Id %></td>
                        <td><%=item.NombreUsuario%></td>
                        <%--<td><%=item.Contrasenia%></td>--%>
                        <td><%=item.Nombre%></td>
                        <td><%=item.Apellido%></td>
                        <td><%=item.DNI%></td>
                        <td><%=item.TipoUsuario%></td>
                        <td><%       %></td>
                    <td><a href="FormularioAltaUsuario.aspx?idUsuario=<%= item.Id.ToString()%>" class="btn btn-primary">Editar Datos del Usuario </a></td>
                    <td><a href="EliminarUsuario.aspx?idUsuario=<%= item.Id.ToString()%>" class="btn btn-danger">Eliminar del listado.(Baja Lógica)</a></td>
                    </tr>
                    <% } %>
                </table>

            </div>

        </div>
    </div>
                                        <a  href="FormularioAltaUsuario.aspx"   class="btn btn-primary" style="margin-top:30px;">Nuevo Usuario</a>

</asp:Content>

