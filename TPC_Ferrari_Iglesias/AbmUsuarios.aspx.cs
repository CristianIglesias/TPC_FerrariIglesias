﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_Ferrari_Iglesias
{
    public partial class AbmUsuarios : System.Web.UI.Page
    {
        public List<Usuario> ListaUsuarios;
        protected void Page_Load(object sender, EventArgs e)
        {
            //ListaUsuarios = new List<Usuario>();
            UsuarioNegocio negocioUsuario = new UsuarioNegocio();
            ListaUsuarios = negocioUsuario.Listar();
        }
    }
}