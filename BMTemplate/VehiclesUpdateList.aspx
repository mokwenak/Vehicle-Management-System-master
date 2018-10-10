<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehiclesUpdateList.aspx.cs" Inherits="BMTemplate.VehiclesUpdateList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3 class="PageTitle">Vehicle Entries to Update </h3>

    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend id="legendHeader">Search Vehicle Entries to Be Updated</legend>

        <table class="Normaltable">
            <tr>
                <td align="right" style="width: 100px">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblSearch" runat="server" Text="Search"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="cboSerachOptions" runat="server">
                                    <asp:ListItem Text="Select" Value="0">    
                                    </asp:ListItem>
                                    <asp:ListItem Text="Vehicle Registration Number" Value="1">    
                                    </asp:ListItem>
                                    <asp:ListItem Text="VIN number" Value="2">             
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
                    <asp:GridView ID="grdVehicles" runat="server" CssClass="GridTable" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="RegistrationNumber"
                        OnSelectedIndexChanged="grdVehicles_SelectedIndexChanged" OnPageIndexChanging="grdVehicles_PageIndexChanging">
                        <Columns>
                            <asp:ButtonField DataTextField="RegistrationNumber" HeaderText="Registration Number"
                                CommandName="Select" ItemStyle-Width="120" SortExpression="RegistrationNumber" />
                            <asp:BoundField DataField="VINNumber" HeaderText="VIN Number"
                                SortExpression="VINNumber" ItemStyle-Width="120" />
                            <asp:BoundField DataField="VehicleModel.VehicleMake.VehicleMakeName" HeaderText="Vehicle Make"
                                SortExpression="VehicleModel.VehicleMake.VehicleMakeName" ItemStyle-Width="170" />
                            <asp:BoundField DataField="VehicleModel.VehicleModelName" HeaderText="Vehicle Model"
                                SortExpression="VehicleModel.VehicleModelName" ItemStyle-Width="190" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 80px;"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblMessage" ForeColor="Red" Text="">
                    </asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
