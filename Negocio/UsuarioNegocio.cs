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
            datos.setearQuery("select u.Id, u.NombreUsuario, u.Contraseña, u.IdTipoUsuario,u.Estado, dp.Nombre,dp.Apellido,dp.DNI,dp.fechaNac,dp.genero,dp.telefono,dp.cp,dp.direccion,dp.ciudad,dp.email from Usuarios as u join DatosPersonales as dp on u.Id = dp.IdUsuario");
            try
            {
                datos.ejecutarLector();
                datos.lector = datos.comando.ExecuteReader();
                while (datos.lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Estado = (bool)datos.lector["Estado"];
                    if (aux.Estado == true)
                    {
                        aux.Id = (int)datos.lector.GetInt64(0);

                        aux.NombreUsuario = (string)datos.lector["NombreUsuario"];
                        aux.Contrasenia = (string)datos.lector["Contraseña"];
                        aux.TipoUsuario = (byte)datos.lector.GetByte(3);
                        aux.Nombre = (string)datos.lector["Nombre"];
                        aux.Apellido = (string)datos.lector["Apellido"];
                        aux.DNI = datos.lector.GetString(7);
                        aux.FechaNacimiento = (DateTime)datos.lector["fechaNac"];
                        aux.Genero = (string)datos.lector["genero"];
                        aux.NroTelefono = (string)datos.lector["telefono"];
                        aux.CodigoPost = (int)datos.lector["cp"];
                        aux.Direccion = (string)datos.lector["direccion"];
                        aux.Ciudad = (string)datos.lector["ciudad"];
                        aux.Email = (string)datos.lector["email"];
                        Lista.Add(aux);


                        //El tema es que hay que rearmar la query, capaz incluso hacer una vista y asignar bien todos los datos, no es que no está mostrando... Directamente no están cargandose los datos.
                    }

                }
                datos.cerrarConexion();
                return Lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ModificarUsuario(Usuario pepito)
        {
            AccesoDatos Acceso = new AccesoDatos();

            //insert.
            try
            {
                Acceso.setearQuery("Update  Usuarios set NombreUsuario=@NombreUsuario, Contraseña=@Contraseña, IdTipoUsuario=@IdTipoUsuario, Estado=@Estado where id = @idUsuario");

                Acceso.agregarParametro("@idUsuario", pepito.Id);
                Acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
                Acceso.agregarParametro("@Contraseña", pepito.Contrasenia);
                Acceso.agregarParametro("@IdTipoUsuario", pepito.TipoUsuario);
                Acceso.agregarParametro("@Estado", pepito.Estado);
                Acceso.ejecutarAccion();


                Acceso.cerrarConexion();

            }
            catch (Exception)
            {

                throw;
            }

        }
        public void ModificarDatosPersonales(Usuario pepito)
        {

            try
            {
                AccesoDatos Acceso = new AccesoDatos();
                Acceso.setearQuery("update  DatosPersonales set Nombre=@Nombre, Apellido=@Apellido, Email=@Email, DNI=@DNI, FechaNac=@FechaNac, Genero=@Genero, Telefono=@Telefono, CP=@CP, Direccion=@Direccion, Ciudad=@Ciudad where idUsuario =  @id");
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
            catch (Exception)
            {

                throw;
            }

        }
        public void BajaLogica(Usuario pepito)
        {
            pepito.Estado = false;
            AccesoDatos Acceso = new AccesoDatos();

            try
            {
                Acceso.setearQuery("Update  Usuarios set (Estado) values (@Estado) where id = @idUsuario");
                Acceso.agregarParametro("@ID", pepito.Id);
                Acceso.agregarParametro("@Estado", pepito.Estado);
                Acceso.ejecutarAccion();
                Acceso.cerrarConexion();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public Usuario Login(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();
            //va a ir a la db y va a buscar al usuario por user y por pass

            try
            {
                datos.setearQuery("select Id, Contraseña, NombreUsuario, IdTipoUsuario, Estado  from Usuarios where NombreUsuario = @NombreUsuario and Contraseña =@Contraseña ");
                Usuario usuario = new Usuario();
                // osea user.contr.. es lo que pone el usuario en la textb y se lo  mando atraves de la variable @contras a la query
                datos.agregarParametro("@Contraseña", user.Contrasenia); // User es lo que ingrso el usuario en la texbox que me viene por parametro del login
                datos.agregarParametro("@NombreUsuario", user.NombreUsuario);

                datos.ejecutarLector();
                datos.lector = datos.comando.ExecuteReader();
                // si devuelve hay que traer el id
                if (datos.lector.Read()) // si leyo  le voy a asignar los datos al usuario
                {
                    usuario.NombreUsuario = (string)datos.lector["NombreUsuario"];
                    usuario.Contrasenia = (string)datos.lector["Contraseña"];
                    usuario.Estado = (Boolean)datos.lector["Estado"];
                    usuario.TipoUsuario = (byte)datos.lector["IdTipoUsuario"];
                    usuario.Id = (long)datos.lector["Id"];

                }
                else
                {
                    usuario.Id = 0;
                }
                datos.cerrarConexion();
                return usuario;
            }
            catch (Exception)
            {

                throw;
            }

        }

        public Usuario CargarDatosEnvio(Usuario pepito)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                //va a ir a la db y va a buscar al usuario por user y por pass
                datos.setearQuery("select Direccion, CP, Ciudad, Telefono from DatosPersonales where @idUsuario = idUsuario ");

                // osea user.contr.. es lo que pone el usuario en la textb y se lo  mando atraves de la variable @contras a la query
                datos.agregarParametro("@idUsuario", pepito.Id); // User es lo que ingrso el usuario en la texbox que me viene por parametro del login

                datos.ejecutarLector();
                datos.lector = datos.comando.ExecuteReader();
                // si devuelve hay que traer el id
                if (datos.lector.Read()) // si leyo  le voy a asignar los datos al usuario
                {
                    pepito.Direccion = (string)datos.lector["Direccion"];
                    pepito.CodigoPost = Convert.ToInt32(datos.lector["CP"]);
                    pepito.Ciudad = (String)datos.lector["Ciudad"];
                    pepito.NroTelefono = (String)datos.lector["Telefono"];
                }
                datos.cerrarConexion();
                return pepito;
            }
            catch (Exception)
            {

                throw;
            }

        }



        public void AgregarUsuarioCompletoConPa(Usuario pepito)
        {
            AccesoDatos Acceso = new AccesoDatos();
            try
            {

                Acceso.setearQuery_conPa("sp_InsertarUsuario");

                Acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
                Acceso.agregarParametro("@Contraseña   ", pepito.Contrasenia);
                Acceso.agregarParametro("@IdTipoUsuario", pepito.TipoUsuario);
                Acceso.agregarParametro("@Estado       ", pepito.Estado);
                Acceso.agregarParametro("@IdUsuario    ", pepito.Id);
                Acceso.agregarParametro("@Nombre       ", pepito.Nombre);
                Acceso.agregarParametro("@Apellido     ", pepito.Apellido);
                Acceso.agregarParametro("@DNI          ", pepito.DNI);
                Acceso.agregarParametro("@FechaNac     ", pepito.FechaNacimiento);
                Acceso.agregarParametro("@Genero       ", pepito.Genero);
                Acceso.agregarParametro("@Telefono     ", pepito.NroTelefono);
                Acceso.agregarParametro("@CP           ", pepito.CodigoPost);
                Acceso.agregarParametro("@Direccion    ", pepito.Direccion);
                Acceso.agregarParametro("@Ciudad       ", pepito.Ciudad);
                Acceso.agregarParametro("@Email        ", pepito.Email);
                Acceso.ejecutarAccion();

                Acceso.cerrarConexion();
            }
            catch (Exception)
            {

                throw;
            }


        }



        //public void AgregarUsuario(Usuario pepito)
        //{
        //    AccesoDatos Acceso = new AccesoDatos();

        //    //insert.

        //    Acceso.setearQuery("insert into Usuarios (NombreUsuario, Contraseña, IdTipoUsuario,Estado) values (@NombreUsuario,@Contraseña,@IdTipoUsuario,@Estado)");

        //    Acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
        //    Acceso.agregarParametro("@Contraseña", pepito.Contrasenia);
        //    Acceso.agregarParametro("@IdTipoUsuario", pepito.TipoUsuario);
        //    Acceso.agregarParametro("@Estado", pepito.Estado);
        //    Acceso.ejecutarAccion();


        //    Acceso.cerrarConexion();
        //}


        //public void AgregarDatosPersonales(Usuario pepito)
        ////como son cosas de dos tablas diferentes, 
        ////Deberíamos agregar, primero el usuario y después los datos personales 
        //{
        //    AccesoDatos Acceso = new AccesoDatos();
        //    Acceso.setearQuery("insert into DatosPersonales (   IdUsuario, Nombre, Apellido, Email, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad) VALUES (@ID,@Nombre,@Apellido, @Email, @DNI, @FechaNac,@Genero,@Telefono,@CP,@Direccion,@Ciudad)");
        //    Acceso.agregarParametro("@ID       ", pepito.Id);
        //    Acceso.agregarParametro("@Nombre   ", pepito.Nombre);
        //    Acceso.agregarParametro("@Apellido ", pepito.Apellido);
        //    Acceso.agregarParametro("@Email    ", pepito.Email);
        //    Acceso.agregarParametro("@DNI      ", pepito.DNI);
        //    Acceso.agregarParametro("@FechaNac ", pepito.FechaNacimiento);
        //    Acceso.agregarParametro("@Genero   ", pepito.Genero);
        //    Acceso.agregarParametro("@Telefono ", pepito.NroTelefono);
        //    Acceso.agregarParametro("@CP       ", pepito.CodigoPost);
        //    Acceso.agregarParametro("@Direccion", pepito.Direccion);
        //    Acceso.agregarParametro("@Ciudad   ", pepito.Ciudad);
        //    Acceso.ejecutarAccion();

        //    Acceso.cerrarConexion();
        //}

        //public long UbicarUltimoID(Usuario pepito)
        //{
        //    AccesoDatos acceso = new AccesoDatos();
        //    acceso.setearQuery("select id from Usuarios where NombreUsuario = @NombreUsuario and Contraseña = @contrasenia");
        //    acceso.agregarParametro("@NombreUsuario", pepito.NombreUsuario);
        //    acceso.agregarParametro("@Contrasenia", pepito.Contrasenia);
        //    acceso.ejecutarLector();
        //    acceso.lector = acceso.comando.ExecuteReader();
        //    while (acceso.lector.Read())
        //    {
        //        pepito.Id = acceso.lector.GetInt64(0);
        //    }
        //    return pepito.Id;
        //}
    }
}
