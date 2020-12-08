<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="DetalleCompra.aspx.cs" Inherits="TPC_Ferrari_Iglesias.DetalleCompra" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- va a recibir un id pedido en la querystring y va a mostrar los detalles del mismo al user :) --%>

    
    <div class="container" style="background-color:lightslategray; width: 100%; margin-top: 30px;">



        <%
            if (((List<Dominio.ItemCarrito>)Session.Contents["ListaDetalle"]).Count == 0)
            {
   
                Response.Redirect("Catalogo.aspx");
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
                        <td><strong>Cantidad Unidades:</strong> </td>
                        <td><strong>Subtotal:</strong> </td>                        
                    </tr>

                    <%
                        foreach (var item in ((List<Dominio.ItemCarrito>)Session["ListaDetalle"]))
                        {
                    %>
                    <tr>
                        <td>
                            <%=item.NombreActual %>
                        </td>
                        <td>
                            $<%=item.PrecioActual %></td>
                        <td>
                            <img src="<%=item.UrlImagen%>" style="width: 60px; height: 60px;" class="card-img-top" alt="...">
                        </td>
                        <td>
                           <%=item.CantidadPedida %>
                        </td>
                        <td>$
                            <%=item.CantidadPedida * item.PrecioActual%>
                        </td>
                    </tr>

                    <%  } //Esta llave cierra el forEach

                        }//Esta llave cierra el else
                    %>
                </table>
            </div>
        </div>
    </div>
    <div style="margin-top:30px;">
    <a href="Catalogo.aspx" class="btn btn-primary" >Seguir Comprando</a>
    <a href="Checkout.aspx" class="btn btn-primary">Comprar</a>
    </div>


</asp:Content>

