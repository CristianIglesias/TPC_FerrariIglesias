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
        public long IdPedido { get; set; }
        public long IdUsuario { get; set; }
        public SqlMoney ImporteTotal { get; set; }
        public SqlDateTime Fecha { get; set; }
        public string Estado { get; set; }
        //public EstadoPedido Estado { get; set;}
        //Si yo fuese a traer el estado directamente por medio de una view...
        //Realmente hace falta que un obj Pedido tenga un obj Estado con su id y nombre dentro del mismo?

        public Pedido(Usuario pepito, List<ItemCarrito> Listinha) // lo inicializo con los valores  
        {
            ImporteTotal = 0;
            foreach (var item in Listinha)
            {
                ImporteTotal += item.PrecioActual;
            }
            Fecha = DateTime.Now;
            Estado = "1";
            IdUsuario = pepito.Id;

        }

       

        public Pedido()
        { }
    }
}
