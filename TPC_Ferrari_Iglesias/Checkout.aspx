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
                </table>
                <%-- SE CIERRA LA TABLE  --%>
                <%-- Se abre el form de Datos de envío. --%>
                

                <p>Te lo mandamos acá Rey?</p>
                
                <div>
                    <asp:Label Text="Direccion" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="caja" />
                    <asp:RequiredFieldValidator ErrorMessage="La DIRECCIÓN es un campo obligatorio" ForeColor="Red" ControlToValidate="txtDireccion" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Ups, hay algo que salió mal :(" ForeColor="Red" ControlToValidate="txtDireccion" runat="server" ValidationExpression="" />
                </div>
                <div>
                    <asp:Label Text="Ciudad" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtCiudad" CssClass="caja" />
                    <asp:RequiredFieldValidator ErrorMessage="La DIRECCIÓN es un campo obligatorio" ForeColor="Red" ControlToValidate="txtCiudad" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Ups, hay algo que salió mal :(" ForeColor="Red" ControlToValidate="txtCiudad" runat="server" ValidationExpression="" />
                </div>
                <div>
                    <asp:Label Text="Código Postal" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtCodPost" CssClass="caja" />
                    <asp:RequiredFieldValidator ErrorMessage="El CÓDIGO POSTAL es un campo obligatorio" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo aceptamos números" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" ValidationExpression="^[0-9]{1,6}$" />
                </div>

                <p>Este sigue siendo tu Número de teléfono?</p>
                <div>
                    <asp:Label Text="Numero de Teléfono" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtNroTelefono" CssClass="caja" />
                    <asp:RequiredFieldValidator ErrorMessage="Lo necesitamos si o si!" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo aceptamos números" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" ValidationExpression="^[0-9]{1,6}$" />
                </div>


                <%}//Esta llave cierra el else
                %>
            </div>


        </div>
        <asp:Button Text="Comprar." runat="server" ID="btnComprar" OnClick="btnComprar_Click" />
        <a href="Catalogo.aspx" class="btn btn-danger">Cancelar</a>

    </div>


</asp:Content>
