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
    public partial class FormularioAlta : System.Web.UI.Page
    {
        public Productos productin = null;
        protected void Page_Load(object sender, EventArgs e)
        {
 
            string idItem = Request.QueryString["idArticulo"];
            ProductoNegocio ProdNegocio = new ProductoNegocio();
            TipoRemeNegocio TipoNegocio = new TipoRemeNegocio();
            List<TipoReme> listaParaDropdown = TipoNegocio.Listar();
            DdlTipo.DataSource = listaParaDropdown;
            DdlTipo.DataBind();
            DdlTipo.DataValueField = "Id";
            DdlTipo.DataTextField = "Descripcion";

            if (idItem != null)
            {
                
                if (Session.Contents["ListaCatalogo"] == null)// SERÍA COMO UNA BARRA DE SEGURIDAD PARA QUE NO PINCHE, 
                                                              //onda, si la lista de la session no existe todavía, ProdNegocio la carga.
                {
                    Session.Add("ListaCatalogo", ProdNegocio.Listar());// en vez de hacer un pasamanos con una lista auxiliar, la lleva directo de la base de datos a la session
                }
                try
                {   // productin se carga, gracias a la session, y al id de articulo que se pasa por la querystring.
                    //Si la session no tiene instanciada la lista, pincha. Pero Gracias a carlos, no pincha más :)
                    productin = ((List<Productos>)Session.Contents["ListaCatalogo"]).Find(X => X.Id.ToString().Contains(idItem));


                    if (!IsPostBack)
                    {
                       
                        txtColor.Text = productin.Color.ToString();
                        txtDescripcion.Text = productin.Descripcion.ToString();
                        //txtIdTipo.Text = productin.TipoRemera.Id.ToString();
                       
                        txtImagen.Text = productin.Imagen.ToString();
                        txtNombre.Text = productin.Nombre.ToString();
                        txtPrecio.Text = productin.Precio.ToString();
                        txtTalle.Text = productin.Talle.ToString();
                    }
                }
                catch (Exception) { }

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (productin == null)
                productin = new Productos();
            if (!IsPostBack) { 
            productin.TipoRemera.Id = Convert.ToByte(DdlTipo.SelectedValue);
            productin.Nombre = txtNombre.Text;
            productin.Descripcion = txtDescripcion.Text;
            productin.Color = txtColor.Text;
            productin.Imagen = txtImagen.Text;
            productin.Talle = txtTalle.Text;
            productin.Precio = Convert.ToDecimal(txtPrecio.Text);

            ProductoNegocio negocio = new ProductoNegocio();
            if (productin.Id == 0)
                negocio.Agregar(productin);
            else
                negocio.Modificar(productin);
            }
        }


    }
}