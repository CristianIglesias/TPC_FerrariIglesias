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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            user.NombreUsuario = txtUser.Text;
            user.Contrasenia = txtPass.Text;

            //user = negocio.Login(user);
            Usuario alguienNuevo;
            alguienNuevo = negocio.Login(user);
            if (alguienNuevo.Id != 0) // es el valor que hicimos que asuma en el else de negocio si NO coincidia el pass con el nombre de usuario
            {// si si coincide quiere decir que esta logueado entonces hay que preguntar si ya tiene o no cosas en el carrito
                Session.Add("alguienNuevo", alguienNuevo);

                if (Session["ListaCarrito"] != null)
                {
                    Response.Redirect("Carrito.aspx");
                }
                else if (Session["ListaCarrito"] == null)
                {
                    Response.Redirect("Catalogo.aspx");

                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}