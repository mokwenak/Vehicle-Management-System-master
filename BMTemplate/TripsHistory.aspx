<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="TripsHistory.aspx.cs" Inherits="BMTemplate.TripsHistory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle">Close Trips </h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Close Trips</legend>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="grdTrips" CssClass="GridTable" runat="server"
                        DataKeyNames="TripId" AutoGenerateColumns="false" PageSize="10"
                        OnSelectedIndexChanged="grdTrips_SelectedIndexChanged" Width="951px" 
                        OnPageIndexChanging="grdTrips_PageIndexChanging" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="Select" DataTextField="TripId" HeaderText="Trip ID" ItemStyle-Width="100" SortExpression="TripId" />
                            <asp:BoundField DataField="RegistrationNumber" HeaderText="Vehicle Registration" ReadOnly="True" SortExpression="RegistrationNumber" ItemStyle-Width="120" />
                            <asp:BoundField DataField="ShortTripDesc" DataFormatString="{0}" HeaderText="Trip Description" ItemStyle-Width="120" ReadOnly="True" SortExpression="ShortTripDesc" />
                            <asp:BoundField DataField="ProjectName" HeaderText="Project Name" ReadOnly="True" SortExpression="ProjectName" ItemStyle-Width="160" />
                            <asp:BoundField DataField="TripDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Trip date" ItemStyle-Width="100" ReadOnly="True" SortExpression="TripDate" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
