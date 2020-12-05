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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["alguienNuevo"] == null)
            {
                Response.Redirect("Login.aspx");
            }
             else if (((Usuario)Session["alguienNuevo"]).TipoUsuario != 1)
            {
                Response.Redirect("Catalogo.aspx");
            }
        }
    }
}