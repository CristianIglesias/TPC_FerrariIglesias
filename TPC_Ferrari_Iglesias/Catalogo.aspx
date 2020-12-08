<%@ Page Title="Catalogo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Catalogo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
    <asp:TextBox runat="server" type="text" class="form-control" ID="txtBuscador" style="margin-bottom:10px; margin-top:20px; " placeholder="Buscá la remera que querés" />
    
    <asp:Button runat="server"  style="background-color: #007aff;color: white; width:90px;height:39px;text-align: center;font-size: 16px;cursor: pointer; border-radius: 5px;border:none;" ID="btnBuscar" OnClick="btnBuscar_Click" Text="Buscar"/>
    </div>

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
