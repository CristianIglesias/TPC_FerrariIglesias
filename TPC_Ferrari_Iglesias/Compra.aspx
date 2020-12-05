<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Compra.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Compra" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">
        <table class="table">
            <h3> COMPRA REALIZA CON EXITO</h3>
            <%foreach (var item in (List<Dominio.ItemCarrito>)Session["ListaCarrito"])
                {%>
            <tr>
                <td><%=item.NombreActual%></td>
                <td><%=item.PrecioActual *item.CantidadPedida %></td>
                <td><%=item.CantidadPedida%></td>
                 <td> <img src="<%=item.UrlImagen%>"  style="width: 60px; height: 60px;" class="card-img-top" /></td>
                

                <td></td>
            </tr>
            <% } %>
        </table>


    </div>





</asp:Content>
