<%@ Page Title ="Carrito" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Carrito" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <div class="row">
        <%foreach (var item in ListaAux)
            {%>

        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <img src="<%=item.Imagen%>" class="card-img-top" alt="...">
                    <h5 class="card-title"><%=item.Nombre %></h5>
                    <h5 class="card-title"><%=item.Precio %></h5>
                    <a href="Detalle.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-primary">Ver detalle</a>
                    <a  href="Catalogo.aspx"   class="btn-primary">Volver   </a>

                </div>
            </div>
        </div>

        <%  } %>
    </div>


</asp:Content>