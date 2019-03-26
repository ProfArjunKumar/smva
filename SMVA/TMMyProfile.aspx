<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMMyProfile.aspx.cs" Inherits="SMVA.TMMyProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TEAM MEMBER ONTIME REPORT</title>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/revolution-slider.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <!-- Responsive -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/favicon.png" />

    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse" style="background-color:#000099;border-color:#000099">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li><a href="TMMyProfile.aspx" style="color:#fff">My PROFILE</a></li>
                            <li><a href="TMOnTimeReport.aspx" style="color:#fff">ON TIME REPORT</a></li>
                            <li><a href="TMWeekReport.aspx" style="color:#fff">WEEK REPORT</a></li>
                            <li><a href="TMAssignedWork.aspx" style="color: #fff">ASSIGNED WORK</a></li>
                            <li><a href="TMAddClient.aspx" style="color: #fff">ADD CLIENT</a></li>
                            <li><a href="TMAddPosition.aspx" style="color: #fff">ADD POSITION</a></li>
                            <li><a href="TMKnowledgeBank.aspx" style="color: #fff">KNOWLEDGE BANK</a></li>
                            <li><a href="TMDataBank.aspx" style="color: #fff">DATA BANK</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <asp:Button ID="btn_logout" runat="server" Text="LOGOUT" CssClass="btn btn-danger navbar-btn" OnClick="btn_logout_Click" UseSubmitBehavior="false" CausesValidation="false" />
                        </ul>
                    </div>
                </div>
            </nav>
            <section>
                <div class="container">
                    <h3 style="text-align: center; color: darkblue;">My Profile</h3>
                    <br />
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label3" Text="ID" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtid" ReadOnly="true" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label4" Text="Date" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdate" ReadOnly="true" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>


                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:ScriptManager runat="server" />
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="Label1" Text="Name" runat="server" Font-Size="Large" />
                                            <asp:TextBox ID="TextBox1" AutoPostBack="true" CssClass="form-control" runat="server" Required="Required" />
                                            <asp:Label ID="emsg" runat="server" />

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label2" Text="Gender" runat="server" Font-Size="Large" />
                                    <asp:DropDownList CssClass="form-control" ID="ddlGender" runat="server">
                                        <asp:ListItem Text="--Select--" />
                                        <asp:ListItem Text="Male" />
                                        <asp:ListItem Text="Female" />
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Select Gender" ForeColor="Red" ControlToValidate="ddlGender" InitialValue="--Select--" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label5" Text="Designation" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdesi" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label6" Text="Joining Date" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtjdate" TextMode="Date" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label7" Text="Mobile" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtmobile" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label8" Text="Address" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label9" Text="Email Id" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" runat="server" ErrorMessage="Enter Email in Correct Format" ControlToValidate="txtemail">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label10" Text="Emergency Contact" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtContact" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label11" Text="Target" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txttarget" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txttarget" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter valid number" ForeColor="Red" ValidationExpression="[0-9]{1,10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label12" Text="Portal alloted" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtportal" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label13" Text="Client Account Manager Responsibility" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtclient" TextMode="MultiLine" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label14" Text="Franchise Account Manager Responsibility" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtfranchies" TextMode="MultiLine" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <br />
                            <asp:Button ID="btnedit" OnClick="btnedit_Click" class="btn btn-success center-block" Style="width: 190px;" runat="server" Text="Edit" />
                            <asp:Button ID="btnupdate" OnClick="btnupdate_Click" CausesValidation="false" UseSubmitBehavior="false" class="btn btn-success center-block" Style="width: 190px;" runat="server" Text="Update" Visible="false" />                            
                        </div>
                    </div>
                </div>
            </section>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <footer class="container-fluid text-center">
                <p>&copy <% Response.Write(DateTime.Now.Year); %> - All Rights Reserved</p>
            </footer>

        </div>

    </form>
</body>
</html>
