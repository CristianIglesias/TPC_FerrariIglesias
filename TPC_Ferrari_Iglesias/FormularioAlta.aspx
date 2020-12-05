<%@ Page Title="FormularioAlta" Language="C#" AutoEventWireup="true" CodeBehind="FormularioAlta.aspx.cs" Inherits="TPC_Ferrari_Iglesias.FormularioAlta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario de alta </title>
    <%--esto es es cdn para poder usar bootstrap--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <link rel="stylesheet" href="../css/FormAlta.css" />
    <%--ESTO (de arribe) ES PARA CONECTARLO CON LA CARPETA DE CSS Q CREE LLAMADA FORMALTA--%>

    <link href="popup.css" rel="stylesheet" type="text/css" />

    <%--esto es para probar si podemos hacer una ventanita de pop up de mensaje de exito--%>
</head>
<body>
    <div class="recuadro">
        <form id="form1" runat="server">
            <div class="container" style="align-content: center">
                <div>
                    <asp:Label Text="Nombre:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="caja" />
                </div>


                <div class="form-group">
                    <asp:Label Text="Tipo:" runat="server" CssClass="label" />
                    <asp:DropDownList runat="server" CssClass="caja" ID="DdlTipo" AutoPostBack="false">
                    </asp:DropDownList>
                </div>

                <%--               <div>
                <asp:Label Text="idTipo" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtIdTipo" CssClass="caja" />
            </div>
                --%>
                <div>
                    <asp:Label Text="Descripción:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtDescripcion" CssClass="caja" />

                </div>
                <div>
                    <asp:Label Text="Talle:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtTalle" CssClass="caja"  />
                </div>
                <asp:Label Text="Color:" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtColor" maxlegth="20" CssClass="caja" />
               <%-- <asp:RangeValidator ErrorMessage="El valor es incorrecto" MaximumValue="20" MinimumValue="0" ControlToValidate="txtColor" runat="server" />--%>
                <div>
                    <asp:Label Text="Imagen:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtImagen" CssClass="caja" />
                </div>
                <div>
                    <asp:Label Text="Precio:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="caja" />
                </div>
              <%--   <div>
                    <asp:Label Text="Estado:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtEstado" CssClass="caja" />
                </div>--%>
                 <div>
                    <asp:Label Text="Stock actual:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtStockActual" CssClass="caja" />
                </div>
                 <div>
                    <asp:Label Text="Stock mínimo:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtStockMinimo" CssClass="caja" />
                </div>
                <div style="margin-top: 30px; margin-bottom: 20px">
                    <asp:Button Text="Guardar" ID="btnGuardar" CssClass="button" OnClick="btnGuardar_Click" runat="server" />
                    <a href="AbmProductos.aspx" class="btn btn-primary">Cancelar    </a>

                </div>
            </div>


            <%-- <div>
            <p><a href="#popup">Abrir Popup</a></p>
        </div>
        <div id="popup" class="overlay">
            <div id="popupBody">
                <h2>Exito</h2>
                <a id="cerrar" href="#">&times;</a>
                <div class="popupContent">
                    <p>Cargaste bien la remerita!</p>
                </div>
            </div>
        </div>--%>
        </form>
    </div>
</body>
</html>
