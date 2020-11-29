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

        

        //protected void btnIngresar_Click(object sender, EventArgs e)
        //{
        //    Usuario user = new Usuario();
        //    UsuarioNegocio negocio = new UsuarioNegocio();
        //    user.NombreUsuario = txtUser.Text;
        //    user.Contrasenia = txtPass.Text;

        //    user = negocio.Login(user);
        //    if (user.Id !=0)
        //    {
        //        Response.Redirect("Catalogo.aspx"); //aca deberia ir a la pagina de pago?
        //    }
        //    else
        //    {
        //        Response.Redirect("Login.aspx");
        //    }

        //}
    }
}