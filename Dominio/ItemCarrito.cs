using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;

namespace Dominio
{
    public class ItemCarrito
    {
        public long IdPedido { get; set; }
        public SqlMoney PrecioActual { get; set; }
        public string NombreActual { get; set; }
        public byte CantidadPedida { get; set; }
        public long idProducto { get; set; }

    }

}
