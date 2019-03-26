<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMWeekReport.aspx.cs" Inherits="SMVA.TMWeekReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TEAM MEMBER WEEKLY REPORT</title>
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
            position: relative;
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
                            <li><a href="TMMyProfile.aspx" style="color:#fff">My PROFILE</a></li>
                            <li><a href="TMOntimeReport.aspx" style="color: #fff">ON TIME REPORT</a></li>
                            <li><a href="TMWeekReport.aspx" style="color: #fff">WEEK REPORT</a></li>
                            <li><a href="TMAssignedWork.aspx" style="color: #fff">ASSIGNED WORK</a></li>
                            <li><a href="TMAddClient.aspx" style="color: #fff">ADD CLIENT</a></li>
                            <li><a href="TMAddPosition.aspx" style="color: #fff">ADD POSITION</a></li>
                            <li><a href="TMKnowledgeBank.aspx" style="color: #fff">KNOWLEDGE BANK</a></li>
                            <li><a href="TMDataBank.aspx" style="color: #fff">DATA BANK</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <asp:Button ID="btn_logout" runat="server" Text="LOGOUT" CssClass="btn btn-danger navbar-btn" OnClick="btn_logout_Click" UseSubmitBehavior="false" />
                        </ul>
                    </div>
                </div>
            </nav>

            <section>
                <div class="container" style="margin-top: 50px;">
                    <h3 style="text-align: center; color: darkblue;">Week Report</h3>
                    <br />
                    <br />
                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label3" Text="Employee Name" runat="server" />
                                    <asp:TextBox ID="txtemployeename" ReadOnly="true" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label4" Text="Week Start Date" runat="server" />
                                    <asp:TextBox ID="txtweekstart" TextMode="Date" CssClass="form-control" runat="server" Required="Required"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label12" Text="Week End Date" runat="server" />
                                    <asp:TextBox ID="txtweekend" TextMode="Date" CssClass="form-control" runat="server" Required="Required"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label1" Text="Client name" runat="server" />
                                    <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Select Client Name" ForeColor="Red" ControlToValidate="DropDownList1" runat="server" />
                                </div>
                            </div>

                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label5" Text="Designation" runat="server" />
                                    <asp:TextBox ID="txtdesignation" ReadOnly="true" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label7" Text="Number of Positions" runat="server" />
                                    <asp:TextBox ID="txtnumberofposition" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtnumberofposition" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid number" ForeColor="Red" ValidationExpression="[0-9]{1,10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label8" Text="Calls" runat="server" />
                                    <asp:TextBox ID="txtcalls" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtcalls" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid number" ForeColor="Red" ValidationExpression="[0-9]{1,10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label2" Text="Submited CV's" runat="server" />
                                    <asp:TextBox ID="txtsubmitedcvs" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtsubmitedcvs" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter valid number" ForeColor="Red" ValidationExpression="[0-9]{1,10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label6" Text="Face to Face" runat="server" />
                                    <asp:TextBox ID="txtftf" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label9" Text="Closures with details" runat="server" />
                                    <asp:TextBox ID="txtclousers" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label10" Text="Remark" runat="server" />
                                    <asp:TextBox ID="txtremark" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>


                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label11" Text="Target" runat="server" />
                                    <asp:TextBox ID="txttarget" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txttarget" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter valid number" ForeColor="Red" ValidationExpression="[0-9]{1,10}"></asp:RegularExpressionValidator>
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
            <br />

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">

                        <div class="col-md-8 col-md-offset-1" style="width: 80%; overflow-x: auto">
                            <asp:GridView ID="GridView1" runat="server" RowStyle-Width="40px" RowStyle-Height="40px" HeaderStyle-Height="40px" HeaderStyle-Width="40px" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
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
                                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" ForeColor="#003399" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smva %>" SelectCommand="SELECT * FROM [weekly_mis_report] WHERE ([username] = @username)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="username" SessionField="TM" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
