using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Data.SqlTypes;
namespace TPC_Ferrari_Iglesias
{

    public partial class DetalleCompra : System.Web.UI.Page
    {
        public Pedido pedidin;
        public List<Pedido> ListaPedidos;
        public PedidosNegocio negociopedidos;
        public List<ItemCarrito> listaItems;
        public ItemCarritoNegocio negocioItems;
        public int IdAux;
        public EstadoPedido statusPedido;
        public EstadoPedidoNegocio negocioEstados;
        public List<EstadoPedido> listaDdlEstados;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["alguienNuevo"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            pedidin = new Pedido();
            ListaPedidos = new List<Pedido>();
            negociopedidos = new PedidosNegocio();
            listaItems = new List<ItemCarrito>();
            negocioItems = new ItemCarritoNegocio();


            IdAux = Convert.ToInt32(Request.QueryString["IdPedido"]);

            if (Session["Compra"] == null)
            {
                Session["Compra"] = listaItems;
            }


            //SqlMoney AcumuladorImporte = 0;
            //foreach (var item in (List<ItemCarrito>)Session["Compra"])
            //{
            //    AcumuladorImporte += (item.CantidadPedida * item.PrecioActual);
            //}
            //lblTotal.Text = "Total a Pagar = " + AcumuladorImporte.ToString();


            if (((Usuario)Session["alguienNuevo"]).TipoUsuario == TipoUsuarioConstante.ADMINISTRADOR)
            {
                DdlEstados.Visible = true;
                statusPedido = new EstadoPedido();
                negocioEstados = new EstadoPedidoNegocio();

                if (!IsPostBack)
                {
                    listaDdlEstados = negocioEstados.Listar();
                    DdlEstados.DataSource = listaDdlEstados;
                    DdlEstados.DataValueField = "Id";
                    DdlEstados.DataTextField = "Descripcion";

                    DdlEstados.DataBind();
                }


            }

            if (Session["ListaDetalle"] == null)
            {
                Session.Add("ListaDetalle", listaItems);
            }
            if (IdAux != 0)
            {
                ListaPedidos = negociopedidos.Listar();
                pedidin = ListaPedidos.Find(x => x.IdPedido == IdAux);
                listaItems = negocioItems.Listar(pedidin);
                Session.Add("ListaDetalle", listaItems);
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int indice;

            pedidin.Estado = Convert.ToByte(DdlEstados.SelectedValue);

            negociopedidos.ActualizarEstado(pedidin);

            ListaPedidos = (List<Pedido>)Session["ListaPedidos"];

            indice=ListaPedidos.FindIndex(x => x.IdPedido == pedidin.IdPedido);

            ListaPedidos[indice].Estado = pedidin.Estado;
            
            Session["ListaPedidos"] = ListaPedidos;

        }
    }
}