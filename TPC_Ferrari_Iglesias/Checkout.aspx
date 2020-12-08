<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Checkout" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




    <div class="container" style="background-color: lightslategray; width: 100%; margin-top: 30px; border-radius: 5px;">



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
                        <td><strong>Imagen:</strong> </td>
                        <td><strong>Nombre:</strong> </td>
                        <td><strong>Precio:</strong>  </td>
                        <td><strong>Cantidad Unidades:</strong> </td>
                        <td><strong>Subtotal:</strong> </td>

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
            </div>
        </div>
                        

      </div>
    <div  style="text-align:right;margin-top:30px; font-weight:bold;">
    <asp:Label Text="Total" ID="lblTotal"  style="padding:10px; border-radius:5px" class="btn-primary"  runat="server" />
    </div>
        <div class="container" style="background-color: lightslategray;  width: 25%;height: 70%;margin: 100px; border-radius: 5px; margin-top: 30px;">
        <%--  <div class="jumbotron" style="background-color: lightslategray; width: 100%; margin-top: 30px;">--%>
        <%-- SE CIERRA LA TABLE  --%>
        <%-- Se abre el form de Datos de envío. --%>
        <br />

        <p  style="font-weight:bold; font-size:25px">Te lo mandamos acá?</p>

        <div>

            <asp:Label Text="Direccion" runat="server"  style="font-weight:bold" />
            <asp:TextBox runat="server" ID="txtDireccion" style=" width: 100%;height: 100%; border-radius: 5px;" />
            <asp:RequiredFieldValidator ErrorMessage="La DIRECCIÓN es un campo obligatorio" ForeColor="Red" ControlToValidate="txtDireccion" runat="server" />
            <%--                    <asp:RegularExpressionValidator ErrorMessage="Ups, hay algo que salió mal :(" ForeColor="Red" ControlToValidate="txtDireccion" runat="server" ValidationExpression="" />--%>
        </div>
        <div>
            <asp:Label Text="Ciudad" runat="server" style="font-weight:bold" />
            <asp:TextBox runat="server" ID="txtCiudad" style=" width: 100%;height: 100%; border-radius: 5px;" />
            <asp:RequiredFieldValidator ErrorMessage="La DIRECCIÓN es un campo obligatorio" ForeColor="Red" ControlToValidate="txtCiudad" runat="server" />
            <%--    <asp:RegularExpressionValidator ErrorMessage="Ups, hay algo que salió mal :(" ForeColor="Red" ControlToValidate="txtCiudad" runat="server" ValidationExpression="" />--%>
        </div>
        <div>
            <asp:Label Text="Código Postal" runat="server"  style="font-weight:bold" />
            <asp:TextBox runat="server" ID="txtCodPost" style=" width: 100%;height: 100%; border-radius: 5px;" />
            <asp:RequiredFieldValidator ErrorMessage="El CÓDIGO POSTAL es un campo obligatorio" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" />
            <%--                    <asp:RegularExpressionValidator ErrorMessage="Solo aceptamos números" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" ValidationExpression="^[0-9]{1,6}$" />--%>
        </div>

        <p  style="font-weight:bold;  font-size:20px">Este sigue siendo tu Número de teléfono?</p>
        <div>
            <asp:Label Text="Numero de Teléfono" runat="server"  style="font-weight:bold" />
            <asp:TextBox runat="server" ID="txtNroTelefono" style=" width: 100%;height: 100%; border-radius: 5px;" />
            <asp:RequiredFieldValidator ErrorMessage="Lo necesitamos si o si!" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" />
            <%--<asp:RegularExpressionValidator ErrorMessage="Solo aceptamos números" ForeColor="Red" ControlToValidate="txtCodPost" runat="server" ValidationExpression="^[0-9]{1,6}$" />--%>
        </div>
        <asp:Button Text="Comprar" runat="server" ID="btnComprar" Style="margin-top: 30px; margin-bottom:50px; background-color: #007aff; color: white; width: 90px; height: 39px; text-align: center; font-size: 16px; cursor: pointer; border-radius: 5px; border: none;" OnClick="btnComprar_Click" />
    <a href="Catalogo.aspx" class="btn btn-danger">Cancelar</a>

        <%}//Esta llave cierra el else
        %>
    
    </div>

    




</asp:Content>
