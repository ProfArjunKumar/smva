<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SMVA.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMVA</title>
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
        

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
         <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                        <asp:Button Text="Login Here" CssClass="btn btn-primary center-block" Width="200px" runat="server" PostBackUrl="~/Login.aspx" />
                </div>
            </div>
              <br />
        <br />
       
       
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                <img src="images/smva.jpg" alt="smva" class="image center-block" />
                    </div>
            </div>
        </div>
       

        <footer class="container-fluid text-center">
                <p>&copy <% Response.Write(DateTime.Now.Year); %> - All Rights Reserved</p>
            </footer>
    </div>
    </form>
</body>
</html>
