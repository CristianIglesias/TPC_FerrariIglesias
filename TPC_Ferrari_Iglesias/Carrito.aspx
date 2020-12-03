<%@ Page Title="Carrito" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Carrito" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- ESTO ES PARA LINKEARLO CON CSS, EL TEM ES QUE DESPUES LA TABLA HAY QUE HACERLA DESDE CERO
    <asp:Content ContentPlaceHolderID="Style" runat="server">
 <link href="../css/Carrito.css" rel="stylesheet" type="text/css" />
    </asp:Content>--%>


    <div class="container" style="background-color:lightslategray; width: 100%; margin-top: 30px;">



        <%
            if (((List<Dominio.ItemCarrito>)Session.Contents["ListaCarrito"]).Count == 0)
            {
        %>
        <p>Ups, tu carrito está vacío </p>
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
                            <%=item.NombreActual %>
                        </td>
                        <td><%=item.PrecioActual %></td>
                        <td>
                            <img src="<%=item.UrlImagen%>" style="width: 60px; height: 60px;" class="card-img-top" alt="...">
                        </td>

                        <td></td>


                        <td>Cantidad unidades:
                           <%=item.CantidadPedida %>

                        </td>
                        <td>SubTotal
                            <%=item.CantidadPedida * item.PrecioActual%>
                        </td>
                        <td>
                            <a href="Detalle.aspx?idArticulo=<%=item.IdProducto.ToString()%>" class="btn btn-primary">Detalle</a>
                            <a href="Carrito.aspx?idArticulo=<%=item.IdProducto.ToString()%>&extra=<%=1.ToString()%>" class="btn btn-danger">Eliminar</a>

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
