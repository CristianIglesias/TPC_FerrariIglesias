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
            if (!IsPostBack)
            {
                //Listinha = ((List<Productos>)Session.Contents["ListaCatalogo"]);
                ProductoNegocio negocio = new ProductoNegocio();
                Listinha = negocio.Listar();
                Session.Add("ListaCatalogo", Listinha);// para que sirve??

            }
            else
            {

            //ProductoNegocio negocio = new ProductoNegocio();
            //Listinha =  negocio.Listar();
            //Session.Add("ListaCatalogo", Listinha);// para que sirve??
            Listinha = ((List<Productos>)Session.Contents["ListaCatalogo"]);
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            ProductoNegocio negocio = new ProductoNegocio();
     
                    Listinha = ((List<Productos>)Session.Contents["listaCatalogo"]).FindAll(X => X.Nombre.ToUpper().Contains(txtBuscador.Text.ToUpper()) || X.Descripcion.ToUpper().Contains(txtBuscador.Text.ToUpper()) 
                    /*|| X.Codigo.ToUpper().Contains(txtBuscador.Text.ToUpper()) || X..Descripcion.ToUpper().Contains(txtBuscador.Text.ToUpper()) || X.Marca.Descripcion.ToUpper().Contains(txtBuscador.Text.ToUpper()*/);
                    Session.Add("listaCatalogo", Listinha);
                    Response.Redirect("Catalogo.aspx");
           

             

        }
    }
}