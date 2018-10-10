<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccidentsUpdateList.aspx.cs" Inherits="BMTemplate.AccidentsUpdateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3 class="PageTitle" id="HeaderControl" runat="server">Update Accident</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Search Open Trip to Update Accident</legend>
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
                    <asp:GridView ID="grdAccidents" CssClass="GridTable" runat="server"
                        DataKeyNames="AccidentId" AutoGenerateColumns="false" AllowPaging="true"
                        OnPageIndexChanging="grdAccidents_PageIndexChanging" Width="951px"
                        PageSize="10" OnSelectedIndexChanged="grdAccidents_SelectedIndexChanged">
                        <Columns>
                            <asp:ButtonField CommandName="Select" DataTextField="AccidentId" HeaderText="Accident Id" ItemStyle-Width="100" SortExpression="AccidentId" />
                            <asp:BoundField DataField="RegistrationNumber" HeaderText="Vehicle Registration" SortExpression="TripId" ItemStyle-Width="80" />
                            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" SortExpression="AccidentDate" ItemStyle-Width="120" />
                            <asp:BoundField DataField="AccidentDescription" DataFormatString="{0}" HeaderText="Accident Description" ItemStyle-Width="360" ReadOnly="True" SortExpression="AccidentDescription" />
                            <asp:BoundField DataField="AccidentLocation" HeaderText="Point of Accident" ReadOnly="True" SortExpression="AccidentLocation" ItemStyle-Width="160" />

                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 80;"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
