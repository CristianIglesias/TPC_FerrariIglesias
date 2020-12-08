using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
namespace TPC_Ferrari_Iglesias
{
    public partial class SiteMaster : MasterPage
    {
        //public List<Productos> ListaCatalogo;
        //public List<Productos> ListaCarrito;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["alguienNuevo"] != null)
            {
                Usuario usuario;
                usuario = (Usuario) Session["alguienNuevo"];
                NombreUsuario.InnerText = usuario.NombreUsuario;
                btnLogOut.Visible = true;
                //nombreUsuario es el id que tiene la p el  el front en el nav bar

                nvIniciarS.Visible = false; // oculta el elemento
                nvOpcionesUsuario.Visible = true; //muestra el botoncito para llegar a las opciones de usuario.

                if (Session["ListaCarrito"] != null)
                {
                    List<ItemCarrito> ListaAux = (List<ItemCarrito>)Session["ListaCarrito"];
                    int CantidadCarrito = 0;
                    foreach (var item in ListaAux)
                    {
                        CantidadCarrito += item.CantidadPedida;
                    }
                    lblContadorCarro.Text = "Items En Carrito: "+ CantidadCarrito.ToString();
                    lblContadorCarro.Visible = true;
                }
                

                if(usuario.TipoUsuario == TipoUsuarioConstante.ADMINISTRADOR)
                {
                    nvHome.Visible = true; // si no es el admin 
                    nvOpcionesUsuario.InnerText = "Listado De Compras/ Opciones de Administrador.";
                }
                
            }

            
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            
            Session["alguienNuevo"] = null;
            Session["ListaPedidos"] = null;

            Response.Redirect("Catalogo.aspx");
        }
    }
}