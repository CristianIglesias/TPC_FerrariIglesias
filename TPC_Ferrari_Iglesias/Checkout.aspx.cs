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
                pepito = (Usuario)Session["alguienNuevo"];
                pepito = negocio.CargarDatosEnvio(pepito); // le mando a pepito que es el usuario completo para despues poder vincularlo con los datos personales

            //Cargar formsito de datos Dirección
            if (!IsPostBack)
            {
                txtCiudad.Text = pepito.Ciudad.ToString();
                txtCodPost.Text = pepito.CodigoPost.ToString();
                txtDireccion.Text = pepito.Direccion.ToString();
                txtNroTelefono.Text = pepito.NroTelefono.ToString();

               
            }

        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            try
            {
                ListaAux = (List<ItemCarrito>)Session["ListaCarrito"];
            PedidosNegocio negocio = new PedidosNegocio();
            
            ItemCarritoNegocio itemCarritoNegocio = new ItemCarritoNegocio();

            Pedido pedido = new Pedido();
            pedido.ImporteTotal = 0;
            foreach (ItemCarrito item in ListaAux) // lista aux tiene al carrito
            {
                pedido.ImporteTotal += item.PrecioActual;
            }
            pedido.Fecha = DateTime.Now;
            pedido.Estado = "1";
            pedido.IdUsuario = pepito.Id;

            negocio.Agregar(pedido);
            long idAux = negocio.UbicarID();
            pedido.IdPedido = idAux;
            foreach (var item in ListaAux)
            {
                //conseguir id 
                item.IdPedido = idAux; // mediante esta asignacion lo que hago es relacionar el id del ultimo pedido obtenido y se lo asigno al item pedido pero del detalle
                itemCarritoNegocio.AgregarDetalle(item); //item ya estaba casi listo para guardarlo en la db solo le faltaba esta magia de asignar los id del pedido para poder despues relacionarlos

            }

           
                Response.Redirect("Compra.aspx");
            }
            catch (Exception)
            {

                throw;
            }


        }
    }
}