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
        //Esto es lo reducido de productos y tiene cosas especificas del momento al comprar, ej imagen y precio pueden cambiar
        public long IdProducto { get; set; }
        public long IdPedido { get; set; }
        public SqlMoney PrecioActual { get; set; }
        public byte CantidadPedida { get; set; }
        public string UrlImagen { get; set; }
        public string NombreActual { get; set; }
    
    }

}
