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
    public partial class Checkout : System.Web.UI.Page
    {
        public List<ItemCarrito> ListaAux;
        public Usuario pepito;
        public UsuarioNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Usuario Aux= new Usuario();
            negocio = new UsuarioNegocio();
            if (Session["ListaCarrito"] == null) //Si la lista no llegó a instanciarse
            {
                ListaAux = new List<ItemCarrito>();
                Session["ListaCarrito"] = ListaAux;
            }

            if (Session["alguienNuevo"] == null)
            {
                Response.Redirect("Login.aspx");
            }


            //Cargar formsito de datos Dirección
            if (IsPostBack)
            {
                pepito = (Usuario)Session["alguienNuevo"];
                pepito = negocio.CargarDatosEnvio(pepito);
                txtCiudad.Text = pepito.Ciudad.ToString();
                txtCodPost.Text = pepito.CodigoPost.ToString();
                txtDireccion.Text = pepito.Direccion.ToString();
                txtNroTelefono.Text = pepito.NroTelefono.ToString();

                // aca iria la pregunta, si se logueo sigue y sino es un response.redirect al login
                // esta pregunta se hace a traves de la session
            }

            //protected void btnComprar_Click(object sender, EventArgs e)
            //{
            //    PedidosNegocio negocio = new Negocio.PedidosNegocio();
            //    Pedido pedido = new Pedido();
            //    List<ItemCarrito> carrito = (List<ItemCarrito>)Session["ListaCarrito"];
            //    negocio.Agregar(pedido, carrito);



            //}
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            PedidosNegocio negocio = new Negocio.PedidosNegocio();
            Pedido pedido = new Pedido();
            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["ListaCarrito"];
            negocio.Agregar(pedido, carrito);

        }
    }
}