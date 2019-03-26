<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="TMOnTimeReport.aspx.cs" Inherits="SMVA.TMOnlineReport" %>

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
                <div class="container-fluid" style="margin-top: 50px;">
                    <h3 style="text-align: center; color: darkblue;">OnTime Report</h3>
                            <br />
                            <br />
                            <br />
                            <br />

                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label3" Text="Date" runat="server" />
                                    <asp:TextBox ID="txtdate" ReadOnly="true" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label4" Text="Name" runat="server" />
                                    <asp:TextBox ID="txtname" ReadOnly="true" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label1" Text="Select Time" runat="server" />
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="---- Select Report Time ----" />
                                        <asp:ListItem Text="12:30" />
                                        <asp:ListItem Text="3:30" />
                                        <asp:ListItem Text="6:00" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Please Select Time" ForeColor="Red" ControlToValidate="DropDownList1" InitialValue="---- Select Report Time ----" runat="server" />
                                </div>
                            </div>
                            
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label5" Text="Company Name" runat="server" />
                                    <%--<asp:TextBox ID="txtcompanyname" CssClass="form-control" runat="server" Required="Required" />--%>
                                    <asp:DropDownList ID="ddlcompanyname" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlcompanyname_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Please select Company name" ForeColor="Red" ControlToValidate="ddlcompanyname" runat="server" InitialValue="-1" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label7" Text="Designation" runat="server" />
                                    <asp:TextBox ID="txtdesignation" CssClass="form-control" runat="server" ReadOnly="true" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label8" Text="Number of CV's" runat="server" />
                                    <asp:TextBox ID="txtnoofcvs" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtnoofcvs" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid number" ForeColor="Red" ValidationExpression="[0-9]{1,5}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:Label ID="Label2" Text="Next Day Line Ups" runat="server" />
                                    <asp:TextBox ID="txtnextdaylineup" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:Label ID="Label6" Text="Next Day Plan" runat="server" />
                                    <asp:TextBox ID="txtnextdayplan" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <br />
                            <br />
                            <br />
                            <br />

                            <asp:Button ID="Button1" class="btn btn-success center-block" OnClick="Button1_Click" Style="width: 190px;" runat="server" Text="SUBMIT" />
                        </div>
                    </div>
                </div>
            </section> 
        <br />
        <br />
        <br />
        <div class="row col-md-offset-1" style="width:80%;overflow-x:auto">
        <asp:GridView ID="GridView1" ClientIDMode="Static" runat="server" RowStyle-Height="40px" RowStyle-Width="40px" HeaderStyle-Height="40px"
            HeaderStyle-Width="40px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="time01" HeaderText="Time" SortExpression="Designation03" />
                <asp:BoundField DataField="companyname01" HeaderText="Company Name" SortExpression="companyname01" />
                <asp:BoundField DataField="Designation01" HeaderText="Designation" SortExpression="Designation01" />
                <asp:BoundField DataField="numberofcv01" HeaderText="Number of Cv" SortExpression="numberofcv01" />
                <asp:BoundField DataField="time02" HeaderText="Time" SortExpression="Designation03" />
                <asp:BoundField DataField="companyname02" HeaderText="Company Name" SortExpression="companyname02" />
                <asp:BoundField DataField="Designation02" HeaderText="Designation" SortExpression="Designation02" />
                <asp:BoundField DataField="numberofcv02" HeaderText="Number of Cv" SortExpression="numberofcv02" />
                <asp:BoundField DataField="time03" HeaderText="Time" SortExpression="Designation03" />
                <asp:BoundField DataField="companyname03" HeaderText="Company Name" SortExpression="companyname03" />
                <asp:BoundField DataField="Designation03" HeaderText="Designation" SortExpression="Designation03" />
                <asp:BoundField DataField="numberofcv03" HeaderText="Number of Cv" SortExpression="numberofcv03" />
                <asp:BoundField DataField="nextdaylineups" HeaderText="Next Day Lineups" SortExpression="nextdaylineups" />
                <asp:BoundField DataField="nextdayplan" HeaderText="Nextday Plan" SortExpression="nextdayplan" />
                <asp:BoundField DataField="username" HeaderText="User Name" SortExpression="username" />
            </Columns>
            <HeaderStyle Height="40px" Width="40px" BackColor="#003399" ForeColor="#CCCCFF" />
            <RowStyle Height="40px" Width="40px" BackColor="White" ForeColor="#003399" />
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />

<HeaderStyle Height="40px" Width="40px" BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />

<RowStyle Height="40px" Width="40px" BackColor="#EFF3FB"></RowStyle>
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />

        </asp:GridView>
            </div>
        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
                        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
                        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
                        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
                        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
                        <script type="text/javascript">
                            $(function () {
                                $('[id*=GridView1]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                                    "responsive": true,
                                    "sPaginationType": "full_numbers"
                                });
                            });
                        </script>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smva %>" SelectCommand="SELECT * FROM [ontime_report] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="TM" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
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
