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
        public long Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Contrasenia { get; set; }
        public byte TipoUsuario { get; set; }
        public SqlBoolean Estado { get; set; }


        //Clase DatosPersonales?

        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; } 
        public string DNI { get; set; }

        public DateTime FechaNacimiento { get; set; } 
        public string Genero { get; set; }
        public string NroTelefono { get; set; }
        public Int32 CodigoPost { get; set; }
        public string Direccion { get; set; }
        public string Ciudad { get; set; }

        public int CantidadCompras { get; set; }
        public decimal PromedioCommpras { get; set; }
        
    }
}
