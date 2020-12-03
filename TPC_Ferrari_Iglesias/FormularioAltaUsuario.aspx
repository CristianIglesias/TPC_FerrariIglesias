<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioAltaUsuario.aspx.cs" Inherits="TPC_Ferrari_Iglesias.FormularioAltaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>FORMULARIO DE ALTA PARA USUARIOS</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <link rel="stylesheet" href="../css/FormAltaUsuarios.css" />

</head>
<body >
    <div class="recuadro">
    <form id="form1" runat="server">
        <div class="container" style="align-content: center">

            <div>
                <asp:Label Text="Nombre" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtNombre" PlaceHolder="Escribi tu nombre :)" CssClass="caja" />
                <asp:RequiredFieldValidator ErrorMessage="El campo NOMBRE es un campo obligatorio" ForeColor="Red" ControlToValidate="txtNombre" runat="server" />
                <%--<asp:RangeValidator ErrorMessage="Campo incorrecto"  MaximunValue="20" MinimuValue="1"  type="string" ForeColor="Red" ControlToValidate="txtNombre" runat="server" />--%>
            </div>
            <div>
                <asp:Label Text="Apellido" MaxLegth="30" runat="server" CssClass="label" />
                <asp:TextBox runat="server"  PlaceHolder="Escribi tu Apellido :)" ErrorMessage="Campo incorrecto" type="string" MaximunValue="30" MinimuValue="1" ID="txtApellido" CssClass="caja" />
            
            </div>
            <div>
                <asp:Label Text="DNI" runat="server" CssClass="label" />
                <asp:TextBox  PlaceHolder="Importantísimo que escribas tu DNI :)"  runat="server" ID="txtDNI" CssClass="caja" />
                <asp:RequiredFieldValidator ErrorMessage="El campo DNI es un campo obligatorioerrormessage" ForeColor="Red" ControlToValidate="txtDNI" runat="server" />
            </div>
            <div>
                <asp:Label Text="Email" runat="server" CssClass="label" />
                <asp:TextBox runat="server" PlaceHolder="ejemplo@holaejemplo.com" ID="txtEmail" CssClass="caja" />
                <asp:RequiredFieldValidator ErrorMessage="El MAIL es un campo obligatorio" ForeColor="Red" ControlToValidate="txtEmail" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Mail incorrecto"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" runat="server" />
            
            </div>

            <div>
                <asp:Label Text="Nombre de usuario" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtNombreUsuario"   CssClass="caja" />
                <asp:RequiredFieldValidator ErrorMessage="El NOMBRE DE USUARIO es un campo obligatorio" ForeColor="Red" ControlToValidate="txtNombreUsuario" runat="server" />
                
            </div>

            <div>
                <asp:Label Text="Contraseña" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtContraseña" CssClass="caja" />
                <asp:RequiredFieldValidator ErrorMessage="El NOMBRE DE USUARIO es un campo obligatorio" ForeColor="Red" ControlToValidate="txtContraseña" runat="server" />
            </div>
            
            <%--<div>
                <asp:Label Text="Confirmar contraseña" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtConfirmar" CssClass="caja" />
                <asp:RequiredFieldValidator ErrorMessage="El NOMBRE DE USUARIO es un campo obligatorio" ForeColor="Red" ControlToValidate="txtContraseña" runat="server" />
                <asp:RangeValidator ErrorMessage="errormessage" ControlToValidate="txtConfirmar" runat="server" />
            EL ODIGO ESTA ACA: https://www.tutorialesprogramacionya.com/aspnetya/detalleconcepto.php?codigo=68
            </div>--%>

                  <div>
                <asp:Label Text="Fecha de Nacimiento" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtFechaNac" CssClass="caja" />
                <asp:RequiredFieldValidator ErrorMessage="La FECHA DE NACIMIENTO es un campo obligatorio" type="Date" ForeColor="Red"  PlaceHolder="Día-Mes-Año. Ejemplo: 15-08-1982" ControlToValidate="txtFechaNac" runat="server" />
            </div>

                  <div>
                <asp:Label Text="Género" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtGenero" PlaceHolder="ESTE CAMPO HAY QUE SACARLO" CssClass="caja" />
            </div>

                  <div>
                <asp:Label Text="Nro De Teléfono" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtTelefono" CssClass="caja" />
                      <asp:RequiredFieldValidator ErrorMessage="El NÚMERO DE TÉLEFONO es un campo obligatorio"  ForeColor="Red" ControlToValidate="txtTelefono" runat="server" />
                      <%--<asp:RegularExpressionValidator ErrorMessage="Solo aceptamos números"  ValidationExpression="^[0-9]{1,10}$"  ControlToValidate="txtTelefono" runat="server" />--%>
                      <asp:RegularExpressionValidator ErrorMessage="Solo aceptamos números" ForeColor="Red"  ControlToValidate="txtTelefono" runat="server" ValidationExpression="^[0-9]{1,10}$"   />
                  </div>
                  <div>
                <asp:Label Text="Código Postal" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtCodPost" CssClass="caja" />
                      <asp:RequiredFieldValidator ErrorMessage="El CÓDIGO POSTAL es un campo obligatorio"  ForeColor="Red" ControlToValidate="txtCodPost" runat="server" />
             <asp:RegularExpressionValidator ErrorMessage="Solo aceptamos números" ForeColor="Red"  ControlToValidate="txtCodPost" runat="server" ValidationExpression="^[0-9]{1,6}$"   />
                  </div>
                  <div>
                <asp:Label Text="Direccion" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtDireccion" CssClass="caja" />
                      <asp:RequiredFieldValidator ErrorMessage="La DIRECCIÓN es un campo obligatorio" ForeColor="Red" ControlToValidate="txtDireccion" runat="server" />
            <asp:RegularExpressionValidator ErrorMessage="Ups, hay algo que salió mal :(" ForeColor="Red"  ControlToValidate="txtDireccion" runat="server" ValidationExpression=""   />
                    
                  </div>
                  <div>
                <asp:Label Text="Ciudad" runat="server" CssClass="label" />
                <asp:TextBox runat="server" ID="txtCiudad" CssClass="caja" />
                      <asp:RequiredFieldValidator ErrorMessage="La DIRECCIÓN es un campo obligatorio" ForeColor="Red" ControlToValidate="txtCiudad" runat="server" />
                      <asp:RegularExpressionValidator ErrorMessage="Ups, hay algo que salió mal :("  ForeColor="Red" ControlToValidate="txtCiudad" runat="server" ValidationExpression="" />     
                   

                      </div>

            <div style="margin-top: 30px; margin-bottom: 20px">
                <asp:Button Text="Guardar" ID="btnGuardar" CssClass="button"  OnClick="btnGuardar_Click" runat="server" />
                <a href="AbmUsuarios.aspx" class="btn btn-primary">Cancelar</a>


            </div>
        </div>
    </form>
        </div>
</body>
</html>
