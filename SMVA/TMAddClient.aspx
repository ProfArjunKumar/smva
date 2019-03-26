<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMAddClient.aspx.cs" Inherits="SMVA.TMAddClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TEAM MEMBER ADD CLIENT</title>
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
            <section>
                <div class="container">
                    <h3 style="text-align: center; color: darkblue;">Add Client</h3>
<br />
<br />
<br />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label3" Text="Client ID" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtclientid" ReadOnly="true" CssClass="form-control" runat="server" Required="Required" />
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
                                            <asp:Label ID="Label1" Text="Company Name" runat="server" Font-Size="Large" />
                                            <asp:TextBox ID="txtcompanyname" AutoPostBack="true" OnTextChanged="txtcompanyname_TextChanged" CssClass="form-control" runat="server" />
                                            <asp:Label ID="emsg" runat="server" />

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Please Enter User Name" ForeColor="Red" ControlToValidate="txtempid" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label10" Text="Address" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label2" Text="Email ID" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtemailid" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label6" Text="Industry" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtindustry" CssClass="form-control" runat="server" />
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label11" Text="GST Detail" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtgst" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label12" Text="Billing address" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtbiiling" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label13" Text="Agreement Date" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtaggrementdate" TextMode="Date" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label14" Text="Renewal Date" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtrenewaldate" CssClass="form-control" runat="server" TextMode="Date" />
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label15" Text="Agreement Percentage" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtaggrementpercentage" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label5" Text="Contact Person" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtcontactnumber" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label7" Text="Designation" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdesignation" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label8" Text="Mobile" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtmobile" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label9" Text="Alternative Number" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtalternativenumber" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtalternativenumber" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label16" Text="Contact Person 2" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtcontactperson2" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label17" Text="Designation" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdesignation2" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label18" Text="Mobile" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtmobile2" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtmobile2" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label19" Text="Contact Person 3" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtcontactperson3" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label20" Text="Designation" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdesignation3" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label21" Text="Mobile" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtMobile3" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtMobile3" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label22" Text="Contact Person 4" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtcontactperson4" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label23" Text="Designation" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdesignation4" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Label ID="Label24" Text="Mobile" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtMobile4" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtMobile4" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label25" Text="Contact Person 5" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtcontactperson5" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label26" Text="Designation" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtdesignation5" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <asp:Label ID="Label27" Text="Mobile" runat="server" Font-Size="Large" />
                                    <asp:TextBox ID="txtMobile5" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtMobile5" ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter 10 digit valid number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
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
            <br />
                    <div class="col-sm-3 col-sm-offset-9">
                        <div class="form-group">
                            <asp:Button ID="Button2" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button2_Click" />
                        </div>
                    </div>
            <div class="col-md-8 col-md-offset-1" style="width: 80%; overflow-x: auto">

                <asp:GridView ID="GridView1" RowStyle-Width="40px" RowStyle-Height="40px" HeaderStyle-Height="40px" HeaderStyle-Width="40px" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        <asp:BoundField DataField="companyname" HeaderText="companyname" SortExpression="companyname" />
                        <asp:BoundField DataField="contactperson" HeaderText="contactperson" SortExpression="contactperson" />
                        <asp:BoundField DataField="desgination" HeaderText="desgination" SortExpression="desgination" />
                        <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
                        <asp:BoundField DataField="alternativenumber" HeaderText="alternativenumber" SortExpression="alternativenumber" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
                        <asp:BoundField DataField="industry" HeaderText="industry" SortExpression="industry" />
                        <asp:BoundField DataField="gstdetail" HeaderText="gstdetail" SortExpression="gstdetail" />
                        <asp:BoundField DataField="billingaddress" HeaderText="billingaddress" SortExpression="billingaddress" />
                        <asp:BoundField DataField="aggrementdate" HeaderText="aggrementdate" SortExpression="aggrementdate" />
                        <asp:BoundField DataField="renewaldate" HeaderText="renewaldate" SortExpression="renewaldate" />
                        <asp:BoundField DataField="aggrementpercentage" HeaderText="aggrementpercentage" SortExpression="aggrementpercentage" />
                        <asp:BoundField DataField="contactperson2" HeaderText="contactperson2" SortExpression="contactperson2" />
                        <asp:BoundField DataField="desgination2" HeaderText="desgination2" SortExpression="desgination2" />
                        <asp:BoundField DataField="mobile2" HeaderText="mobile2" SortExpression="mobile2" />
                        <asp:BoundField DataField="contactperson3" HeaderText="contactperson3" SortExpression="contactperson3" />
                        <asp:BoundField DataField="desgination3" HeaderText="desgination3" SortExpression="desgination3" />
                        <asp:BoundField DataField="mobile3" HeaderText="mobile3" SortExpression="mobile3" />
                        <asp:BoundField DataField="contactperson4" HeaderText="contactperson4" SortExpression="contactperson4" />
                        <asp:BoundField DataField="desgination4" HeaderText="desgination4" SortExpression="desgination4" />
                        <asp:BoundField DataField="mobile4" HeaderText="mobile4" SortExpression="mobile4" />
                        <asp:BoundField DataField="contactperson5" HeaderText="contactperson5" SortExpression="contactperson5" />
                        <asp:BoundField DataField="desgination5" HeaderText="desgination5" SortExpression="desgination5" />
                        <asp:BoundField DataField="mobile5" HeaderText="mobile5" SortExpression="mobile5" />
                        <asp:BoundField DataField="userlogin" HeaderText="userlogin" SortExpression="userlogin" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />

                    <HeaderStyle Height="40px" Width="40px" BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF"></HeaderStyle>

                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />

                    <RowStyle Height="40px" Width="150px" BackColor="White" ForeColor="#003399"></RowStyle>
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
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
                <br />


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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smva %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [addclient] WHERE ([userlogin] = @userlogin)" DeleteCommand="DELETE FROM [addclient] WHERE [id] = @original_id" InsertCommand="INSERT INTO [addclient] ([date], [companyname], [contactperson], [desgination], [mobile], [alternativenumber], [address], [emailid], [industry], [gstdetail], [billingaddress], [aggrementdate], [renewaldate], [aggrementpercentage], [contactperson2], [desgination2], [mobile2], [contactperson3], [desgination3], [mobile3], [contactperson4], [desgination4], [mobile4], [contactperson5], [desgination5], [mobile5], [userlogin]) VALUES (@date, @companyname, @contactperson, @desgination, @mobile, @alternativenumber, @address, @emailid, @industry, @gstdetail, @billingaddress, @aggrementdate, @renewaldate, @aggrementpercentage, @contactperson2, @desgination2, @mobile2, @contactperson3, @desgination3, @mobile3, @contactperson4, @desgination4, @mobile4, @contactperson5, @desgination5, @mobile5, @userlogin)" UpdateCommand="UPDATE [addclient] SET [date] = @date, [companyname] = @companyname, [contactperson] = @contactperson, [desgination] = @desgination, [mobile] = @mobile, [alternativenumber] = @alternativenumber, [address] = @address, [emailid] = @emailid, [industry] = @industry, [gstdetail] = @gstdetail, [billingaddress] = @billingaddress, [aggrementdate] = @aggrementdate, [renewaldate] = @renewaldate, [aggrementpercentage] = @aggrementpercentage, [contactperson2] = @contactperson2, [desgination2] = @desgination2, [mobile2] = @mobile2, [contactperson3] = @contactperson3, [desgination3] = @desgination3, [mobile3] = @mobile3, [contactperson4] = @contactperson4, [desgination4] = @desgination4, [mobile4] = @mobile4, [contactperson5] = @contactperson5, [desgination5] = @desgination5, [mobile5] = @mobile5, [userlogin] = @userlogin WHERE [id] = @original_id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="date" Type="String" />
                        <asp:Parameter Name="companyname" Type="String" />
                        <asp:Parameter Name="contactperson" Type="String" />
                        <asp:Parameter Name="desgination" Type="String" />
                        <asp:Parameter Name="mobile" Type="String" />
                        <asp:Parameter Name="alternativenumber" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="emailid" Type="String" />
                        <asp:Parameter Name="industry" Type="String" />
                        <asp:Parameter Name="gstdetail" Type="String" />
                        <asp:Parameter Name="billingaddress" Type="String" />
                        <asp:Parameter Name="aggrementdate" Type="String" />
                        <asp:Parameter Name="renewaldate" Type="String" />
                        <asp:Parameter Name="aggrementpercentage" Type="String" />
                        <asp:Parameter Name="contactperson2" Type="String" />
                        <asp:Parameter Name="desgination2" Type="String" />
                        <asp:Parameter Name="mobile2" Type="String" />
                        <asp:Parameter Name="contactperson3" Type="String" />
                        <asp:Parameter Name="desgination3" Type="String" />
                        <asp:Parameter Name="mobile3" Type="String" />
                        <asp:Parameter Name="contactperson4" Type="String" />
                        <asp:Parameter Name="desgination4" Type="String" />
                        <asp:Parameter Name="mobile4" Type="String" />
                        <asp:Parameter Name="contactperson5" Type="String" />
                        <asp:Parameter Name="desgination5" Type="String" />
                        <asp:Parameter Name="mobile5" Type="String" />
                        <asp:Parameter Name="userlogin" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="userlogin" SessionField="TM" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="date" Type="String" />
                        <asp:Parameter Name="companyname" Type="String" />
                        <asp:Parameter Name="contactperson" Type="String" />
                        <asp:Parameter Name="desgination" Type="String" />
                        <asp:Parameter Name="mobile" Type="String" />
                        <asp:Parameter Name="alternativenumber" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="emailid" Type="String" />
                        <asp:Parameter Name="industry" Type="String" />
                        <asp:Parameter Name="gstdetail" Type="String" />
                        <asp:Parameter Name="billingaddress" Type="String" />
                        <asp:Parameter Name="aggrementdate" Type="String" />
                        <asp:Parameter Name="renewaldate" Type="String" />
                        <asp:Parameter Name="aggrementpercentage" Type="String" />
                        <asp:Parameter Name="contactperson2" Type="String" />
                        <asp:Parameter Name="desgination2" Type="String" />
                        <asp:Parameter Name="mobile2" Type="String" />
                        <asp:Parameter Name="contactperson3" Type="String" />
                        <asp:Parameter Name="desgination3" Type="String" />
                        <asp:Parameter Name="mobile3" Type="String" />
                        <asp:Parameter Name="contactperson4" Type="String" />
                        <asp:Parameter Name="desgination4" Type="String" />
                        <asp:Parameter Name="mobile4" Type="String" />
                        <asp:Parameter Name="contactperson5" Type="String" />
                        <asp:Parameter Name="desgination5" Type="String" />
                        <asp:Parameter Name="mobile5" Type="String" />
                        <asp:Parameter Name="userlogin" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
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
