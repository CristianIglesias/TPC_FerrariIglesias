<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Compra.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Compra" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container" style="background-color: lightslategray; width: 100%; margin-top: 30px;">
        <div style="margin-top:30px;text-align:center";>
            <h2>-COMPRA REALIZA CON EXITO-</h2>
            <p style="font-weight:bold">Te contactaremos por medio de tu telefono - mail</p>
          
        </div>
        <div class="row">
            <div class="col">
                <table class="table">
                    <tr>
                        <td><strong>Nombre:</strong> </td>
                        <td><strong>Precio:</strong>  </td>
                        <td><strong>Cantidad Unidades:</strong> </td>
                        <td><strong>Imagen:</strong> </td>

                    </tr>

                    <%foreach (var item in (List<Dominio.ItemCarrito>)Session["Compra"])
                        {%>
                    <tr>
                        <td><%=item.NombreActual%></td>
                        <td><%=item.PrecioActual *item.CantidadPedida %></td>
                        <td><%=item.CantidadPedida%></td>
                        <td>
                            <img src="<%=item.UrlImagen%>" style="width: 60px; height: 60px;" class="card-img-top" /></td>


                    </tr>
                    <% } %>
                </table>
            </div>

        </div>
                                    <asp:Label Text="Total" ID="lblTotal"  style="font-weight:bold;margin-right: 100px;" runat="server" />
         
    </div>
     <a href="Catalogo.aspx" class="btn btn-primary" style="margin-top: 40px;margin-bottom:30px">Continuar comprando</a>




</asp:Content>
