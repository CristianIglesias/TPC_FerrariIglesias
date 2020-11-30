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
    public partial class EliminarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Productos productin = new Productos();
            ProductoNegocio negocio = new ProductoNegocio();
            productin.Id = Convert.ToInt64(Request.QueryString["idArticulo"]);
            negocio.BajaLogica(productin);
            Response.Redirect("AbmProductos.aspx");

        }
    }
}