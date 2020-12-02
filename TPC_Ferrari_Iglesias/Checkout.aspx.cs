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
    public partial class Checkout : System.Web.UI.Page
    {
        public List<ItemCarrito> ListaAux;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ListaCarrito"] == null) //Si la lista no llegó a instanciarse
            {
                ListaAux = new List<ItemCarrito>();
                Session["ListaCarrito"] = ListaAux;
            }
        }
    }
}