using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlTypes;

namespace Negocio
{
    public class TipoRemeNegocio
    {
        public List <TipoReme> Listar()
        {
            AccesoDatos Acceso = new AccesoDatos();
            List<TipoReme> Lista = new List<TipoReme>();
            Acceso.setearQuery("Select id, Nombre From TipoProducto");
            try
            {
                Acceso.ejecutarLector();
                Acceso.lector = Acceso.comando.ExecuteReader();
                while (Acceso.lector.Read())
                {
                    TipoReme Aux = new TipoReme();

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
