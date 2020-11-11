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
    public partial class Catalogo : System.Web.UI.Page
    {
        public List<Productos> Listinha;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            Listinha =  negocio.Listar();
            Session.Add("ListaArticulos", Listinha);// para que sirve??


        }
    }
}