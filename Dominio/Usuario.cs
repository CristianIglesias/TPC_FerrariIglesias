using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
namespace Dominio
{
    public class Usuario
    {
        public int Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Contrasenia { get; set; }
        public byte TipoUsuario { get; set; }
        public SqlBoolean Estado { get; set; }


        //Clase DatosPersonales?
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        
        public string Email { get; set; } 
        
        public int DNI { get; set; }

    }
}
