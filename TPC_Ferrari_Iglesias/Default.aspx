<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Ferrari_Iglesias._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>TPC FERRARI IGLESIAS </h1>
        <p class="lead">Nada, vamos a dejar una pagina de inicio copada, o por lo menos eso proyectamos :) </p>
        <p>Cris se puso a probar grillas a las 0:41 am. Tengamos paciencia.</p>


        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="media">
                        <img class="mr-3" src="data:image/png;base64,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" alt="Generic placeholder image">
                        <div class="media-body">
                            <h5 class="mt-0">Cris medio borracho inspirado en la tarea</h5>
                            Estas cosas suelen pasar, Cris tenía pensado irse a dormir temprano, pero decidió hacerse un café y ponerse a codear el diseño de una página web, no es divertido?

                        </div>
                    </div>
                    <div class="img"></div>

                    <p>
                        vamo a ver que onda, no?

                    </p>

                </div>
            </div>
            <div class="col-sm">
                One of three columns
            </div>
            <div class="col-sm">
                One of three columns
            </div>
        </div>
    </div>
    <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

</asp:Content>
