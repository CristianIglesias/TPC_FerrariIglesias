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
    public partial class Carrito : System.Web.UI.Page
    {
        public List<Productos> Liston;
        public Productos Producto;
        int IdAux;
        public List<Productos> ListaAux;


        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            
            try
            {
                IdAux = Convert.ToInt32(Request.QueryString["idArticulo"]);
                Liston = negocio.Listar();
                Producto = Liston.Find(x => x.Id == IdAux);
                //parche para que acceder directo al carrito funcione, que es lo que me está haciendo pinchar ahora.
               
                if (IdAux == 0)//Esto es cuando entra sin querer agregar, tipo para ver los articulos que estén cargados en el carro.
                {
                    if (Session["ListaCarrito"] == null) //Si la lista no llegó a instanciarse
                    {
                        ListaAux = new List<Productos>();
                        Session["ListaCarrito"] = ListaAux;
                    }
                    else

                    { 
                        ListaAux = (List<Productos>)Session["ListaCarrito"]; 
                    }
                    return;//estos todavía existen, me había olvidado
                    //esta validación que agregué resuelve el problema. Ese problema era, que mas abajo
                    //se agregaba un producto que podía ser nulo a la lista, en el caso de que la lista recibía nulo
                    //simplemente pinchaba.
                    //Solución? Poner un retorno para dividir los caminos. 

                }


                //fin del parche/toqueteo


                if (Session ["ListaCarrito"]== null)
                {
                    ListaAux = new List<Productos>();
                    ListaAux.Add(Producto);
                    Session["ListaCarrito"] = ListaAux; 
                }
                else
                {
                    ListaAux = (List<Productos>)Session["ListaCarrito"];// mi lista con los productos q agregue en session
                    ListaAux.Add(Producto); // le agrego un producto/obj----ACÁ ESTÁ EL ERROR, EL ITEM PODÍA LLEGAR NULO AHRE LE GRITABA HOLA CHIVI
                    Session.Add("ListaCarrito", ListaAux);
                //Session["ListaCarrito"] = ListCarritoaux; esto es lo mismo que Session["ListaAux"] = ListaAux;
                }
                   

            }
            catch (Exception)
            {
                //HAY QUE REDIRECCIONARLO A UNA PAG DE ERROR
                throw;
            }
        }
    }
}