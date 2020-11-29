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
            datos.setearQuery("select u.Id, u.Contraseña,  u.IdTipoUsuario, u.NombreUsuario, u.Estado, dp.Nombre, dp.Apellido, dp.DNI from Usuarios as u join DatosPersonales as dp on u.Id = dp.IdUsuario");

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
                    aux.DNI = (int)datos.lector.GetInt32(7);
                    aux.Estado = datos.lector.GetSqlBoolean(4);


                    Lista.Add(aux);

                }

                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }



        }

        public void AgregarUsuario(Usuario pepito)
        {
            AccesoDatos Acceso = new AccesoDatos();

            //insert.

            Acceso.setearQuery("insert into Usuario (NombreUsuario, Contraseña, IdTipoUsuario) values (@NombreUsuario,@Contraseña,@IdTipoUsuario");

            Acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
            Acceso.agregarParametro("@Contraseña", pepito.Contrasenia);
            Acceso.agregarParametro("@IdTipoUsuario", pepito.TipoUsuario);

            Acceso.ejecutarAccion();


            Acceso.cerrarConexion();
        }

        public void AgregarDatosPersonales()
        //como son cosas de dos tablas diferentes, 
        //Deberíamos agregar, primero el usuario y después los datos personales 
        {
            AccesoDatos Acceso = new AccesoDatos();

            Acceso.setearQuery("insert into DatosPersonales (  IdUsuario, Nombre, Apellido, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad) VALUES (@Nombre,@Apellido,@DNI, @FechaNac,@Genero,@Telefono,@CP,@Direccion,@Ciudad)");

            //Acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
            //Acceso.agregarParametro("@Contraseña", pepito.Contrasenia);
            //Acceso.agregarParametro("@IdTipoUsuario", pepito.TipoUsuario);

            Acceso.ejecutarAccion();


            Acceso.cerrarConexion();
        }

        public void Modificar()
        {

        }

        public void BajaLogica()
        { 
        
        }

        public Usuario Login (Usuario user)
        {
            //va a ir a la db y va a buscar al usuario por user y por pass
            // si devuelve hay que traer el id
            //maxi para comprobar q esto funcionaba puso aca abao esto:
            //user.Id = 3;

            return user;
        }
    }
}
