<%@ Page Title ="Detalle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Detalle" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        

            <div class="col-md-4">
                <div class="card" style="width: 18rem;">


                    <div class="card-body">
                    
                        <img src="<%=Producto.Imagen%>" class="card-img-top" alt="...">
                        <h5 class="card-title" style="font-weight: bold"><% = Producto.Nombre %></h5>
                        <h5 class="card-title" style="font-weight: bold"><% = Producto.Precio %></h5>
                        <a  href="Catalogo.aspx"   class="btn-primary">Volver   </a>
                      

                    </div>


                </div>
            </div>
          
        </div>


</asp:Content>