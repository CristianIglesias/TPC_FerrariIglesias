<%@ Page Title="Catalogo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Catalogo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <%-- <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://i.pinimg.com/564x/05/5a/76/055a76df0b82356df7a157a8ad038611.jpg" class="d-block w-100" alt="..." style="height: 500px; width: 100px">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/564x/41/79/aa/4179aa2b7e8aab362b012aecd919b225.jpg" class="d-block w-100" alt="..." style="height: 500px; width: 100px">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/564x/3a/9f/77/3a9f77289952c946df209326f9f6db11.jpg" class="d-block w-100" alt="..." style="height: 500px; width: 100px">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>--%>
    <asp:TextBox runat="server" type="text" class="form-control" ID="txtBuscador" placeholder="acá tenés que escribir bo'" />

    <asp:Button runat="server" ID="btnBuscar" OnClick="btnBuscar_Click"/>

    <div class="form-group">
        <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownColor" DataValueField="" DataTextField="">
            <%-- todo eso queda de ejemplo de las cositas que tenemos que tocar :) --%>
        </asp:DropDownList>
        <asp:DropDownList runat="server">
        </asp:DropDownList>
    </div>
    <div class="container">
        <div class="row">


            <%foreach (var item in ((List<Dominio.Productos>)Session["ListaCatalogo"]))
                {%>


            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img src="<%=item.Imagen%>" class="card-img-top" width="280" alt="...">
                        <h5 class="card-title">Producto: <%=item.Nombre %></h5>
                        <h5 class="card-title">Precio: $<%=item.Precio %></h5>
                        <a href="Detalle.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-primary">Ver detalle</a>
                        <a href="Carrito.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-primary">Agregar</a>

                    </div>
                </div>
            </div>


            <%  } %>
        </div>
    </div>


</asp:Content>
