<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Ferrari_Iglesias.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
       <link rel="stylesheet" href="../css/FormAlta.css" />
</head>
<body>
    <div class="recuadro">
    <form id="form1" runat="server">
         <div class="container" style="align-content: center">
                <div>
                    <asp:Label Text="User:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtUser" CssClass="caja" />
                </div>


              
                <div>
                    <asp:Label Text="Pass:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtPass" CssClass="caja" />
                </div>              
               
                <div style="margin-top: 30px; margin-bottom: 20px">
                    <asp:Button Text="Ingresar" ID="btnIngresar" CssClass="button" OnClick="btnIngresar_Click" runat="server" />
                   

                </div>
            </div>
    </form>
        </div>
</body>
</html>
