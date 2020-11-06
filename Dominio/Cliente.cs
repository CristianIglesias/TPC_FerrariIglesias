using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cliente : Usuario
    {



        public Pedido Pedido { get; set; } // me imagino que un cliente tiene/hace un pedido, asi que hay que generar la asociacion desde aca

    }
}
