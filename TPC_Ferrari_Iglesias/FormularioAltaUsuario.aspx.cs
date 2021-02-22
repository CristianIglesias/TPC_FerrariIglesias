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
                    if (IdUser != null)
                    { pepito.Id = Convert.ToInt64(IdUser); }
                    pepito.Nombre = txtNombre.Text;
                    pepito.Apellido = txtApellido.Text;
                    pepito.NombreUsuario = txtNombreUsuario.Text;
                    pepito.Contrasenia = txtContraseña.Text;
                    pepito.DNI = txtDNI.Text;
                    pepito.Email = txtEmail.Text;
                    pepito.FechaNacimiento = Convert.ToDateTime(txtFechaNac.Text);
                    pepito.Genero = txtGenero.Text;
                    pepito.NroTelefono = txtTelefono.Text;
                    pepito.CodigoPost = Convert.ToInt32(txtCodPost.Text);
                    pepito.Direccion = txtDireccion.Text;
                    pepito.Ciudad = txtCiudad.Text;
                }


            }
            catch (Exception)
            {

            }
            if (IdUser != null) //Si viene a editar un usuario...
                                //Siento que estamos haciendo rara la edición de los usuarios... Como que no lo veo siendo tan simple en una página web real...
                                //para hacer una edición mas real, necesitaríamos armarle un menú al cliente, donde pueda ver los pedidos que hizo y bueno, capaz también darle la Opción de editarse           
            {
                if (Session.Contents["ListaUsuarios"] == null)
                {
                    Session.Add("ListaUsuarios", negocio.Listar());
                }
                if (!IsPostBack)
                    pepito = ((List<Usuario>)Session.Contents["ListaUsuarios"]).Find(X => X.Id.ToString().Contains(IdUser));

                txtNombre.Text = pepito.Nombre;
                txtApellido.Text = pepito.Apellido;
                txtNombreUsuario.Text = pepito.NombreUsuario;
                txtContraseña.Text = pepito.Contrasenia;
                txtDNI.Text = pepito.DNI;
                txtEmail.Text = pepito.Email;
                txtFechaNac.Text = Convert.ToString(pepito.FechaNacimiento);
                txtGenero.Text = pepito.Genero;
                txtTelefono.Text = pepito.NroTelefono;
                txtCodPost.Text = pepito.CodigoPost.ToString();
                txtDireccion.Text = pepito.Direccion;
                txtCiudad.Text = pepito.Ciudad;
            }//Si viene a editar un usuario...

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {


            //Page.Validate();
            //if (!Page.IsValid)
            //    return;


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
                    pepito.NombreUsuario = txtNombreUsuario.Text;
                    pepito.Contrasenia = txtContraseña.Text;
                    pepito.DNI = txtDNI.Text;
                    pepito.Email = txtEmail.Text;
                    pepito.FechaNacimiento = Convert.ToDateTime(txtFechaNac.Text);
                    pepito.Genero = txtGenero.Text;
                    pepito.NroTelefono = txtTelefono.Text;
                    pepito.CodigoPost = Convert.ToInt32(txtCodPost.Text);
                    pepito.Direccion = txtDireccion.Text;
                    pepito.Ciudad = txtCiudad.Text;
                    pepito.Estado = true;
                    pepito.TipoUsuario = 2;

                    if (pepito.FechaNacimiento <= Convert.ToDateTime("01-01-1900") || pepito.FechaNacimiento > DateTime.Now)
                    {
                        txtFechaNac.Text = "Fecha No Valida.";
                        Response.Redirect("FormularioAltaUsuario.aspx");
                    }



                }
                UsuarioNegocio negocio = new UsuarioNegocio();
                if (pepito.Id == 0)
                {
                    //negocio.AgregarUsuario(pepito);
                    //pepito.Id=negocio.UbicarUltimoID(pepito); //Ubica el id del usuario que se acaba de agregar a la base de datos, para que sea el id de usuario en DatosPersonales     
                    //negocio.AgregarDatosPersonales(pepito); 
                    negocio.AgregarUsuarioCompletoConPa(pepito);
                    Response.Redirect("Exito.aspx");
                }
                else
                {
                    negocio.ModificarUsuario(pepito);
                    negocio.ModificarDatosPersonales(pepito);
                    Response.Redirect("Exito.aspx");
                }

            }
        }
    }
}