using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Security.AccessControl;
using System.ComponentModel.Design;

namespace Negocio
{
    public class PedidosNegocio
    {
        public List<Pedido> Listar()
        {
            AccesoDatos Acceso = new AccesoDatos();
            List<Pedido> Lista = new List<Pedido>();
            Acceso.setearQuery("Select Id, IdUsuario, IdEstado, Fecha, Importe from Pedidos");
            try
            {
                Acceso.ejecutarLector();
                Acceso.lector = Acceso.comando.ExecuteReader();
                while (Acceso.lector.Read())
                {
                    Pedido Aux = new Pedido();
                    Aux.IdPedido = Acceso.lector.GetInt64(0);
                    Aux.IdUsuario = Acceso.lector.GetByte(1);
                    Aux.Estado = Acceso.lector.GetString(2);
                    Aux.Fecha = Acceso.lector.GetDateTime(3);
                    Lista.Add(Aux);
                }
                return Lista;
            }
            catch (Exception ex)
            {
                // amigo intenta no hacer este parche porque sino nunca vamos a saber los errores reales que nos tira
                //return Lista;
                throw ex;

            }
        }
        public void Agregar(Pedido pedido, List<ItemCarrito> carro)
        {

            AccesoDatos Acceso = new AccesoDatos();


            Acceso.setearQuery("ProcedimientoAlmacenadoconlacosayelrollbackyeso");

            Acceso.agregarParametro("@idUsuario  ",);
            Acceso.agregarParametro("@ImporteTotal  ",);
            Acceso.agregarParametro("@Fecha  ",);
            Acceso.agregarParametro("@Estado  ",);
            Acceso.ejecutarAccion();


            Acceso.cerrarConexion();

        }




    }
}
