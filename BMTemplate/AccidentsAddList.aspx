<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccidentsAddList.aspx.cs" Inherits="BMTemplate.AccidentsAddList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle" id="HeaderControl" runat="server">Capture Accidents</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Search Open Trip to Capture Accident</legend>
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
                                    <asp:ListItem Text="Registration Number" Value="1">    
                                    </asp:ListItem>
                                    <asp:ListItem Text="Driver's ID No" Value="2">             
                                    </asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="btnSearch" ImageUrl="~/Images/search_button_green.png"
                                    runat="server" OnClick="Search_clickbtn" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grdTrips" CssClass="GridTable" runat="server"
                        DataKeyNames="TripId" AutoGenerateColumns="false"
                        OnPageIndexChanging="grdTrips_PageIndexChanging" Width="951px"
                        PageSize="10" OnSelectedIndexChanged="grdTrips_SelectedIndexChanged" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="Select" DataTextField="TripId" HeaderText="Trip ID" ItemStyle-Width="100" SortExpression="TripId" />
                            <asp:BoundField DataField="RegistrationNumber" HeaderText="Vehicle Registration" ReadOnly="True" SortExpression="RegistrationNumber" ItemStyle-Width="120" />
                            <asp:BoundField DataField="TripDescription" DataFormatString="{0}" HeaderText="Trip Description"
                                ItemStyle-Width="360" ReadOnly="True" SortExpression="TripDescription" />
                            <asp:BoundField DataField="ProjectName" HeaderText="Project Name" ReadOnly="True" SortExpression="ProjectName" ItemStyle-Width="160" />
                            <asp:BoundField DataField="TripDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Trip date" ItemStyle-Width="100" ReadOnly="True" SortExpression="TripDate" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 80px;"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
