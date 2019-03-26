<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddPosition.aspx.cs" Inherits="SMVA.AddPosition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Position</title>
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
                            <asp:Button ID="btn_logout" runat="server" Text="LOGOUT" CssClass="btn btn-danger navbar-btn" UseSubmitBehavior="false" CausesValidation="false" PostBackUrl="~/Login.aspx" />
                        </ul>
                    </div>
                </div>
            </nav>
            <section>
                <div class="container">
                    <br />
                    <br />
                    <br />
                    <h3 style="text-align: center; color: darkblue;">Add Position</h3>
                    <br />
                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label3" Text="Position ID" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtpositionid" ReadOnly="true" CssClass="form-control" runat="server" />
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
                                    <asp:Label ID="Label1" Text="Company Name" runat="server" Font-Size="Large" />
                                    <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Please Select Company" ForeColor="Red" ControlToValidate="DropDownList1" InitialValue="-1" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label2" Text="Client Id" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtcompanyname" ReadOnly="true" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label5" Text="SPOC Name" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtspocname" CssClass="form-control" runat="server" Required="Required" />
<%--                                    <asp:RegularExpressionValidator ControlToValidate="txtspocname" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label6" Text="SPOC Number" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtspocnumber" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtspocnumber" ID="RegularExpressionValidator2" ForeColor="Red" runat="server" ErrorMessage="Enter Valid Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label7" Text="Title" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txttitle" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label8" Text="Designation" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdesignation" CssClass="form-control" runat="server" Required="Required" />
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpassword" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:Label ID="Label10" Text="Number of Position" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Required="Required" />
                                    <asp:RegularExpressionValidator ControlToValidate="TextBox1" ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Enter only number" ValidationExpression="[0-9]{1,10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:Label ID="Label9" Text="Description" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdescription" TextMode="MultiLine" CssClass="form-control" runat="server" Required="Required" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <br />
            <br />
            <br />

                            <asp:Button ID="Button1" class="btn btn-success center-block" Style="width: 190px;" OnClick="Button1_Click" runat="server" Text="ADD" />
                        </div>
                    </div>
                </div>
            </section>
                    <br />
            <br />
            <br />
            <br />
            <center>
                    <div class="col-sm-4 col-sm-offset-8">
                        <div class="form-group">
                            <asp:Button ID="Button2" Text="ExporttoExcel" CssClass="btn btn-primary" CausesValidation="false" runat="server" UseSubmitBehavior="false" OnClick="Button2_Click" />
                        </div>
                    </div>
                
             <div class="row col-md-offset-0" style="width:80%;">
            <asp:GridView ID="GridView1" RowStyle-width="40px" RowStyle-Height="40px" HeaderStyle-Width="40px" HeaderStyle-Height="40px" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" Font-Strikeout="False" HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" CausesValidation="false" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="clientid" HeaderText="clientid" SortExpression="clientid" />
                    <asp:BoundField DataField="companyname" HeaderText="companyname" SortExpression="companyname" />
                    <asp:BoundField DataField="spocname" HeaderText="spocname" SortExpression="spocname" />
                    <asp:BoundField DataField="spocnumber" HeaderText="spocnumber" SortExpression="spocnumber" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" />
                    <asp:BoundField DataField="noofposition" HeaderText="noofposition" SortExpression="noofposition" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Center" />

<HeaderStyle Height="40px" Width="200px" BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" HorizontalAlign="Center"></HeaderStyle>

                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />

<RowStyle Height="40px" Width="200px" BackColor="White" ForeColor="#003399"></RowStyle>
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />

            </asp:GridView>

                </div>
                </center>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smva %>" SelectCommand="SELECT * FROM [addposition]" DeleteCommand="DELETE FROM [addposition] WHERE [id] = @id" InsertCommand="INSERT INTO [addposition] ([date], [clientid], [companyname], [spocname], [spocnumber], [title], [designation], [noofposition], [description]) VALUES (@date, @clientid, @companyname, @spocname, @spocnumber, @title, @designation, @noofposition, @description)" UpdateCommand="UPDATE [addposition] SET [date] = @date, [clientid] = @clientid, [companyname] = @companyname, [spocname] = @spocname, [spocnumber] = @spocnumber, [title] = @title, [designation] = @designation, [noofposition] = @noofposition, [description] = @description WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="date" Type="String" />
                    <asp:Parameter Name="clientid" Type="String" />
                    <asp:Parameter Name="companyname" Type="String" />
                    <asp:Parameter Name="spocname" Type="String" />
                    <asp:Parameter Name="spocnumber" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="designation" Type="String" />
                    <asp:Parameter Name="noofposition" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="date" Type="String" />
                    <asp:Parameter Name="clientid" Type="String" />
                    <asp:Parameter Name="companyname" Type="String" />
                    <asp:Parameter Name="spocname" Type="String" />
                    <asp:Parameter Name="spocnumber" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="designation" Type="String" />
                    <asp:Parameter Name="noofposition" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
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
