<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Ferrari_Iglesias._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>TPC FERRARI IGLESIAS </h1>
        <p class="lead">Nada, vamos a dejar una pagina de inicio copada, o por lo menos eso proyectamos :) </p>
        <p>Cris se puso a probar grillas a las 0:41 am. Tengamos paciencia.</p>


        <div class="container">
            <div class="row">
                <%-- Arranca FILA --%>
                <div class="col-sm">
                    <%-- Primera Columna --%>

                    <div class="media">                    <%-- Tarjeta --%>

                        <img class="mr-3" src="asdasd" alt="Generic placeholder image">
                        <div class="media-body">
                            <h5 class="mt-0">NombreDelItem</h5>
                            <h6>Descripción del item</h6>
                        </div>
                    </div>
                </div>
                <%-- Segunda columna, --%>

                <div class="col-sm">
                    <div class="media">                    <%-- Tarjeta --%>

                        <img class="mr-3" src="asdasd" alt="Generic placeholder image">
                        <div class="media-body">
                            <h5 class="mt-0">NombreDelItem</h5>
                            <h6>Descripción del item</h6>
                        </div>
                    </div>

                </div>
                <%-- Tercera Columna --%>
                <div class="col-sm">
                    <div class="media">                    <%-- Tarjeta --%>
                        <img class="mr-3" src="asdasd" alt="Generic placeholder image">
                        <div class="media-body">
                            <h5 class="mt-0">NombreDelItem</h5>
                            <h6>Descripción del item</h6>
                        </div>
                    </div>

                </div>

            </div>
            <%--Esto cierra las FILAS  --%>
        </div>
    </div>

</asp:Content>
