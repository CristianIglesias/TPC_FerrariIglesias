using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Contrasenia { get; set; }
        public byte TipoUsuario { get; set; }

        public string Nombre { get; set; }
        public string Apellido { get; set; }
        //public int Estado { get; set; } HA Y QUE AGREGARLO A LA BASE DE DATOS
        //public string Email { get; set; } HAY QUE AGREGARLO EN LA BASE DE DATOS
        
        public int DNI { get; set; }

    }
}
