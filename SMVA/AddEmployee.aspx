﻿<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddEmployee.aspx.cs" Inherits="SMVA.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADD EMPLOYEE</title>       
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
                return false;return true;
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
            <section>
                <div class="container">
                    <h3 style="text-align: center; color: darkblue;">Add Employee</h3>
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
                                    <asp:TextBox ID="TextBox1" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged" CssClass="form-control" runat="server" Required="Required" />
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
                                        <asp:ListItem Text="--Select--"/>
                                        <asp:ListItem Text="Male" />
                                        <asp:ListItem Text="Female" />
                                    </asp:DropDownList>                                    
                                    <asp:RequiredFieldValidator ErrorMessage="Please Select Gender" ForeColor="Red" ControlToValidate="ddlGender" InitialValue="--Select--" runat="server" />
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
                            <asp:Button ID="Button1" class="btn btn-success center-block" OnClick="Button1_Click" Style="width: 190px;" runat="server" Text="ADD" />
                        </div>
                    </div>
                </div>
            </section>
                        <br />
            <br />
            <br />
            
               <div class="container-fluid">
                    <div class="col-sm-3 col-sm-offset-9">
                        <div class="form-group">
                            <asp:Button ID="Button2" Text="ExporttoExcel" CssClass="btn btn-primary" CausesValidation="false" runat="server" UseSubmitBehavior="false" OnClick="Button2_Click" />
                        </div>
                    </div>
                <div class="row col-md-offset-1" style="width:80%;overflow-x:auto">

                            <asp:GridView ID="GridView1" RowStyle-Width="40px" RowStyle-Height="40px" HeaderStyle-Height="40px" HeaderStyle-Width="40px" ClientIDMode="Static" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                    <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" />
                    <asp:BoundField DataField="joiningdate" HeaderText="joiningdate" SortExpression="joiningdate" />
                    <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
                    <asp:BoundField DataField="emergencynumber" HeaderText="emergencynumber" SortExpression="emergencynumber" />
                    <asp:BoundField DataField="target" HeaderText="target" SortExpression="target" />
                    <asp:BoundField DataField="portalalloted" HeaderText="portalalloted" SortExpression="portalalloted" />
                    <asp:BoundField DataField="clientaccount" HeaderText="clientaccount" SortExpression="clientaccount" />
                    <asp:BoundField DataField="franchiseaccount" HeaderText="franchiseaccount" SortExpression="franchiseaccount" />
                    <asp:CommandField ShowEditButton="True" CausesValidation="false" ShowDeleteButton="True" />
                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Height="40px" Width="40px" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" Height="40px" Width="40px" ForeColor="#003399" />
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
      
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smva %>" SelectCommand="SELECT * FROM [addemployee]" DeleteCommand="DELETE FROM [addemployee] WHERE [id] = @id" InsertCommand="INSERT INTO [addemployee] ([date], [name], [gender], [designation], [joiningdate], [mobile], [address], [emailid], [emergencynumber], [target], [portalalloted], [clientaccount], [franchiseaccount]) VALUES (@date, @name, @gender, @designation, @joiningdate, @mobile, @address, @emailid, @emergencynumber, @target, @portalalloted, @clientaccount, @franchiseaccount)" UpdateCommand="UPDATE [addemployee] SET [date] = @date, [name] = @name, [gender] = @gender, [designation] = @designation, [joiningdate] = @joiningdate, [mobile] = @mobile, [address] = @address, [emailid] = @emailid, [emergencynumber] = @emergencynumber, [target] = @target, [portalalloted] = @portalalloted, [clientaccount] = @clientaccount, [franchiseaccount] = @franchiseaccount WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="date" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="designation" Type="String" />
                    <asp:Parameter Name="joiningdate" Type="String" />
                    <asp:Parameter Name="mobile" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="emailid" Type="String" />
                    <asp:Parameter Name="emergencynumber" Type="String" />
                    <asp:Parameter Name="target" Type="String" />
                    <asp:Parameter Name="portalalloted" Type="String" />
                    <asp:Parameter Name="clientaccount" Type="String" />
                    <asp:Parameter Name="franchiseaccount" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="date" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="designation" Type="String" />
                    <asp:Parameter Name="joiningdate" Type="String" />
                    <asp:Parameter Name="mobile" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="emailid" Type="String" />
                    <asp:Parameter Name="emergencynumber" Type="String" />
                    <asp:Parameter Name="target" Type="String" />
                    <asp:Parameter Name="portalalloted" Type="String" />
                    <asp:Parameter Name="clientaccount" Type="String" />
                    <asp:Parameter Name="franchiseaccount" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                            </asp:SqlDataSource>
        
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
