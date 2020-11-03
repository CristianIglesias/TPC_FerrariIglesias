<%@ Page Title ="Catalogo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Catalogo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <p>Acá no calculo que debería haber algun tipo de "dropdown" para filtrar los items por Modelo/Color/estampa?</p>
    <div class="row">
    <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
Filtrar por Modelo 
  </button>
        <%-- No es falso el hecho de que estoy robando descaradamente de la documentación de Bootstrap --%>
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
        <%-- No es falso el hecho de que estoy robando descaradamente de la documentación de Bootstrap --%>
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
        <%-- No es falso el hecho de que estoy robando descaradamente de la documentación de Bootstrap --%>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Cuello redondo</a>
    <a class="dropdown-item" href="#">Escote en "v"</a>
    <a class="dropdown-item" href="#">Musculosas</a>
  </div>
</div>
        </div> 

</asp:Content>