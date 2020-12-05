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
        long IdAux;
        //int IdAux;
        public int extra;
        public ItemCarrito Detalle;
        public List<ItemCarrito> ListaAux;
        public Decimal Subtotal;

        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();

            try
            {
                IdAux = Convert.ToInt32(Request.QueryString["idArticulo"]);
                extra = Convert.ToInt32(Request.QueryString["extra"]);
                Liston = negocio.Listar();
                Producto = Liston.Find(x => x.Id == IdAux);



                //parche para que acceder directo al carrito funcione, que es lo que me está haciendo pinchar ahora.

                if (IdAux == 0)//Esto es cuando entra sin querer agregar, tipo para ver los articulos que estén cargados en el carro.
                {
                    if (Session["ListaCarrito"] == null) //Si la lista no llegó a instanciarse
                    {
                        ListaAux = new List<ItemCarrito>();
                        Session["ListaCarrito"] = ListaAux;
                    }
                    else

                    {
                        ListaAux = (List<ItemCarrito>)Session["ListaCarrito"];
                    }
                    return;//estos todavía existen, me había olvidado
                    //esta validación que agregué resuelve el problema. Ese problema era, que mas abajo
                    //se agregaba un producto que podía ser nulo a la lista, en el caso de que la lista recibía nulo
                    //simplemente pinchaba.
                    //Solución? Poner un retorno para dividir los caminos. 

                }

                Detalle = new ItemCarrito();

                Detalle.IdProducto = Producto.Id;
                Detalle.NombreActual = Producto.Nombre;
                Detalle.PrecioActual = Producto.Precio;
                Detalle.UrlImagen = Producto.Imagen;

                //fin del parche/toqueteo
                if (IdAux > 0 && extra == 1)
                {

                    ListaAux = (List<ItemCarrito>)Session["ListaCarrito"];//traeme lo que tenemos en session
                    foreach (var item in ListaAux)
                    {
                        if (IdAux == item.IdProducto)

                        {
                            ListaAux.Remove(item);
                            Session["ListaCarrito"] = ListaAux;
                            Response.Redirect("Carrito.aspx");

                        }
                    }


                }
                else
                {
                    if (Session["ListaCarrito"] == null)
                    {
                        ListaAux = new List<ItemCarrito>();
                        Detalle.CantidadPedida = 1;
                        ListaAux.Add(Detalle);
                        Session["ListaCarrito"] = ListaAux;
                    }
                    else
                    {

                        ListaAux = (List<ItemCarrito>)Session["ListaCarrito"];// mi lista con los Items del carrito q agregue en session
                        foreach (var item in ListaAux)
                        {
                            if (item.IdProducto == IdAux)
                            {
                                item.CantidadPedida++;
                                foreach (var Producto in Liston)//listaCatalo
                                {
                                    if (IdAux == Producto.Id)
                                    {
                                        if (Producto.StockActual >= item.CantidadPedida)
                                        {
                                            Session["ListaCarrito"] = ListaAux;
                                            return;
                                        }
                                        else
                                        {
                                            item.CantidadPedida--;
                                            Session["ListaCarrito"] = ListaAux;
                                            return;
                                        }
                                    }
                                }

                            }

                        }

                        Detalle.CantidadPedida = 1;
                        ListaAux.Add(Detalle);
                        Session.Add("ListaCarrito", ListaAux);
                        //Session["ListaCarrito"] = ListCarritoaux; esto es lo mismo que Session["ListaAux"] = ListaAux;
                    }

                    //calcular cantidad de veces que está el articulo en la lista
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