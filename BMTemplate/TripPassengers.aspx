<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TripPassengers.aspx.cs" Inherits="BMTemplate.TripPassengers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle">Particulars Of Passengers</h3>
    <fieldset class="NormalPanel">
        <legend>Trip</legend>
        <table>
            <tr>
                <td>
                    <asp:Label ID="tripID" runat="server" Text="Trip ID"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" Height="20px" Width="120px" ID="txtTripId" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblDriver" runat="server" Text="Driver"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" Height="20px" Width="120px" ID="txtDriver"
                        Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTripDescription" runat="server" Text="Trip Description"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" Height="115px" Width="416px" ID="txtTripDescription"
                        Enabled="False" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="NormalPanel">
        <legend>Passengers</legend>
        <table>
            <tr>
                <td align="left" class="style1" colspan="2">
                    <asp:GridView ID="grdPassengers" runat="server" BackColor="White" Font-Size="9"  Width="458px" CssClass="GridTable" ShowFooter="False" AutoGenerateColumns="false" ShowHeaderWhenEmpty="False" OnRowDeleting="grdPassengers_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblPassengerId" runat="server" Text='<%# Bind("PassengerId") %>' Visible="false" />

                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("PassengerFirstName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Surname">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSurname" runat="server" Text='<%# Bind("PassengerSurname") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID Number">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtIDNumber" runat="server" Text='<%# Bind("PassengerIdNo") %>' MaxLength="13" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reason">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtReason" runat="server" Text='<%# Bind("Reason") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="60" HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton Text="Remove" ID="btnDelete" CommandName="Delete" runat="server" />
                                </ItemTemplate>

                                <ItemStyle Width="60px"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle Height="25px" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="height: 44px; width: 195px" cellpadding="5">
                        <tr>
                            <td>
                                <asp:Button ID="btnAddPassenger" runat="server" Text="Add Passenger" Height="32px" OnClick="btnAddPassenger_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="NormalPanel">
        <legend></legend>
        <table>
            <tr>
                <td style="width: 20px;">
                    <asp:Button ID="btnBack" runat="server" Height="32px" Text="Back"
                        Width="117px" OnClick="btnBack_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnSave" runat="server" Height="32px" OnClick="btnSave_Click"
                        Text="Save" Width="117px" OnClientClick="SetTarget();" />
                </td>
            </tr>
        </table>
    </fieldset>
    <iframe id="fmePrint" name="fmePrint" frameborder="0" width="100%" height="100%" style="border: 0;"></iframe>
</asp:Content>
