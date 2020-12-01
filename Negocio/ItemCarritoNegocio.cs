using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Negocio;
namespace Negocio
{
    public class ItemCarritoNegocio
    {
        public List<ItemCarrito> Listar()
        {
        
            AccesoDatos Acceso = new AccesoDatos();
            List<ItemCarrito> Lista = new List<ItemCarrito>();
            try
            {
                
                Acceso.setearQuery("Select IdProducto, IdPedido, PrecioActual, CantidadPedida, UrlImagen, Nombre from Detalle");
                Acceso.ejecutarLector();
                Acceso.lector = Acceso.comando.ExecuteReader();
                while (Acceso.lector.Read())
                {
                    ItemCarrito Aux = new ItemCarrito();

                    Aux.idProducto = Acceso.lector.GetByte(0);
                    Aux.IdPedido = Acceso.lector.GetInt64(1);
                    Aux.PrecioActual = Acceso.lector.GetSqlMoney(2);
                    Aux.CantidadPedida = Acceso.lector.GetByte(3);
                    Aux.UrlImagen = Acceso.lector.GetString(4);
                    Aux.NombreActual = (string)Acceso.lector["Nombre"];
                   
                   
                        Lista.Add(Aux);
                    
                }
                return Lista;



            }
            catch (Exception ex)
            {
                throw ex;
                // return Lista;
                //obviamente hay que hacer una redireccion a una pagina de error  :)
            }

        }

    }
}
