using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
namespace Dominio
{
    public class Pedido
    {
        public long IdPedido { get; set;}
        public long IdUsuario { get; set;}
        public SqlMoney ImporteTotal { get; set;}
        public SqlDateTime Fecha { get; set;}
        public string Estado { get; set; }
        //public EstadoPedido Estado { get; set;}
        //Si yo fuese a traer el estado directamente por medio de una view...
        //Realmente hace falta que un obj Pedido tenga un obj Estado con su id y nombre dentro del mismo?

    }
}
