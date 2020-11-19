using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TPC_Ferrari_Iglesias
{
    public partial class ABM : System.Web.UI.Page
    {
        public List<Productos> listaABM { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
                ProductoNegocio Carlos = new ProductoNegocio();
                listaABM = Carlos.Listar();
                Session.Add("ListaCatalogo", listaABM);           
            //DgvProductos.DataSource = negocio.Listar();
            //DgvProductos.DataBind();
        }
        // TODO: resolver tema gridview  y sus cosas  
    }
}