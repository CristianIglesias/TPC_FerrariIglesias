<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Checkout" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




    <div class="container">



        <%
            if (((List<Dominio.ItemCarrito>)Session.Contents["ListaCarrito"]).Count == 0)
            {
        %>
        <p>Ups, No deberías estar acá :O</p>
        <%
            }
            else
            { %>
        <div class="row">
            <div class="col">
                <table class="table">
                    <tr>
                        <td><strong>Nombre:</strong> </td>

                        <td><strong>Precio:</strong>  </td>
                        <td><strong>Imagen:</strong> </td>


                    </tr>

                    <%
                        foreach (var item in ((List<Dominio.ItemCarrito>)Session["ListaCarrito"]))
                        {
                    %>
                    <tr>
                        <td>
                            <img src="<%=item.UrlImagen%>" style="width: 60px; height: 60px;" class="card-img-top" alt="...">
                        </td>

                        <td>
                            <%=item.NombreActual %>
                        </td>
                        <td><%=item.PrecioActual %></td>

                        <td></td>


                        <td>Cantidad unidades:
                           <%=item.CantidadPedida %>

                        </td>
                        <td>SubTotal
                            <%=item.CantidadPedida * item.PrecioActual%>
                        </td>
                        <td></td>

                    </tr>



                    <%  } //Esta llave cierra el forEach %>

      

                    <%}//Esta llave cierra el else
                    %>
                </table>
                           <a href="" class="btn btn-primary">Comprar Para Mí</a>
                    <a href="Catalogo.aspx" class="btn btn-danger">Cancelar</a>

            </div>
        </div>
    </div>


</asp:Content>
