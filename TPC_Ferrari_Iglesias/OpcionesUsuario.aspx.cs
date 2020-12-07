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
    public partial class OpcionesUsuario : System.Web.UI.Page
    {
        public Usuario user;
        public UsuarioNegocio negocio;
        public Pedido esteEspecifico;
        public PedidosNegocio negocioPedidos;
        public List<Pedido> listaPedidos;
        protected void Page_Load(object sender, EventArgs e)
        {           //Vamos por partes.

            negocio = new UsuarioNegocio();
            esteEspecifico = new Pedido();
            listaPedidos = new List<Pedido>();
            negocioPedidos = new PedidosNegocio();
            EstadoPedidoNegocio estadonegocio = new EstadoPedidoNegocio();

            List<EstadoPedido> ListaEstados = estadonegocio.Listar();


            user = (Usuario)Session["alguienNuevo"];

            //Instanciamos variables y cargamos el usuario.

            if (user == null) //chequeo que haya un usuario.
            {
                Response.Redirect("Login.aspx");
            }
            if (user.TipoUsuario == TipoUsuarioConstante.ADMINISTRADOR)//Si el user es ADMIN, TENGO QUE HABILITARLE UNA MANERA DE EDITAR LOS ESTADOS DE LOS PEDIDOS.
            {//bueno, cargar las listas.
                if (Session["ListaPedidos"] == null)
                {
                    listaPedidos = negocioPedidos.Listar();
                    Session.Add("ListaPedidos", listaPedidos);
                }

            }
            else //Si el user es Cliente
            {
                if (Session["ListaPedidos"] == null)
                {
                    listaPedidos = negocioPedidos.ListarPorUser(user.Id);
                    Session.Add("ListaPedidos", listaPedidos);
                }

            }
            ///OPCIONESusuario.aspx.cs

        }
    }
}