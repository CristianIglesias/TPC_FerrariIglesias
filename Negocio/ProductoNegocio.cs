﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;
using System.Security.AccessControl;
using System.ComponentModel.Design;
using System.Data.SqlTypes;

namespace Negocio
{
    public class ProductoNegocio
    {
        public List<Productos> Listar()
        {
            AccesoDatos Acceso = new AccesoDatos();
            List<Productos> Lista = new List<Productos>();

            //A modificar cuando tengamos mas cancha, tipo, eso
            Acceso.setearQuery(" Select p.Id, p.IdTipo, p.Precio, p.Nombre, p.Talle, p.Descripcion, p.Color, p.UrlImagen, Estado, StockMinimo, StockActual, tp.Id, tp.Nombre as TipoNombre  from Producto as p join TipoProducto as tp on p.IdTipo = tp.Id ");
            try
            {
                Acceso.ejecutarLector();
                Acceso.lector = Acceso.comando.ExecuteReader();
                while (Acceso.lector.Read())
                {
                    Productos Aux = new Productos();

                    Aux.Id = Acceso.lector.GetInt64(0);
                    Aux.TipoRemera.Id = Acceso.lector.GetByte(1);
                    Aux.Precio = Acceso.lector.GetSqlMoney(2);
                    Aux.Nombre = Acceso.lector.GetString(3);
                    Aux.TipoRemera.Descripcion = Acceso.lector.GetString(5);
                    Aux.Talle = (string)Acceso.lector["Talle"];
                    Aux.Descripcion = (string)Acceso.lector["Descripcion"];
                    Aux.Color = (string)Acceso.lector["Color"];
                    Aux.Imagen = Acceso.lector.GetString(7);
                    Aux.Estado = Acceso.lector.GetSqlBoolean(8);
                    Aux.StockMinimo = Acceso.lector.GetInt32(9);
                    Aux.StockActual = Acceso.lector.GetInt32(10);

                    Lista.Add(Aux);
                }
                return Lista;



            }
            catch (Exception)
            {
                //throw ex;
                return Lista;
                //obviamente hay que hacer una redireccion a una pagina de error  :)
            }


        }

        public void Agregar(Productos productin)
        {
            AccesoDatos Acceso = new AccesoDatos();

            //insert.

            Acceso.setearQuery("insert into Producto (idTipo, Nombre, Descripcion,Color, UrlImagen ,Talle,  Precio,  Estado, StockMinimo, StockActual ) values (@idTipo,@Nombre,@Descripcion,@Color,@Imagen,@Talle, @Precio, @Estado, @StockMinimo, @StockActual)");

            Acceso.agregarParametro("@idTipo", productin.TipoRemera.Id);
            Acceso.agregarParametro("@Nombre", productin.Nombre);
            Acceso.agregarParametro("@Descripcion", productin.Descripcion);
            Acceso.agregarParametro("@Color", productin.Color);
            Acceso.agregarParametro("@Imagen", productin.Imagen);
            Acceso.agregarParametro("@Talle", productin.Talle);
            Acceso.agregarParametro("@Precio", productin.Precio);
            Acceso.agregarParametro("@Estado", productin.Estado);
            Acceso.agregarParametro("@StockActual", productin.StockActual);
            Acceso.agregarParametro("@StockMinimo", productin.StockMinimo);

            Acceso.ejecutarAccion();
            Acceso.cerrarConexion();
        }

        public void Modificar(Productos productin)
        {
            //update
            AccesoDatos Acceso = new AccesoDatos();
            Acceso.setearQuery("Update Producto set idTipo=@IdTipo, Nombre=@Nombre, Descripcion=@Descripcion, Color=@Color, UrlImagen=@Imagen, Talle=@Talle, Precio = @Precio, Estado =@Estado, StockMinimo =@StockMinimo, StockActual =@StockActual  where id=@Id");
            Acceso.agregarParametro("@Id", productin.Id);
            Acceso.agregarParametro("@IdTipo", productin.TipoRemera.Id);
            Acceso.agregarParametro("@Nombre", productin.Nombre);
            Acceso.agregarParametro("@Descripcion", productin.Descripcion);
            Acceso.agregarParametro("@Color", productin.Color);
            Acceso.agregarParametro("@Imagen", productin.Imagen);
            Acceso.agregarParametro("@Talle", productin.Talle);
            Acceso.agregarParametro("@Precio", productin.Precio);
            Acceso.agregarParametro("@Estado", 1);
            Acceso.agregarParametro("@StockActual", productin.StockActual);
            Acceso.agregarParametro("@StockMinimo", productin.StockMinimo);

            Acceso.ejecutarAccion();
            Acceso.cerrarConexion();
        }

        public void Eliminar(Productos productin)
        {
            AccesoDatos Acceso = new AccesoDatos();
            Acceso.setearQuery("delete from Producto where Id = @id");
            Acceso.agregarParametro("@id", productin.Id);
            Acceso.ejecutarAccion(); 
            Acceso.cerrarConexion();

        }
        public void BajaLogica(Productos productin)
        {
            AccesoDatos Acceso = new AccesoDatos();
            Acceso.setearQuery("delete from Producto where Id = @id");
            Acceso.agregarParametro("@id", productin.Id);
            Acceso.ejecutarAccion();
            Acceso.cerrarConexion();
        }
    }
}

//TODO: COMPLETAR ELIMINAR PRODUCTO - QUE DEBERÍA SER BAJA LÓGICA.
//TODO: ARMAR CARRITO COMPLETO Y VER DETALLES DE PRODUCTOS.