using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;

namespace TPC_Ferrari_Iglesias
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<Productos> Liston;
        public Productos Producto;
        long IdAux;
        public int extra;
        public ItemCarrito Detalle;
        public List<ItemCarrito> ListaAux;
        public Decimal Subtotal;
        public SqlMoney AcumuladorImporte = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                IdAux = Convert.ToInt32(Request.QueryString["idArticulo"]);
                extra = Convert.ToInt32(Request.QueryString["extra"]);
                Liston = negocio.Listar();
                Producto = Liston.Find(x => x.Id == IdAux);

                if (IdAux == 0)//Si entra desde el botón carrito.
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

                    CalcularImporteTotal(ListaAux);
 
                    return;
                }

                Detalle = new ItemCarrito();
                Detalle.IdProducto = Producto.Id;
                Detalle.NombreActual = Producto.Nombre;
                Detalle.PrecioActual = Producto.Precio;
                Detalle.UrlImagen = Producto.Imagen;

                if (IdAux > 0 && extra == 1)// Si viene a eliminar 
                {
                    ListaAux = (List<ItemCarrito>)Session["ListaCarrito"];//traeme lo que tenemos en session
                    //foreach (var item in ListaAux)
                    //{
                    //    if (IdAux == item.IdProducto)
                    //    {
                    //        ListaAux.Remove(item);
                    //        Session["ListaCarrito"] = ListaAux;
                    //        CalcularImporteTotal(ListaAux);

                    //        Response.Redirect("Carrito.aspx");
                    //    }
                    //}
                    int indice;
                    indice = ListaAux.FindIndex(x => x.IdProducto == IdAux);
                  
                    ListaAux.RemoveAt(indice);
                    Session["ListaCarrito"] = ListaAux;
                    CalcularImporteTotal(ListaAux);

                    Response.Redirect("Carrito.aspx",false); // si lo ponemos en false sigue ejecutandose el codigo
                    return;
                }
                else//Si viene a hacer otra cosa.
                {
                    if (Session["ListaCarrito"] == null)
                    {
                        ListaAux = new List<ItemCarrito>();
                        Detalle.CantidadPedida = 1;
                        ListaAux.Add(Detalle);
                        Session["ListaCarrito"] = ListaAux;
                        CalcularImporteTotal(ListaAux);

                    }
                    else
                    {

                        ListaAux = (List<ItemCarrito>)Session["ListaCarrito"];// mi lista con los Items del carrito q agregue en session
                        foreach (var item in ListaAux)
                        {
                            if (item.IdProducto == IdAux)
                            {
                                item.CantidadPedida++;
                                foreach (var Producto in Liston)//listaCatalogo
                                {
                                    if (IdAux == Producto.Id)
                                    {
                                        if (Producto.StockActual >= item.CantidadPedida)//se valida el stock 
                                        {
                                            Session["ListaCarrito"] = ListaAux;
                                            CalcularImporteTotal(ListaAux);

                                            return;
                                        }
                                        else
                                        {
                                            item.CantidadPedida--;
                                            //habría que 
                                            Session["ListaCarrito"] = ListaAux;
                                            CalcularImporteTotal(ListaAux);

                                            return;
                                        }
                                    }
                                }
                            }
                        }
                        Detalle.CantidadPedida = 1;
                        ListaAux.Add(Detalle);
                        CalcularImporteTotal(ListaAux);
                        Session.Add("ListaCarrito", ListaAux);
                        //Session["ListaCarrito"] = ListCarritoaux; esto es lo mismo que Session["ListaAux"] = ListaAux;
                    }



                }
                
            }
            catch (Exception ex)
            {
                //HAY QUE REDIRECCIONARLO A UNA PAG DE ERROR
                Response.Redirect("error.aspx");
                
            }
        }

        public void CalcularImporteTotal(List<ItemCarrito> ListaAux)
        {
            SqlMoney AcumuladorImporte = 0;
            //foreach (var item in ListaAux)
            //{
            //    AcumuladorImporte += (item.CantidadPedida * item.PrecioActual);
            //}

            ListaAux.ForEach(x =>AcumuladorImporte+= x.CantidadPedida*x.PrecioActual);
           
            lblTotal.Text = "Total a Pagar = " + AcumuladorImporte.ToString();
            
        }
    }
   
}

