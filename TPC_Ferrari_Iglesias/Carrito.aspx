<%@ Page Title="Carrito" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Carrito" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- ESTO ES PARA LINKEARLO CON CSS, EL TEM ES QUE DESPUES LA TABLA HAY QUE HACERLA DESDE CERO
    <asp:Content ContentPlaceHolderID="Style" runat="server">
 <link href="../css/Carrito.css" rel="stylesheet" type="text/css" />
    </asp:Content>--%>


    <div class="container">



        <%
            if (((List<Dominio.Productos>)Session.Contents["ListaCarrito"]).Count == 0)
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
                        foreach (var item in ((List<Dominio.Productos>)Session["ListaCarrito"]))
                        {
                    %>

                    <tr>
                        <td>
                            <%=item.Nombre %>
                        </td>
                        <td><%=item.Precio %></td>
                        <td>
                            <img src="<%=item.Imagen%>" style="width: 60px; height: 60px;" class="card-img-top" alt="...">
                        </td>

                        <td></td>


                        <td>Cantidad unidades:
                            <%-- Sumar unidades --%>

                        </td>
                        <td>SubTotal
                            <%--Calcular Unidades * precio Unitario --%>
                        </td>
                        <td>
                            <a href="Detalle.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-primary">Detalle</a>
                            <a href="Carrito.aspx?idArticulo=<%=item.Id.ToString()%>&extra=<%=1.ToString()%>" class="btn btn-danger">Eliminar</a>

                        </td>

                    </tr>



                    <%  } //Esta llave cierra el forEach
                        }//Esta llave cierra el else
                    %>
                </table>
                <a href="Catalogo.aspx" class="btn btn-primary">Seguir Comprando</a>

            </div>
        </div>
    </div>


</asp:Content>
