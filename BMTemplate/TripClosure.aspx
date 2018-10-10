<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="~/TripClosure.aspx.cs" Inherits="BMTemplate.TripClosure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle">View Open Trips </h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Trips</legend>
        <table">
            <tr>
                <td>
                    <asp:GridView ID="grdTrips" CssClass="GridTable" runat="server"
                        DataKeyNames="TripId" AutoGenerateColumns="False" 
                        PageSize="10" OnSelectedIndexChanged="grdTrips_SelectedIndexChanged"
                        OnRowCommand="grdTrips_RowCommand" CaptionAlign="Top" CellPadding="2"
                        OnPageIndexChanging="grdTrips_PageIndexChanging" AllowPaging="true" Width="951px" >
                        <Columns>
                            <asp:BoundField DataField="RegistrationNumber" HeaderText="Vehicle Registration"
                                ReadOnly="True" SortExpression="RegistrationNumber" ItemStyle-Width="120">
                                <ItemStyle Width="120px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="SHORT_DESC" HeaderText="Trip Description"
                                ItemStyle-Width="450" ReadOnly="True" SortExpression="SHORT_DESC">
                                <ItemStyle Width="450px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="ProjectName" HeaderText="Project Name"
                                ReadOnly="True" SortExpression="ProjectName" ItemStyle-Width="160">
                                <ItemStyle Width="160px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="TripDate" DataFormatString="{0:dd/MM/yyyy}"
                                HeaderText="Trip date" ItemStyle-Width="100" ReadOnly="True"
                                SortExpression="TripDate">
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="EstimatedReturnDate" DataFormatString="{0:dd/MM/yyyy}"
                                HeaderText="Return date" ItemStyle-Width="100" ReadOnly="True"
                                SortExpression="EstimatedReturnDate">
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField ItemStyle-Width="60" HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton Text="Edit" ID="btnEdit" CommandName="EditTrip" CommandArgument='<%# Bind("TripId") %>' runat="server" ItemStyle-Width="100" />
                                    <asp:LinkButton Text="Close" ID="btnCloseTrip" CommandName="CloseTrip" CommandArgument='<%# Bind("TripId") %>' runat="server" ItemStyle-Width="100"/>
                                    <asp:LinkButton Text="Re-Print" ID="btnDelete" CommandName="Re-Print" CommandArgument='<%# Bind("TripId") %>' runat="server" ItemStyle-Width="100" OnClientClick="SetTarget();" />
                                </ItemTemplate>
                                <ItemStyle Width="60px"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>

    </fieldset>
    <iframe id="fmePrint" name="fmePrint" frameborder="0" width="0" height="0" style="border: 0;"></iframe>
</asp:Content>
