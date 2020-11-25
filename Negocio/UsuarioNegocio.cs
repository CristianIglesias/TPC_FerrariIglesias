using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Negocio;
using Dominio;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> Listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> Lista = new List<Usuario>();
            datos.setearQuery("select u.Id, u.Contraseña,  u.IdTipoUsuario, u.NombreUsuario, dp.Nombre, dp.Apellido, dp.DNI from Usuarios as u join DatosPersonales as dp on u.Id = dp.IdUsuario");

            try
            {
                datos.ejecutarLector();
                datos.lector = datos.comando.ExecuteReader();
                while (datos.lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.Id = (int)datos.lector.GetInt64(0);
                    aux.Contrasenia = (string)datos.lector["Contraseña"];
                    aux.TipoUsuario = (byte)datos.lector.GetByte(2);
                    aux.NombreUsuario = (string)datos.lector["NombreUsuario"];
                    aux.Nombre = (string)datos.lector["Nombre"];
                    aux.Apellido = (string)datos.lector["Apellido"];
                    aux.DNI = (int)datos.lector.GetInt32(6);

                    Lista.Add(aux);

                }

                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }



        }
    }
}
