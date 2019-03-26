<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMAssignedWork.aspx.cs" Inherits="SMVA.TMAssignedWork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TEAM MEMBER ASSIGN WORK</title>
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
                            <h3 style="text-align: center; color: darkblue;">Assign Work</h3>
        <br />
        <br />
        <br />
        <br />

    <center>
        <div class="col-sm-3 col-sm-offset-8">
                        <div class="form-group">
                            <asp:Button ID="Button2" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button2_Click" />
                        </div>
                    </div>
        <div class="row col-md-offset-1" style="width:60%;overflow-x:auto">
        <asp:GridView ID="GridView1" RowStyle-Height="40px" RowStyle-Width="40px" HeaderStyle-Height="40px" HeaderStyle-Width="40px" runat="server" AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="wrokorder" HeaderText="Work Order" />
                <asp:BoundField DataField="date" HeaderText="Date" />
                <asp:BoundField DataField="companyname" HeaderText="Company Name" />
                <asp:BoundField DataField="position" HeaderText="Title" />
                <asp:BoundField DataField="noofposition" HeaderText="No Of Position" />
                <asp:BoundField DataField="designation" HeaderText="Designation" />
                <asp:BoundField DataField="assign" HeaderText="Assigned To" />
            </Columns>

            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />

<HeaderStyle Height="40px" Width="40px" BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF"></HeaderStyle>

            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />

<RowStyle Height="40px" Width="40px" BackColor="White" ForeColor="#003399"></RowStyle>
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />

        </asp:GridView>
            </div>
         <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
<%--                        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />--%>
                        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
                        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
<%--                        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>
                        <script type="text/javascript">
                            $(function () {
                                $('[id*=GridView1]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                                    "responsive": true,
                                    "sPaginationType": "full_numbers"
                                });
                            });
                        </script>
              
    </center>
        <br />
            <br />
            <br />
            <br />
            <br /><br />
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
