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
    public partial class FormularioAltaUsuario : System.Web.UI.Page
    {
        public String IdUser;
        public Usuario pepito;
        public UsuarioNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            IdUser = Request.QueryString["idUsuario"];
            pepito = new Usuario();
            negocio = new UsuarioNegocio();

            try
            {
                if (IsPostBack)
                {
                    pepito.Nombre = txtNombre.Text;
                    pepito.Apellido = txtApellido.Text;
                    //pepito.DNI=txtDNI.Text;
                    pepito.NombreUsuario = txtNombreUsuario.Text;
                    pepito.Contrasenia = txtContraseña.Text;
                }
                

            }
            catch (Exception)
            {

            }
            if (IdUser!=null) //Si viene a editar un usuario...
            {
                if(Session.Contents["ListaUsuarios"]==null)
                {
                    Session.Add("ListaUsuarios", negocio.Listar());
                }
                pepito = ((List<Usuario>)Session.Contents["ListaUsuarios"]).Find(X => X.Id.ToString().Contains(IdUser));
                txtNombre.Text = pepito.Nombre;
                txtApellido.Text = pepito.Apellido;
                txtDNI.Text = pepito.DNI.ToString();
                txtNombreUsuario.Text = pepito.NombreUsuario;
                txtContraseña.Text = pepito.Contrasenia;
                



            }














        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}