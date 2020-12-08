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
    
    public partial class DetalleCompra : System.Web.UI.Page
    {
        public Pedido pedidin;
        public List<Pedido> ListaPedidos;
        public PedidosNegocio negociopedidos;
        public List<ItemCarrito> listaItems;
        public ItemCarritoNegocio negocioItems;
        public int IdAux;
        protected void Page_Load(object sender, EventArgs e)
        {
            pedidin = new Pedido();
            ListaPedidos = new List<Pedido>();
            negociopedidos = new PedidosNegocio();
            listaItems = new List<ItemCarrito>();
            negocioItems = new ItemCarritoNegocio();

            IdAux= Convert.ToInt32(Request.QueryString["IdPedido"]);

            if (Session["ListaDetalle"] == null)
            {
                Session.Add("ListaDetalle", listaItems);
            }
            if(IdAux != 0)
            {
                ListaPedidos = negociopedidos.Listar();
                pedidin = ListaPedidos.Find(x => x.IdPedido == IdAux);
                listaItems = negocioItems.Listar(pedidin);
                Session.Add("ListaDetalle", listaItems);
            }

        }
    }
}