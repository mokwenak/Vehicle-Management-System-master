<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DriversUpdateList.aspx.cs" Inherits="BMTemplate.DriversUpdateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Jquery2/css/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="Jquery2/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="Jquery2/js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
    <link href="Jquery2/css/ui-lightness/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" />
    <script src="Jquery2/js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
    <link href="/Styles/BMStyles.css" rel="stylesheet" type="text/css" />
    <link href="Styles/VMS.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .rounded_corners {
            border: 1px solid #A1DCF2;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            overflow: hidden;
        }

            .rounded_corners td, .rounded_corners th {
                border: 1px solid #A1DCF2;
                font-family: Arial;
                font-size: 10pt;
                text-align: center;
            }

            .rounded_corners table table td {
                border-style: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle" id="HeaderControl">Update Driver Details</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Search Driver Entries to Be Updated</legend>
        <table class="Normaltable">
            <tr>
                <td style="width: 100px; text-align: left;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblSearch" runat="server" Text="Search"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="cboSearchOptions" runat="server">
                                    <asp:ListItem Text="Select search criteria" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="ID Number" Value="1">    
                                    </asp:ListItem>
                                    <asp:ListItem Text="Employee Number" Value="2">             
                                    </asp:ListItem>
                                    <asp:ListItem Text="Last Name" Value="3">              
                                    </asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="btnSearch" ImageUrl="~/Images/search_button_green.png"
                                    runat="server" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grdDrivers" runat="server" CssClass="GridTable" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="DriverIdNumber"
                        OnSelectedIndexChanged="grdDrivers_SelectedIndexChanged"
                        OnPageIndexChanging="grdDrivers_PageIndexChanging">
                        <Columns>
                            <asp:ButtonField DataTextField="DriverIdNumber" HeaderText="ID Number" CommandName="Select" ItemStyle-Width="120" SortExpression="DriverIdNumber" />
                            <asp:BoundField DataField="PersalNumber" HeaderText="Employee Number" SortExpression="PersalNumber" ItemStyle-Width="120" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-Width="100" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" ItemStyle-Width="100" />
                            <asp:BoundField DataField="CellNumber" HeaderText="Cell Number" SortExpression="CellNumber" ItemStyle-Width="100" />
                            <asp:BoundField DataField="EmergenceContactNo" HeaderText="Emergency ContactNo" SortExpression="EmergenceContactNo" ItemStyle-Width="120" />
                            <asp:BoundField DataField="Office.OfficeName" HeaderText="Office Description" SortExpression="Office.OfficeName" ItemStyle-Width="200" />

                        </Columns>
                    </asp:GridView>

                    <div>
                        <asp:Label ID="messageLbl" runat="server" Text="" ForeColor="Red">
                        </asp:Label>
                    </div>



                    <!-- 
                              <asp:BoundField DataField="DriverIdNumber" HeaderText="ID Number" ReadOnly="True" ItemStyle-Width="120" />
                            
                            <asp:ButtonField Text="Select" CommandName="Select" ItemStyle-Width="60" /> -->

                </td>
                <td style="width: 80;"></td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
