<%@ Page Title="Catalogo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Catalogo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <%-- <p>Acá no calculo que debería haber algun tipo de "dropdown" para filtrar los items por Modelo/Color/estampa?</p>
    <div class="row">
    <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
Filtrar por Modelo 
  </button>
       
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Cuello redondo</a>
    <a class="dropdown-item" href="#">Escote en "v"</a>
    <a class="dropdown-item" href="#">Musculosas</a>
  </div>
</div>
       <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
Filtrar por Color 
  </button>
       
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Cuello redondo</a>
    <a class="dropdown-item" href="#">Escote en "v"</a>
    <a class="dropdown-item" href="#">Musculosas</a>
  </div>
</div>
       <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
Filtrar por Tamaño 
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Cuello redondo</a>
    <a class="dropdown-item" href="#">Escote en "v"</a>
    <a class="dropdown-item" href="#">Musculosas</a>
  </div>
</div>
        </div> --%>
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://i.pinimg.com/564x/05/5a/76/055a76df0b82356df7a157a8ad038611.jpg" class="d-block w-100" alt="..." style="height: 300px; width: 100px">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/564x/41/79/aa/4179aa2b7e8aab362b012aecd919b225.jpg" class="d-block w-100" alt="..." style="height: 300px; width: 100px">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/564x/3a/9f/77/3a9f77289952c946df209326f9f6db11.jpg" class="d-block w-100" alt="..." style="height: 300px; width: 100px">
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
    </div>
    <div class="row">
        <%foreach (var item in Listinha)
            {%>

        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <img src="<%=item.Imagen%>" class="card-img-top" alt="...">
                    <h5 class="card-title"><%=item.Nombre %></h5>
                    <h5 class="card-title"><%=item.Precio %></h5>
                    <a href="Contact.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-primary">Ver detalle</a>
                    <a href="Agregar.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-primary">Agregar</a>

                </div>
            </div>
        </div>

        <%  } %>
    </div>


</asp:Content>
