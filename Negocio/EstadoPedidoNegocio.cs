using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class EstadoPedidoNegocio
    {
        public List<EstadoPedido> Listar()
        {
            AccesoDatos Acceso = new AccesoDatos();
            List<EstadoPedido> Lista = new List<EstadoPedido>();
            Acceso.setearQuery("Select id, NombreEstado From Estados");
            try
            {
                Acceso.ejecutarLector();
                Acceso.lector = Acceso.comando.ExecuteReader();
                while (Acceso.lector.Read())
                {
                    EstadoPedido Aux = new EstadoPedido();

                    Aux.Id = Acceso.lector.GetByte(0);
                    Aux.Descripcion = Acceso.lector.GetString(1);
                    Lista.Add(Aux);
                }
                return Lista;
            }
            catch (Exception)
            {

                throw;
            }
        }


    }
}
