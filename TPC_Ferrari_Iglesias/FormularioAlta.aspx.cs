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
            //ProductoNegocio negocio = new ProductoNegocio();
            //try
            //{
            //    if (!IsPostBack)
            //    {
            //        List<Productos> listaParaDropdown = negocio.Listar();
            //        DdlTipo.DataSource = listaParaDropdown;
            //        DdlTipo.DataBind();
            //    }
            //}
            //catch (Exception)
            //{

            //    throw;
            //}
            ///Me agarró la inspiración, 
            ///Vamos a empezar a declarar lo que podemos llegar a necesitar durante el evento, al principio del evento
            ///llegar al punto de necesitarla para ahí instanciar, me parece medio -poco razonado- nose si tiene sentido... Si, Fumé.

            //        protected void Page_Load(object sender, EventArgs e)  // esto lo necesité porque dije, esto donde empieza?!?! muchas veces, ahora se que arranca acá


            string idItem = Request.QueryString["idArticulo"];
            ProductoNegocio ProdNegocio = new ProductoNegocio();
            TipoRemeNegocio TipoNegocio = new TipoRemeNegocio();
            List<TipoReme> listaParaDropdown = TipoNegocio.Listar();
            DdlTipo.DataSource = listaParaDropdown;
            DdlTipo.DataBind();
            

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
            //NO SE COMO ACCEDER A ESTE DATO Y ESTO ES LO QUE NOS PINCHA EL PROGRAMA
            //DEBE SER ALGO SUPER ESPECIFICO PERO YA ME QUEMÉ
//PD        te paso el programa sin que compile pero comentando la linea de acá abajo funca. pero bueno si, no va a guardar bien la remera :/
            productin.TipoRemera = DdlTipo.SelectedValue;
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