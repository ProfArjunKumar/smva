<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Assignwork.aspx.cs" Inherits="SMVA.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGN WORK</title>
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
                            <asp:Button ID="btn_logout" runat="server" UseSubmitBehavior="false" CausesValidation="false" Text="LOGOUT" PostBackUrl="~/Login.aspx" CssClass="btn btn-danger navbar-btn" />
                        </ul>
                    </div>
                </div>
            </nav>
            <section>
                <div class="container">
                    <h3 style="text-align: center; color: darkblue;">Assign Work</h3>
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label3" Text="Work Order ID" runat="server" />
                                    <asp:TextBox ID="txtorderid" ReadOnly="true" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label4" Text="Date" runat="server" />
                                    <asp:TextBox ID="txtdate" ReadOnly="true" CssClass="form-control" runat="server" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>


                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label1" Text="Company Name" runat="server" />
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Select Company" ForeColor="Red" ControlToValidate="DropDownList1" runat="server" InitialValue="-1" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label2" Text="Client Id" runat="server" />
                                    <asp:TextBox ID="txtcompanyname" ReadOnly="true" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label5" Text="Opening Positions(Title)" runat="server" />
                                    <asp:DropDownList ID="ddlopening" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlopening_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Select client id" ForeColor="Red" ControlToValidate="ddlopening" runat="server" InitialValue="-1" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label6" Text="Number of Positions" runat="server" />
                                    <asp:TextBox ID="txtnumberofposition" ReadOnly="true" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label7" Text="Designation" runat="server" />
                                    <asp:TextBox ID="txtdesignation" ReadOnly="true" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label8" Text="Assigning To Employee" runat="server" />
                                    <asp:DropDownList ID="ddlassign" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Select Employee name" ForeColor="Red" ControlToValidate="ddlassign" runat="server" InitialValue="-1" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Button1" class="btn btn-success center-block" OnClick="Button1_Click" Style="width: 190px;" runat="server" Text="ADD" />
                    </div>
                </div>
                <br />
                <br />
                <center>
                 <div class="row col-md-offset-0" style="width:50%;">

                <asp:GridView ID="gvradd" RowStyle-Height="100px" RowStyle-Width="100px" HeaderStyle-Height="40px" HeaderStyle-Width="40px" ClientIDMode="Static" runat="server" AutoGenerateDeleteButton="True" OnRowDeleting="gvradd_RowDeleting" CellPadding="10" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" >
                    <EditRowStyle BorderStyle="Solid" />
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Height="40px" Width="200px" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" Height="40px" Width="200px" ForeColor="#003399" />
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
              
                     <asp:Button ID="Button2" Style="width: 190px;" class="btn btn-success center-block" runat="server" Text="Submit" OnClick="Button2_Click" />
                 
                
                <div class="container-fluid">
                    <div class="col-sm-3 col-sm-offset-9">
                        <div class="form-group">
                            <asp:Button ID="Button3" Text="ExporttoExcel" CssClass="btn btn-primary" CausesValidation="false" runat="server" UseSubmitBehavior="false" OnClick="Button3_Click" />
                        </div>
                    </div>
                <div class="row col-md-offset-1" style="width:80%;">

             
                <asp:GridView ID="GridView1" RowStyle-Height="40px" RowStyle-Width="40px" HeaderStyle-Height="40px" HeaderStyle-Width="40px" ClientIDMode="Static" runat="server" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="wrokorder" HeaderText="wrokorder" SortExpression="wrokorder" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        <asp:BoundField DataField="clientid" HeaderText="clientid" SortExpression="clientid" />
                        <asp:BoundField DataField="companyname" HeaderText="companyname" SortExpression="companyname" />
                        <asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />
                        <asp:BoundField DataField="noofposition" HeaderText="noofposition" SortExpression="noofposition" />
                        <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" />
                        <asp:BoundField DataField="assign" HeaderText="assign" SortExpression="assign" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Height="40px" Width="200px" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" Height="40px" Width="250px" ForeColor="#003399" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smva %>" SelectCommand="SELECT * FROM [assign]" DeleteCommand="DELETE FROM [assign] WHERE [id] = @id" InsertCommand="INSERT INTO [assign] ([wrokorder], [date], [clientid], [companyname], [position], [noofposition], [designation], [assign]) VALUES (@wrokorder, @date, @clientid, @companyname, @position, @noofposition, @designation, @assign)" UpdateCommand="UPDATE [assign] SET [wrokorder] = @wrokorder, [date] = @date, [clientid] = @clientid, [companyname] = @companyname, [position] = @position, [noofposition] = @noofposition, [designation] = @designation, [assign] = @assign WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="wrokorder" Type="Int32" />
                            <asp:Parameter Name="date" Type="String" />
                            <asp:Parameter Name="clientid" Type="String" />
                            <asp:Parameter Name="companyname" Type="String" />
                            <asp:Parameter Name="position" Type="String" />
                            <asp:Parameter Name="noofposition" Type="String" />
                            <asp:Parameter Name="designation" Type="String" />
                            <asp:Parameter Name="assign" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="wrokorder" Type="Int32" />
                            <asp:Parameter Name="date" Type="String" />
                            <asp:Parameter Name="clientid" Type="String" />
                            <asp:Parameter Name="companyname" Type="String" />
                            <asp:Parameter Name="position" Type="String" />
                            <asp:Parameter Name="noofposition" Type="String" />
                            <asp:Parameter Name="designation" Type="String" />
                            <asp:Parameter Name="assign" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
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
