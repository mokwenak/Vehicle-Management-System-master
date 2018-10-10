<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GarageCardUpdateList.aspx.cs" Inherits="BMTemplate.GarageCardUpdateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle">Update Garage Card</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Search Garage Card Entries to Be Updated</legend>
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
                                    <asp:ListItem Text=" Select" Value="3">    
                                    </asp:ListItem>
                                    <asp:ListItem Text="Card Number" Value="1">    
                                    </asp:ListItem>
                                    <asp:ListItem Text="Bank Name" Value="2">            
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

                    <asp:GridView CssClass="GridTable" ID="CardsGridView" runat="server" HeaderStyle-ForeColor="White" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="CardNumber" Style="width: 800px;"
                        OnPageIndexChanging="CardsGridView_PageIndexChanging"
                        OnSelectedIndexChanged="CardsGridView_SelectedIndexChanged">
                        <Columns>
                            <asp:ButtonField DataTextField="CardNumber" HeaderText="Card Number" ItemStyle-Width="150" CommandName="Select" SortExpression="CardNumber" />
                            <asp:BoundField DataField="Bank.BankDescription" HeaderText="Bank Name" ItemStyle-Width="380" />
                            <asp:BoundField DataField="ExpireDate" HeaderText="Expire Date" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100" SortExpression="ExpireDate" />
                            <asp:BoundField DataField="ReturnDate" HeaderText="Received Date" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="100" SortExpression="ReturnDate" />
                        </Columns>
                    </asp:GridView>

                </td>
                <td style="width: 80;"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblCard" ForeColor="Red" Text="">
                    </asp:Label>
                </td>
            </tr>

        </table>
    </fieldset>
</asp:Content>
