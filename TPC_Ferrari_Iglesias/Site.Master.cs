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
            //ProductoNegocio negocio = new ProductoNegocio();
            //if (!IsPostBack) //en la primera vuelta que se carga el master, nos declara y carga la lista catalogo pero solo declara la lista carrito.
            //{
            //    ListaCatalogo = new List<Productos>();
            //    ListaCarrito = new List<Productos>();
            //    ListaCatalogo = negocio.Listar();

            //    Session.Add("ListaCatalogo", ListaCatalogo);
            //    Session.Add("ListaCarrito", ListaCarrito);
            //}

        }
    }
}