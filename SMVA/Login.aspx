<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Login.aspx.cs" Inherits="SMVA.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/favicon.png" />
     <style>
        footer {
      background-color: #000099;
      color: white;
      padding: 15px;
      position:fixed;
      bottom:0px;
      left:0px;
      width:100%;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse" style="background-color:#000099;border-color:#000099">
                <div class="container-fluid">
                   <h2 class="text-center" style="color:#fff">Welcome</h2> 
                    
                </div>
            </nav>
            <div class="container">

                <div class="col-lg-12">
                    <h3 style="text-align: center; color: darkblue;">Login Page</h3>
                    <div class="col-md-4 col-md-offset-4">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="User Name" runat="server" />
                            <asp:TextBox ID="txtusername" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" Display="Dynamic" ForeColor="Red" ControlToValidate="txtusername" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="Password" runat="server" />
                            <asp:TextBox ID="txtpassword" TextMode="Password" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-md-offset-4">
                    <asp:Button ID="Button1" Text="Login" OnClick="Button1_Click" CssClass="btn btn-success col-sm-2" runat="server" />
                    <br />
                    <br />
                    <asp:LinkButton Text="Forgot Password ?" CausesValidation="false" runat="server" PostBackUrl="~/Forgotpassword.aspx" />
                 &nbsp; OR &nbsp;
                    <asp:LinkButton Text="Change Password ?" CausesValidation="false" runat="server" PostBackUrl="~/changepassword.aspx" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
        <br />
        <footer class="container-fluid text-center">
                <p>&copy <% Response.Write(DateTime.Now.Year); %> - All Rights Reserved</p>
            </footer>
    </form>
</body>
</html>
