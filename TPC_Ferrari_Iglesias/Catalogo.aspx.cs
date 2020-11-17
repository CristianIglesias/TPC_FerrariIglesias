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
        public List<Productos> ListaCatalogo;
        public List<Productos> ListaBuscada;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ListaBuscada"] == null)
            {
                ProductoNegocio negocio = new ProductoNegocio();
                ListaCatalogo = negocio.Listar();
                Session.Add("ListaCatalogo", ListaCatalogo);
                //si está apagada, carga la lista de la base de datos 
            }
            else if (Session["ListaBuscada"] != null)//PERO SI ESTÁ PRENDIDA, usa los datos que cargó en base al filtro
            {
                //ProductoNegocio negocio = new ProductoNegocio();
                //Listinha = negocio.Listar();
                //Session.Add("ListaCatalogo", Listinha);// para que sirve??
                Session.Add("ListaCatalogo", Session["ListaBuscada"]);
                Session["ListaBuscada"] = null;//la apagamos para que no esté prendida
            }
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            ListaBuscada = new List<Productos>();
            ListaBuscada = ((List<Productos>)Session.Contents["listaCatalogo"]).FindAll(X => X.Nombre.ToUpper().Contains(txtBuscador.Text.ToUpper()) || X.Descripcion.ToUpper().Contains(txtBuscador.Text.ToUpper())
             /*|| X.Codigo.ToUpper().Contains(txtBuscador.Text.ToUpper()) || X..Descripcion.ToUpper().Contains(txtBuscador.Text.ToUpper()) || X.Marca.Descripcion.ToUpper().Contains(txtBuscador.Text.ToUpper()*/);
            Session.Add("listaBuscada", ListaBuscada);
            Response.Redirect("Catalogo.aspx");




        }
    }
}