﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeeklyReport.aspx.cs" Inherits="SMVA.WeeklyReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WEEKLY REPORT</title>
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
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
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
                            <li class="dropdown">
                                <a class="dropdown-toggle active" data-toggle="dropdown" href="#"  style="background-color: #000099;color:#fff">HR<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="AddEmployee.aspx">ADD EMPLOYEE</a></li>
                                    <li><a href="Relieving.aspx">RELIEVING</a></li>
                                </ul>
                            </li>
                            <li><a href="AddUser.aspx" style="color:#fff">ADD USER</a></li>
                            <li><a href="AddClient.aspx" style="color:#fff">ADD CLIENT</a></li>
                            <li><a href="AddPosition.aspx" style="color: #fff">ADD POSITION</a></li>
                            <li><a href="Assignwork.aspx" style="color: #fff">ASSIGN WORK</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle active" data-toggle="dropdown" href="#" style="background-color: #000099;color:#fff">REPORTS<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="OnTimeReport.aspx">ON TIME REPORT</a></li>
                                    <li><a href="WeeklyReport.aspx">WEEKLY REPORT</a></li>
                                </ul>
                            </li>
                            <li><a href="KnowledgeBank.aspx" style="color: #fff">KNOWLEDGE BANK</a></li>
                            <li><a href="DataBank.aspx" style="color: #fff">DATA BANK</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <asp:Button ID="btn_logout" runat="server" Text="LOGOUT" CssClass="btn btn-danger navbar-btn" PostBackUrl="~/Login.aspx" />
                        </ul>
                    </div>
                </div>
            </nav>
            <section>
                <div class="container">
                    <h3 style="text-align: center; color: darkblue;">Weekly Reports</h3>
                    <br />
                    <br />
                    <br />
                            <br />

                    <div class="col-sm-3 col-sm-offset-9">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <div class="row col-md-offset-1" style="width:80%;overflow-x:auto">
                        <asp:GridView ID="GridView1" RowStyle-Height="40px" RowStyle-Width="40px" HeaderStyle-Height="40px" HeaderStyle-Width="40px" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="empid" HeaderText="empid" SortExpression="empid" />
                                <asp:BoundField DataField="weekstartingdate" HeaderText="weekstartingdate" SortExpression="weekstartingdate" />
                                <asp:BoundField DataField="clientname" HeaderText="clientname" SortExpression="clientname" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                <asp:BoundField DataField="numberofpositions" HeaderText="numberofpositions" SortExpression="numberofpositions" />
                                <asp:BoundField DataField="calls" HeaderText="calls" SortExpression="calls" />
                                <asp:BoundField DataField="submittedcv" HeaderText="submittedcv" SortExpression="submittedcv" />
                                <asp:BoundField DataField="F2F" HeaderText="F2F" SortExpression="F2F" />
                                <asp:BoundField DataField="closureswithdetails" HeaderText="closureswithdetails" SortExpression="closureswithdetails" />
                                <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
                                <asp:BoundField DataField="target" HeaderText="target" SortExpression="target" />
                                <asp:BoundField DataField="weekendingdate" HeaderText="weekendingdate" SortExpression="weekendingdate" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smva %>" SelectCommand="SELECT * FROM [weekly_mis_report]"></asp:SqlDataSource>
                       
                    </div>
                </div>
            </section>
                    <br />
                    <br />
                            <br />
                            <br />
                            <br />
                            <br /><br />
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
