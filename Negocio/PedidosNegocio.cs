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
    class PedidosNegocio
    {
        public List <Pedido> Listar()
        {
            AccesoDatos Acceso = new AccesoDatos();
            List<Pedido> Lista = new List<Pedido>();
            Acceso.setearQuery("Select  select * from Pedidos");
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
            catch (Exception)
            {
               
                return Lista;
                
            }
        }
        public void Agregar()
        {
            // insert into Pedidos (IdUsuario, IdEstado, Fecha) values (1,1,'2020/11/28')

        }
    }
}
