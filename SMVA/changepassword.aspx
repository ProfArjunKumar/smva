<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="SMVA.changepassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
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
            position: fixed;
            bottom: 0px;
            left: 0px;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse" style="background-color: #000099; border-color: #000099">
                <div class="container-fluid">
                    <h2 class="text-center" style="color: #fff">Welcome</h2>

                </div>
            </nav>
            <section>
                <div class="container-fluid">
                    <h3 style="text-align: center; color: darkblue;">Change Password</h3>
                    <br />
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                        <div class="col-md-9 col-md-offset-3">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label3" Text="User Name" runat="server" />
                                    <asp:TextBox ID="txtusername" CssClass="form-control" runat="server" Required="Required" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label4" Text="Password" runat="server" />
                                    <asp:TextBox ID="txtpassword" CssClass="form-control" runat="server" Required="Required" />
                                </div>
                            </div>
                        </div>
                            
                        <div class="col-md-9 col-md-offset-3">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label1" Text="New password" runat="server" />
                                    <asp:TextBox ID="txtnewpassword" CssClass="form-control" runat="server" Required="Required" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label5" Text="Confirm Password" runat="server" />
                                    <asp:TextBox ID="txtconfirmpassword" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="New password and Confirm password not match" ForeColor="Red" ControlToCompare="txtnewpassword" ControlToValidate="txtconfirmpassword"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                    <div class="col-md-12">
                        <br />
                        <asp:Button ID="Button1" class="btn btn-success center-block" OnClick="Button1_Click" Style="width: 190px;" runat="server" Text="Change Password" />
                    </div>
                    </div>
                </div>
                </div>
            </section>
            <br />
            <footer class="container-fluid text-center">
                <p>&copy <% Response.Write(DateTime.Now.Year); %> - All Rights Reserved</p>
            </footer>
        </div>
    </form>
</body>
</html>
