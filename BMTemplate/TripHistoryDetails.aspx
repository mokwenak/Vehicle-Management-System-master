<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/TripHistoryDetails.aspx.cs" Inherits="BMTemplate.TripHistoryDetails" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Jquery2/css/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />

    <script src="Jquery2/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="Jquery2/js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
    <link href="Jquery2/css/ui-lightness/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" />
    <script src="Jquery2/js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>



    <style type="text/css">
        .style19 {
            width: 155px;
        }

        .style18 {
            width: 149px;
        }

        .style20 {
            width: 100px;
        }

        .style21 {
            width: 295px;
        }
    </style>



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3 class="PageTitle">Trip's details</h3>
    <fieldset class="NormalPanel">
        <legend>Trip's details</legend>
        <table>
            <tr>
                <td class="style19">
                    <asp:Label ID="lblTripId" runat="server" Text="Trip Id"></asp:Label>
                </td>
                <td class="style18">
                    <asp:TextBox runat="server" Height="20px" Width="180px" ID="txtTripId"
                        Enabled="False"></asp:TextBox>
                </td>
                <td class="style20">Post Trip Inspector</td>
                <td class="style21">
                    <asp:TextBox runat="server" Height="20px" Width="230px" ID="txtPostInspector"
                        Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="style19">
                    <asp:Label ID="lblPostInspectionComments" runat="server" Text="Post Inspection Comments"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:TextBox runat="server" Height="103px" Width="474px" ID="txtPostInspectionComments"
                        Style="margin-top: 0px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style19">
                    <asp:Label ID="TripIDlb0" runat="server" Text="Main Driver"></asp:Label>
                </td>
                <td class="style18">
                    <asp:TextBox runat="server" Height="20px" Width="180px" ID="mainDrvertxt"
                        Enabled="False"></asp:TextBox>
                </td>
                <td class="style20">Co. Driver</td>
                <td class="style21">
                    <asp:TextBox runat="server" Height="20px" Width="230px" ID="coDrvertxt"
                        Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style19">Vehicle Reg No.</td>
                <td>
                    <asp:TextBox runat="server" Height="20px" Width="180px" ID="Veh_Regtxt"
                        Enabled="False"></asp:TextBox>
                </td>
                <td class="style20">&nbsp;Project Name</td>
                <td class="style21">
                    <asp:TextBox runat="server" Height="20px" Width="230px" ID="projectTxt"
                        Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="style19">
                    <asp:Label ID="TripIDlb1" runat="server" Text="Trip description"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:TextBox runat="server" Height="103px" Width="474px" ID="tripDescription"
                        Style="margin-top: 0px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style19">
                    <asp:Label ID="TripIDlb2" runat="server" Text="Authorise By:"></asp:Label>
                </td>
                <td class="style18">
                    <asp:TextBox runat="server" Height="20px" Width="150" ID="authoByTxt"
                        Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;Bank Card Used</td>
                <td class="style21">
                    <asp:TextBox runat="server" Height="20px" Width="230px" ID="cardCardNo"
                        Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Fuel Litres" ID="Label3">
                    </asp:Label></td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="txtFuelLiters" Enabled="false">
                    </asp:TextBox>
                </td>
                <td>

                    <asp:Label runat="server" Text="Fuel Cost (R)" ID="Label4">
                    </asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="txtFuelCost" Enabled="false">
                    </asp:TextBox> 
                </td>
            </tr>
            <tr>
                <td class="style2">End ODO Meter</td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="txtEndOdoMeter" Enabled="false">
                    </asp:TextBox>  
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <h3 class="PageTitle">List of Passengers</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <p>
                        <asp:Label ID="msg" runat="server" Font-Size="Medium" ForeColor="#009900"></asp:Label>
                    </p>
                </td>
            </tr>

            <tr>
                <td colspan="4">
                    <asp:GridView ID="grdPassengers" runat="server" align="left" Border="1"
                        CellPadding="4"
                        ForeColor="#033333" GridLines="None" Height="71px" Width="855px">
                        <AlternatingRowStyle BackColor="White" />

                        <Columns>
                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick"
                                Visible="False" />
                            <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick"
                                Visible="False" />



                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4D4D4D" Font-Bold="True" ForeColor="White" Height="25px" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />

                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>

            </tr>


            <tr>
                <td>
                    <h3 class="PageTitle">Logged trips</h3>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="grdLogs" runat="server" align="left"
                        Border="1" CellPadding="4" ForeColor="#033333" GridLines="None" Height="71px"
                        Width="855px">
                        <AlternatingRowStyle BackColor="White" />

                        <Columns>
                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick"
                                Visible="False" />
                            <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick"
                                Visible="False" />

                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4D4D4D" Font-Bold="True" ForeColor="White" Height="25px" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />

                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>


            <tr>
                <td>
                    <h3 class="PageTitle">Offences</h3>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="grdOffences" runat="server" align="left"
                        Border="1" CellPadding="4" ForeColor="#033333" GridLines="None" Height="71px"
                        Width="855px">
                        <AlternatingRowStyle BackColor="White" />

                        <Columns>
                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick"
                                Visible="False" />
                            <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick"
                                Visible="False" />

                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4D4D4D" Font-Bold="True" ForeColor="White" Height="25px" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />

                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" Height="36px" Text="Back" align="left" Width="69px" OnClick="btnBack_Click" />
                </td>
            </tr>

        </table>

    </fieldset>





</asp:Content>
