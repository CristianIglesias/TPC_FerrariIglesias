<%@ Page Title="ABM Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AbmProductos.aspx.cs" Inherits="TPC_Ferrari_Iglesias.ABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <%--        <div class="row">

            <asp:GridView ID="DgvProductos" CssClass="table-primary" runat="server">
            </asp:GridView>
            <br />--%>
        <div class="row">
            <%foreach (var item in listaABM)
                {
            %>

            <div class="col-md-4">
                <div class="card" style="width: 18rem;">


                    <div class="card-body">
                    
                        <img src="<%=item.Imagen%>" class="card-img-top" alt="...">
                        <h5 class="card-title" style="font-weight: bold"><% = item.Nombre %></h5>
                        <h5 class="card-title" style="font-weight: bold"><% = item.Precio %></h5>
                        <a  href="FormularioAlta.aspx?idArticulo=<%= item.Id.ToString()%>"   class="btn btn-primary">Editar Articulo    </a>
                        <a  href="FormularioAlta.aspx?idArticulo=<%= item.Id.ToString()%>"   class="btn btn-danger">Eliminar Articulo  </a>

                    </div>


                </div>
            </div>
            <%} %>
        </div>

        <%--   </div>

        <div>
            <a runat="server" href="/FormularioAlta   " class="btn-primary">Editar Articulo    </a>
            <a runat="server" href="/FormularioAlta   " class="btn btn-danger">Eliminar Articulo  </a>
            <a runat="server" href="/FormularioAlta" class="btn-primary">Nuevo Articulo     </a>
        </div>--%>
    </div>

    <a runat="server" href="/FormularioAlta" class="btn btn-primary">Nuevo Articulo     </a>




</asp:Content>
