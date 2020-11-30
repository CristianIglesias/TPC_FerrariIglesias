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

                    aux.Estado = datos.lector.GetSqlBoolean(4);
                    if(aux.Estado==true)
                    { 
                    aux.Id = (int)datos.lector.GetInt64(0);
                    aux.Contrasenia = (string)datos.lector["Contraseña"];
                    aux.TipoUsuario = (byte)datos.lector.GetByte(2);
                    aux.NombreUsuario = (string)datos.lector["NombreUsuario"];
                    aux.Nombre = (string)datos.lector["Nombre"];
                    aux.Apellido = (string)datos.lector["Apellido"];
                    aux.DNI = datos.lector.GetString(7);
                    Lista.Add(aux);
                    }
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

            Acceso.setearQuery("insert into Usuarios (NombreUsuario, Contraseña, IdTipoUsuario,Estado) values (@NombreUsuario,@Contraseña,@IdTipoUsuario,@Estado)");

            Acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
            Acceso.agregarParametro("@Contraseña", pepito.Contrasenia);
            Acceso.agregarParametro("@IdTipoUsuario", pepito.TipoUsuario);
            Acceso.agregarParametro("@Estado",pepito.Estado);
            Acceso.ejecutarAccion();


            Acceso.cerrarConexion();
        }
 
        public void AgregarDatosPersonales(Usuario pepito)
        //como son cosas de dos tablas diferentes, 
        //Deberíamos agregar, primero el usuario y después los datos personales 
        {
            AccesoDatos Acceso = new AccesoDatos();
            Acceso.setearQuery("insert into DatosPersonales (   IdUsuario, Nombre, Apellido, Email, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad) VALUES (@ID,@Nombre,@Apellido, @Email, @DNI, @FechaNac,@Genero,@Telefono,@CP,@Direccion,@Ciudad)");
            Acceso.agregarParametro("@ID       ",pepito.Id);
            Acceso.agregarParametro("@Nombre   ",pepito.Nombre );
            Acceso.agregarParametro("@Apellido ",pepito.Apellido );
            Acceso.agregarParametro("@Email    ",pepito.Email );
            Acceso.agregarParametro("@DNI      ",pepito.DNI );
            Acceso.agregarParametro("@FechaNac ",pepito.FechaNacimiento );
            Acceso.agregarParametro("@Genero   ",pepito.Genero );
            Acceso.agregarParametro("@Telefono ",pepito.NroTelefono );
            Acceso.agregarParametro("@CP       ",pepito.CodigoPost );
            Acceso.agregarParametro("@Direccion",pepito.Direccion );
            Acceso.agregarParametro("@Ciudad   ",pepito.Ciudad );
            Acceso.ejecutarAccion();

            Acceso.cerrarConexion();
        }

        public void ModificarUsuario(Usuario pepito)
        {
            AccesoDatos Acceso = new AccesoDatos();

            //insert.

            Acceso.setearQuery("Update  Usuarios set (NombreUsuario, Contraseña, IdTipoUsuario,Estado) values (@NombreUsuario,@Contraseña,@IdTipoUsuario,@Estado) where id = @idUsuario");

            Acceso.agregarParametro("@idUsuario", pepito.Id);
            Acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
            Acceso.agregarParametro("@Contraseña", pepito.Contrasenia);
            Acceso.agregarParametro("@IdTipoUsuario", pepito.TipoUsuario);
            Acceso.agregarParametro("@Estado", pepito.Estado);
            Acceso.ejecutarAccion();


            Acceso.cerrarConexion();
        }
        public void ModificarDatosPersonales(Usuario pepito)
        {
            AccesoDatos Acceso = new AccesoDatos();
            Acceso.setearQuery("update  DatosPersonales set (Nombre, Apellido, Email, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad) VALUES (@Nombre,@Apellido, @Email, @DNI, @FechaNac,@Genero,@Telefono,@CP,@Direccion,@Ciudad) where idUsuario =  @id");
            Acceso.agregarParametro("@ID       ", pepito.Id);
            Acceso.agregarParametro("@Nombre   ", pepito.Nombre);
            Acceso.agregarParametro("@Apellido ", pepito.Apellido);
            Acceso.agregarParametro("@Email    ", pepito.Email);
            Acceso.agregarParametro("@DNI      ", pepito.DNI);
            Acceso.agregarParametro("@FechaNac ", pepito.FechaNacimiento);
            Acceso.agregarParametro("@Genero   ", pepito.Genero);
            Acceso.agregarParametro("@Telefono ", pepito.NroTelefono);
            Acceso.agregarParametro("@CP       ", pepito.CodigoPost);
            Acceso.agregarParametro("@Direccion", pepito.Direccion);
            Acceso.agregarParametro("@Ciudad   ", pepito.Ciudad);
            Acceso.ejecutarAccion();

            Acceso.cerrarConexion();
        }
        public void BajaLogica(Usuario pepito)
        {
            pepito.Estado = false;
            AccesoDatos Acceso = new AccesoDatos();
            Acceso.setearQuery("Update  Usuarios set (Estado) values (@Estado) where id = @idUsuario");
            Acceso.agregarParametro("@ID", pepito.Id);
            Acceso.agregarParametro("@Estado", pepito.Estado);
        }

        public Usuario Login (Usuario user)
        {
            //va a ir a la db y va a buscar al usuario por user y por pass
            // si devuelve hay que traer el id
            //maxi para comprobar q esto funcionaba puso aca abao esto:
            //user.Id = 3;

            return user;
        }
        public long UbicarUltimoID(Usuario pepito)
        {
            AccesoDatos acceso = new AccesoDatos();
            acceso.setearQuery("select id from Usuarios where NombreUsuario = @NombreUsuario and Contraseña = @contrasenia");
            acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
            acceso.agregarParametro("@Contrasenia", pepito.Contrasenia);
            acceso.ejecutarLector();
            acceso.lector = acceso.comando.ExecuteReader();
            while (acceso.lector.Read())
            {
                pepito.Id = acceso.lector.GetInt64(0);
            }
            return pepito.Id;
        }
    
    
    }
}
