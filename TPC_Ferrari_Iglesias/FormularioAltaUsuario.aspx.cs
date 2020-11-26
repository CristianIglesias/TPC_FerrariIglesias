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
                //Siento que estamos haciendo rara la edición de los usuarios... Como que no lo veo siendo tan simple en una página web real...
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
                //Desarrollarle la ddl al tipoUsuario.


            }//Si viene a editar un usuario...

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (pepito == null)
                pepito = new Usuario();
            else
            {
                //pedacito de código para cargar el dropdown de la manera fea :)
            }
            if (txtNombre.Text == "" || txtApellido.Text == "" || txtDNI.Text == "" || txtNombreUsuario.Text == "" || txtContraseña.Text == "")//Validaciones de los campos 
            {
                //Cambiar de color los controles y tirar algun tipo de alerta :)
            }
            else
            {
                if (IsPostBack)
                {
                    pepito.Nombre = txtNombre.Text;
                    pepito.Apellido = txtApellido.Text;
                    //pepito.DNI=txtDNI.Text;
                    pepito.NombreUsuario = txtNombreUsuario.Text;
                    pepito.Contrasenia = txtContraseña.Text;
                }
                UsuarioNegocio negocio = new UsuarioNegocio();
                if (pepito.Id == 0) { }
                //negocio.Agregar(pepito);
                else { }
                    //negocio.Modificar(pepito);
        }
    }
}