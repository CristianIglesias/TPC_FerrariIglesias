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
    public partial class EliminarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario pepito = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            pepito.Id = Convert.ToInt64(Request.QueryString["idUsuario"]);
            negocio.BajaLogica(pepito);
            Response.Redirect("AbmUsuarios.aspx");
        }
    }
}