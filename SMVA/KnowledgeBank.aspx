<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KnowledgeBank.aspx.cs" Inherits="SMVA.KnowledgeBank" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowledge Bank</title>
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
            position: fixed;
            bottom: 0px;
            left: 0px;
            width: 100%;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse" style="background-color: #000099; border-color: #000099">
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
                            <li class="dropdown">
                                <a class="dropdown-toggle active" data-toggle="dropdown" href="#" style="background-color: #000099; color: #fff">HR<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="AddEmployee.aspx">ADD EMPLOYEE</a></li>
                                    <li><a href="Relieving.aspx">RELIEVING</a></li>
                                </ul>
                            </li>
                            <li><a href="AddUser.aspx" style="color: #fff">ADD USER</a></li>
                            <li><a href="AddClient.aspx" style="color: #fff">ADD CLIENT</a></li>
                            <li><a href="AddPosition.aspx" style="color: #fff">ADD POSITION</a></li>
                            <li><a href="Assignwork.aspx" style="color: #fff">ASSIGN WORK</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle active" data-toggle="dropdown" href="#" style="background-color: #000099; color: #fff">REPORTS<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="OnTimeReport.aspx">ON TIME REPORT</a></li>
                                    <li><a href="WeeklyReport.aspx">WEEKLY REPORT</a></li>
                                </ul>
                            </li>
                            <li><a href="KnowledgeBank.aspx" style="color: #fff">KNOWLEDGE BANK</a></li>
                            <li><a href="DataBank.aspx" style="color: #fff">DATA BANK</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <asp:Button ID="btn_logout" runat="server" Text="LOGOUT" CssClass="btn btn-danger navbar-btn" PostBackUrl="~/Login.aspx" UseSubmitBehavior="false" CausesValidation="false" />
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container-fluid">
                <h3 style="text-align: center; color: darkblue;">Knowledge Bank</h3>
                <br />
                <br />
                <br />
                <br />
                <div class="row">
                    <div class="col-md-12 center">
                        <div class="col-md-4 col-md-offset-4">
                            <div class="form-group">
                                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                <br />
                                <asp:Button ID="Button1" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="Button1_Click" />
                            </div>

                        </div>
                    </div>
                </div>
            
            <br />
            <br />
            <br />
            <br />
            <br />
            <center>
                        <div class="col-md-12 col-md-offset-3 center" style="width: 40%; overflow-x: auto;overflow-x:auto;margin-left:400px">

            <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-HorizontalAlign="Center" runat="server" EmptyDataText="Please Upload New File" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ID" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="2px" CellPadding="50" Font-Size="Medium" Width="400px" AutoGenerateDeleteButton="True" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True">
                <AlternatingRowStyle BorderStyle="Solid" />
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>                            
                            <asp:HyperLink ID="HyperLink1" runat="server" Text="View" Target = "_Blank" NavigateUrl='<%# Eval("ID","pdf.aspx?ID={0}") %>'></asp:HyperLink>
                        </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="ID" HeaderText="ID" />--%>
                    <asp:BoundField DataField="FileName" HeaderText="File Name" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Height="30px" Width="600px" Wrap="True" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle Height="40px" Width="800px" BackColor="White" ForeColor="#003399" BorderStyle="Solid" BorderWidth="0px" VerticalAlign="Top" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>

                             <br />
            <br />
            <br />

                            <asp:button text="Back" ID="btnback" Visible="false" CssClass="btn-success" OnClick="btnback_Click1" runat="server" />
                             <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                </div>
  
</div>
                </center>
            <br />
            <br />
            <div>                
            </div>
            <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                </div>
             <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                </div>
                </div>
  
            <footer class="container-fluid text-center">
                <p>&copy <% Response.Write(DateTime.Now.Year); %> - All Rights Reserved</p>
            </footer>
        </div>
    </form>
</body>
</html>
