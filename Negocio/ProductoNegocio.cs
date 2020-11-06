using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;
using System.Security.AccessControl;
using System.ComponentModel.Design;
using System.Data.SqlTypes;

namespace Negocio
{
    public  class ProductoNegocio
    {
        public List<Productos> Listar()
        {
            AccesoDatos Acceso = new AccesoDatos();
            List<Productos> Lista = new List<Productos>();

            //A modificar cuando tengamos mas cancha, tipo, eso
            Acceso.setearQuery("select id, idtipo, precio, nombre, talle, descripcion from Producto");
            try
            {
                Acceso.ejecutarLector();
                Acceso.lector = Acceso.comando.ExecuteReader();
                while (Acceso.lector.Read())
                {
                    Productos Aux = new Productos();
                    //Aux.Id = (int)Acceso.lector["Id"];
                    Aux.Precio = Acceso.lector.GetSqlMoney(2);
                    Aux.Nombre = Acceso.lector.GetString(3);
                    //Aux.Talle = (string)Acceso.lector["Talle"];
                    //Aux.Descripcion = (string)Acceso.lector["Descripcion"];
                    //Aux.Color = (string) Acceso.lector["Color"];
                    Lista.Add(Aux);
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
