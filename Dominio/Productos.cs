using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Productos
    {
        public int Id { get; set; }

        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public SqlMoney Precio { get; set; }
        public String Talle  { get; set; }
        public int Stock { get; set; }
        public int StockMin { get; set; }

        public String Color { get; set; }



        // public Administrador Administrador { get; set; }
    }
}
