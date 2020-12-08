<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpcionesUsuario.aspx.cs" Inherits="TPC_Ferrari_Iglesias.OpcionesUsuario" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <a href="AbmUsuarios" class="btn btn-primary" visible="false" id="btnAbmUsuarios" style="margin-bottom:20px; margin-top:20px;" runat="server">Acceso al ABM Usuarios</a>
    <div class="container" style="background-color: lightslategray; width: 100%; margin-top: 30px; border-radius:5px;">

<%--                <a id="btnEditarUser" runat="server"  href="FormularioAltaUsuario.aspx?idUsuario=<%=((Dominio.Usuario)Session.Contents["alguienNuevo"]).Id%>"  visible="false"   class="btn btn-primary">Editar Datos Personales </a>--%>

        <%
            if (((List<Dominio.Pedido>)Session.Contents["ListaPedidos"]).Count == 0)
            {
        %>
        <p>Ups, No tenés pedidos Registrados! </p>

        <%
                //Response.Redirect("Catalogo.aspx");
                //Lo comento porque puede ser que el usuario quiera editar datos, mas que ver pedidos. Está bien que muestre la página vacía 
            }
            else
            { %>

        <div class="row">
            <div class="col">
                <table class="table">
                    <tr>
                        <td><strong>Fecha:</strong> </td>
                        <td><strong>Nro de Orden:</strong> </td>
                        <td><strong>Importe:</strong>  </td>
                        <td><strong>Estado:</strong>  </td>
                    </tr>

                    <%
                        foreach (var item in ((List<Dominio.Pedido>)Session["ListaPedidos"]))
                        {
                    %>
                    <tr>
                        <td>
                            <%=item.Fecha %>
                        </td>
                        <td><%=item.IdPedido %>

                        </td>
                        <td>
                            <%=item.ImporteTotal%>
                        </td>
                        <td>
                            <%=item.Estado%>
                        </td>

                        <td>
                            <a href="DetalleCompra.aspx?IdPedido=<%=item.IdPedido%>" class="btn btn-primary">Ver detalle de compra</a>
                        </td>

                    </tr>


                    <%  } //Esta llave cierra el forEach

                        }//Esta llave cierra el else
                    %>
                </table>
            </div>
        </div>
    </div>
    <div style="margin-top: 30px;">
        <a href="Catalogo.aspx" class="btn btn-primary">Seguir Comprando</a>
   <%--     <a href="Checkout.aspx" class="btn btn-primary">Comprar</a>--%>
    </div>


</asp:Content>
