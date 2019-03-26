<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="TMKnowledgeBank.aspx.cs" Inherits="SMVA.TMKnowledgeBank" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TEAM MEMBER KNOWLEDGE BANK</title>
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
                            <asp:Button ID="btn_logout" runat="server" Text="LOGOUT" CssClass="btn btn-danger navbar-btn" UseSubmitBehavior="false" CausesValidation="false" OnClick="btn_logout_Click" />
                        </ul>
                    </div>
                </div>
            </nav>
           
            <center>
                        <div class="col-md-12 col-md-offset-3" style="width: 40%; overflow-x: auto;align-content:center;margin-left:400px">

            <asp:GridView ID="GridView1" ClientIDMode="Static" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" EmptyDataText="No Records Found" DataKeyNames="ID" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="2px" CellPadding="100" Font-Size="Larger" Width="500px" >
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
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Height="30px" Width="500px" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle Height="50px" Width="800px" BackColor="White" ForeColor="#003399" BorderStyle="Solid" BorderWidth="0px" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
</div>
                </center>
                <br />
                <br />
                <br />
                <br />
            <asp:Button Text="Back" ID="btnback" Visible="false" CssClass="btn-success" OnClick="btnback_Click" runat="server" />



            <div>
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
            </div>
            <footer class="container-fluid text-center">
                <p>&copy <% Response.Write(DateTime.Now.Year); %> - All Rights Reserved</p>
            </footer>
        </div>
    </form>
</body>
</html>
