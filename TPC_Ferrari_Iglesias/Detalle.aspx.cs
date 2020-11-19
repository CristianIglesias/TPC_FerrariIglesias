using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Ferrari_Iglesias
{
    public partial class Detalle : System.Web.UI.Page
    {
        public List<Productos> Listita;
        public Productos Producto;
        int IdAux;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                Listita = negocio.Listar(); // lista lo que hay
                IdAux = Convert.ToInt32(Request.QueryString["IdArticulo"]); // se trae ese id y se lo asigna a idaux
                Producto = Listita.Find(x => x.Id == IdAux); // en esa listita va a buscar el id y va a guardar ese objeto entero 
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}