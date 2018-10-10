<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleMaintsUpdateList.aspx.cs" Inherits="BMTemplate.VehicleMaintsUpdateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle">Update Vehicle Maintanance</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Search Maintance Entries to Update</legend>
        <table class="Normaltable">
            <tr>
                <td style="width: 100px; text-align: left;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblSearch" runat="server" Text="Search"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="cbocboSerachOptions" runat="server">
                                    <asp:ListItem Text="Select">    
                                    </asp:ListItem>
                                    <asp:ListItem Text="Vehicle Registration Number" Value="1">    
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

                    <asp:GridView CssClass="GridTable" ID="VehicleMaintananceGridView" runat="server" HeaderStyle-ForeColor="White" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="VehicleMaintenanceId" Style="width: 951px;"
                        OnPageIndexChanging="VehicleMaintananceGridView_PageIndexChanging"
                        OnSelectedIndexChanged="VehicleMaintananceGridView_SelectedIndexChanged">
                        <Columns>
                            <asp:ButtonField DataTextField="VehicleMaintenanceId" HeaderText="Maintanance ID" ItemStyle-Width="150"
                                CommandName="Select" SortExpression="VehicleMaintenanceId" />
                            <asp:BoundField DataField="Vehicle.RegistrationNumber" HeaderText="Vehicle Registration Number" ItemStyle-Width="380" />
                            <asp:BoundField DataField="ServiceDate" DataFormatString="{0:dd/MM/yyyy}"  HeaderText="Service Date" ItemStyle-Width="100" SortExpression="ServiceDate" />
                            <asp:BoundField DataField="ServiceType.ServiceTypeName" HeaderText="Service Type" ItemStyle-Width="100" SortExpression="ServiceType.ServiceTypeName" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 80px;"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblNoData" ForeColor="Red" Text="">
                    </asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
