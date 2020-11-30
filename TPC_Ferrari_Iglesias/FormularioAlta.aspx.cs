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
        public ProductoNegocio ProdNegocio;
        public TipoRemeNegocio TipoNegocio;
        public List<TipoReme> listaParaDropdown;
        protected void Page_Load(object sender, EventArgs e)
        {
            string idItem = Request.QueryString["idArticulo"];
            ProdNegocio = new ProductoNegocio();
            TipoNegocio = new TipoRemeNegocio();
            listaParaDropdown = TipoNegocio.Listar();
            productin = new Productos();

            try
            {
                if (IsPostBack)///segunda vuelta 
                {

                    productin.Nombre = txtNombre.Text;
                    productin.Descripcion = txtDescripcion.Text;
                    productin.Color = txtColor.Text;
                    productin.Imagen = txtImagen.Text;
                    productin.Talle = txtTalle.Text;
                    productin.Precio = Convert.ToDecimal(txtPrecio.Text);
                    productin.TipoRemera.Id = Convert.ToByte(DdlTipo.SelectedValue);
                    productin.Estado = true;
                    productin.StockActual = Convert.ToInt32(txtStockActual.Text);
                    productin.StockMinimo = Convert.ToInt32(txtStockMinimo.Text);

                }
                else///Primera Vuelta
                {
                    DdlTipo.DataSource = listaParaDropdown;
                    DdlTipo.DataValueField = "Id";
                    DdlTipo.DataTextField = "Descripcion";
                    DdlTipo.SelectedIndex = -1;
                    DdlTipo.DataBind();
                }


            }

            catch (Exception) { }


            if (idItem != null)//si viene por el lado de Editar...
            {

                if (Session.Contents["ListaCatalogo"] == null)// SERÍA COMO UNA BARRA DE SEGURIDAD PARA QUE NO PINCHE, 
                                                              //onda, si la lista de la session no existe todavía, ProdNegocio la carga.
                {
                    Session.Add("ListaCatalogo", ProdNegocio.Listar());// en vez de hacer un pasamanos con una lista auxiliar, la lleva directo de la base de datos a la session
                }
                productin = ((List<Productos>)Session.Contents["ListaCatalogo"]).Find(X => X.Id.ToString().Contains(idItem));
                // productin se carga, gracias a la session, y al id de articulo que se pasa por la querystring.
                //Si la session no tiene instanciada la lista, pincha. Pero Gracias a ProdNegocio.listar(), no pincha más :)
                
                txtNombre.Text = productin.Nombre.ToString();
                txtColor.Text = productin.Color.ToString();
                txtDescripcion.Text = productin.Descripcion.ToString();
                DdlTipo.SelectedValue = productin.TipoRemera.Id.ToString();
                txtImagen.Text = productin.Imagen.ToString();
                txtPrecio.Text = productin.Precio.ToString();
                txtTalle.Text = productin.Talle.ToString();
                txtStockActual.Text= productin.StockActual.ToString();
                txtStockMinimo.Text = productin.StockMinimo.ToString();


            }//si viene por el lado de Editar...

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (productin == null)
                productin = new Productos();
           
            if (txtNombre.Text == "" || txtDescripcion.Text == "" || txtColor.Text == "" || txtImagen.Text == "" || txtTalle.Text == "" || txtPrecio.Text == "")
            {
                // Cambiar color a las cajas de texto y tirar alguna alerta 

            }
             else
            {
                if (IsPostBack)
                {
                    productin.TipoRemera.Id = Convert.ToByte(DdlTipo.SelectedValue);
                    productin.Nombre = txtNombre.Text;
                    productin.Descripcion = txtDescripcion.Text;
                    productin.Color = txtColor.Text;
                    productin.Imagen = txtImagen.Text;
                    productin.Talle = txtTalle.Text;
                    productin.Precio = Convert.ToDecimal(txtPrecio.Text);
                    productin.Estado =true;
                    productin.StockActual = Convert.ToInt32(txtStockActual.Text);
                    productin.StockMinimo = Convert.ToInt32(txtStockMinimo.Text);
                }
                ProductoNegocio negocio = new ProductoNegocio();

                if (productin.Id == 0)
                    negocio.Agregar(productin);
                else
                    negocio.Modificar(productin);

            }
        }

    }
}