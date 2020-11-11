﻿using Dominio;
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
                Liston = negocio.Listar();
                IdAux = Convert.ToInt32(Request.QueryString["idArticulo"]);
                Producto = Liston.Find(x => x.Id == IdAux);
                
                if (Session ["ListaAux"]== null)
                {
                    ListaAux = new List<Productos>();
                    ListaAux.Add(Producto);
                    Session["ListaAux"] = ListaAux;
                }
                else
                {
                     ListaAux = (List<Productos>)Session["ListaAux"];// mi lista con los productos q agregue en session
                    ListaAux.Add(Producto); // le agrego un producto/obj
                    Session.Add("ListaAux", ListaAux);
                //Session["ListaCarrito"] = ListCarritoaux; esto es lo mismo que Session["ListaAux"] = ListaAux;
                }
                   

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}