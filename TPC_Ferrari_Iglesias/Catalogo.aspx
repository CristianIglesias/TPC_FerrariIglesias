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
    <div>
    <asp:TextBox runat="server" type="text" class="form-control" ID="txtBuscador" style="margin-bottom:10px; margin-top:20px; width:400px; height:30px;" placeholder="Buscá la remera que querés" />
    
    <asp:Button runat="server"  style="background-color: #007aff;color: white; width:90px;height:39px;text-align: center;font-size: 16px;cursor: pointer; border-radius: 5px;border:none;" ID="btnBuscar" OnClick="btnBuscar_Click" Text="Buscar"/>
    </div>
   <%-- <div class="form-group">
        <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownColor" DataValueField="" DataTextField="">
            
        </asp:DropDownList>
        <asp:DropDownList runat="server">
        </asp:DropDownList>
    </div>--%>

   <%-- <div>   
        <asp:Label Text="alguito" runat="server" />
        <asp:DropDownList runat="server" ID="DdlTipo" CssClass="form-control">
            
        </asp:DropDownList>
    </div>--%>

    <div class="container">
        <div class="row">


            <%      
                foreach (var item in ((List<Dominio.Productos>)Session["ListaCatalogo"]))
                {%>


            <div class="col-lg-4 d-flex align-items-stretch">
                <div class="card" style="width: 18rem; margin-top:30px;">
                    <div class="card-body">
                        <img src="<%=item.Imagen%>" class="card-img-top" alt="...">
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
