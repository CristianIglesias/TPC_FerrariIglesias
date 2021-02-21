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
    public partial class Reporte_Compras_Clientes : System.Web.UI.Page
    {
        public List<Usuario> ListaUsuarios;
        public String IdUser;
        public Usuario pepito;
        public UsuarioNegocio negocio;

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario pepito = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            pepito.Id = Convert.ToInt64(Request.QueryString["idUsuario"]);

            if (Session["alguienNuevo"] != null)
            {
                Usuario usuario;
                usuario = (Usuario)Session["alguienNuevo"];

                if (usuario.TipoUsuario != TipoUsuarioConstante.ADMINISTRADOR)
                {
                    Response.Redirect("Catalogo.aspx");
                }
                //está el admin.






            }
            else
            {
                Response.Redirect("Catalogo.aspx");
            }


        }
    }
}