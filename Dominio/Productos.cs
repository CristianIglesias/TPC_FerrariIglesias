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
        public long Id { get; set; }
        public string Nombre { get; set; }
        public TipoReme TipoRemera { get; set; }
        public string Descripcion { get; set; }
        public string Talle  { get; set; }
        public string Color { get; set; }
        public string Imagen { get; set; }
        public SqlMoney Precio { get; set; }
        public Productos()
        {
            TipoRemera = new TipoReme();
        }


        //public int Stock { get; set; }
        //public int StockMin { get; set; }
        
        // public Administrador Administrador { get; set; }
    }
}
