using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TPC_Ferrari_Iglesias
{
    public partial class Compra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            if (Session["ListaCarrito"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }
            Session["Compra"] = Session["ListaCarrito"];
            Session["ListaCarrito"] = null;
        }
    }
}