<%@ Page Title ="Carrito" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Carrito" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <a  href="Catalogo.aspx"   class="btn btn-primary">Volver</a>
 <div class="container">
    <div class="row">
       <div class="col">
            <table class="table">
               <tr>
                   <td> <strong> Nombre:</strong> </td>
                   
                    <td> <strong> Precio:</strong>  </td>
                   <td><strong> Imagen:</strong> </td>
                 

                   </tr>
               
        <%foreach (var item in ListaAux)
            {%>
            
                 <tr>
                    <td>
                        <%=item.Nombre %>
                    </td>
                      <td><%=item.Precio %></td>
                    <td>
                       <img src="<%=item.Imagen%>"style="width:60px; height:60px;" class="card-img-top" alt="..." > 
                    </td>
                   
                    <td></td>

                    <td>
                        <a href="Detalle.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-primary">Detalle</a>
                         <a href="Detalle.aspx?idArticulo=<%=item.Id.ToString()%>" class="btn btn-danger">Eliminar</a>

                    </td>

                </tr>

    

        <%  } %>
                 </table>
                </div>
                </div>
       </div>


</asp:Content>