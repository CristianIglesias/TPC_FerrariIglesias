<%@ Page Title="ABM Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AbmProductos.aspx.cs" Inherits="TPC_Ferrari_Iglesias.ABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <%--        <div class="row">

            <asp:GridView ID="DgvProductos" CssClass="table-primary" runat="server">
            </asp:GridView>
            <br />--%>
    <div class="container">
        <div class="row">
            <div class="col">
                <table class="table">
                    <tr>
                        <td><strong>Nombre: </strong></td>
                        <td><strong>Precio:</strong>   </td>
                        <td><strong>Color: </strong></td>
                        <td><strong>Talle:</strong>   </td>
                        <td><strong>Descripción:</strong>  </td>
                        <td><strong>TipoRemera</strong></td>
                        <td><strong>Imagen:</strong>  </td>
                        <td><strong>Acciones: </strong></td>
                    </tr>
                    <%//foreach (var item in listaABM)
                        foreach (var item in ((List<Dominio.Productos>)Session["ListaCatalogo"]))
                        {
                    %>


                    <tr>

                        <td><%=item.Nombre %>  </td>
                        <td><%=item.Precio %> </td>
                        <td><%=item.Color%> </td>
                        <td><%=item.Talle %></td>
                        <td><%=item.Descripcion%> </td>
                       <td><%=item.TipoRemera.Descripcion %></td>
                        <td>
                            <img src="<%=item.Imagen%>" class="card-img-top" alt="..." style="width: 50px">
                        </td>

                        <td><a href="FormularioAlta.aspx?idArticulo=<%= item.Id.ToString()%>" class="btn btn-primary">Editar Articulo </a></td>
                        <td><a href="FormularioAlta.aspx?idArticulo=<%= item.Id.ToString()%>" class="btn btn-danger">Eliminar Articulo</a></td>
                    </tr>



                    <%--  <div class="col-md-4">
                <div class="card" style="width: 18rem;">


                    <div class="card-body">
                    
                        <img src="<%=item.Imagen%>" class="card-img-top" alt="...">
                        <h5 class="card-title" style="font-weight: bold"><% = item.Nombre %></h5>
                        <h5 class="card-title" style="font-weight: bold"><% = item.Precio %></h5>
                        <a  href="FormularioAlta.aspx?idArticulo=<%= item.Id.ToString()%>"   class="btn btn-primary">Editar Articulo    </a>
                        <a  href="FormularioAlta.aspx?idArticulo=<%= item.Id.ToString()%>"   class="btn btn-danger">Eliminar Articulo  </a>

                    </div>


                </div>
            </div>--%>
                    <%} %>

                </table>
                        <a  href="FormularioAlta.aspx"   class="btn btn-primary">Nuevo Producto!</a>
            </div>
        </div>

    </div>





</asp:Content>
