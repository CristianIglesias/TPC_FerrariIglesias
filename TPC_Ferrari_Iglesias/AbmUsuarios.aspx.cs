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
    public partial class AbmUsuarios : System.Web.UI.Page
    {
        public List<Usuario> ListaUsuarios;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocioUsuario = new UsuarioNegocio();
            ListaUsuarios = negocioUsuario.Listar();

            //ListaUsuarios = negocioUsuario.ListarConView();

             
            Session.Add("ListaUsuarios", ListaUsuarios);

            if (Session["alguienNuevo"] != null)
            {
                Usuario usuario;
                usuario = (Usuario)Session["alguienNuevo"];


                if (usuario.TipoUsuario != TipoUsuarioConstante.ADMINISTRADOR)
                {
                    Response.Redirect("Catalogo.aspx");
                }
                
            }
            else
            {
                Response.Redirect("Catalogo.aspx");
            }



        }
    }
}