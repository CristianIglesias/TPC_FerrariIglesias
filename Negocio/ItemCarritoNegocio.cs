using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Negocio;
using System.Data.SqlTypes;
namespace Negocio
{
    public class ItemCarritoNegocio
    {
        public List<ItemCarrito> Listar(Pedido pedidin)
        {
        
            AccesoDatos Acceso = new AccesoDatos();
            List<ItemCarrito> Lista = new List<ItemCarrito>();
            try
            {
                
                Acceso.setearQuery("Select IdProducto, IdPedido, PrecioActual, CantidadPedida, UrlImagen, Nombre from Detalle where IdPedido = @idPed");
                Acceso.agregarParametro("@idPed", pedidin.IdPedido);
                
                Acceso.ejecutarLector();
                Acceso.lector = Acceso.comando.ExecuteReader();
                while (Acceso.lector.Read())
                {
                    ItemCarrito Aux = new ItemCarrito();

                    Aux.IdProducto = (long)Acceso.lector["IdProducto"];
                    Aux.IdPedido = (long)Acceso.lector["IdPedido"];
                    Aux.PrecioActual = (Decimal) Acceso.lector["PrecioActual"];
                    Aux.CantidadPedida = (Byte)Acceso.lector["CantidadPedida"];
                    Aux.UrlImagen = (string)Acceso.lector["UrlImagen"];
                    Aux.NombreActual = (string)Acceso.lector["Nombre"];
                   
                    Lista.Add(Aux);
                    
                }
                Acceso.cerrarConexion();
                return Lista;



            }
            catch (Exception ex)
            {
                throw ex;
                // return Lista;
                //obviamente hay que hacer una redireccion a una pagina de error  :)
            }

        }



        public void  AgregarDetalle(ItemCarrito item)
        {
            try
            {
                AccesoDatos Acceso = new AccesoDatos();
                Acceso.setearQuery_conPa("SP_AgregarDetalle");

                Acceso.agregarParametro("@IdProducto     ", item.IdProducto);
                Acceso.agregarParametro("@idPedido       ", item.IdPedido);
                Acceso.agregarParametro("@PrecioActual   ", item.PrecioActual);
                Acceso.agregarParametro("@CantidadPedida ", item.CantidadPedida);
                Acceso.agregarParametro("@UrlImagen      ", item.UrlImagen);
                Acceso.agregarParametro("@Nombre         ", item.NombreActual);
                Acceso.ejecutarAccion();
                Acceso.cerrarConexion();
            }
            catch (Exception)
            {

                throw;
            }
            
        }
    }
}
