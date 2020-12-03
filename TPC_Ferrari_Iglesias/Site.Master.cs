using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
namespace TPC_Ferrari_Iglesias
{
    public partial class SiteMaster : MasterPage
    {
        //public List<Productos> ListaCatalogo;
        //public List<Productos> ListaCarrito;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["alguienNuevo"] != null)
            {
                Usuario usuario;
                usuario = (Usuario) Session["alguienNuevo"];
                NombreUsuario.InnerText = usuario.NombreUsuario;
                //nombreUsuario es el id que tiene la p el  el front en el nav bar
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            
            Session["alguienNuevo"] = null;
                

        }
    }
}