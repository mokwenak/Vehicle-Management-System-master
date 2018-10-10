<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/TripLogs.aspx.cs" Inherits="BMTemplate.TripLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <h3 class="PageTitle">Closing Trip</h3>

    <fieldset class="NormalPanel">
        <legend>Trip</legend>

        <table>
            <tr>
                <td>Trip ID</td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="tripIDTxt" Enabled="False">
                    </asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" Text="Post trip Inspector" ID="Label1"></asp:Label></td>

                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="PostInspect">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PostInspect"
                        Display="Dynamic" ErrorMessage="Post trip inspector is required" ForeColor="Red"
                        ToolTip="Post trip inspector is required" ValidationGroup="ValidateForm">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Post trip Comment" ID="Label2"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox runat="server" Height="117px" Width="379px" ID="PosttripComment" TextMode="MultiLine">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PosttripComment"
                        Display="Dynamic" ErrorMessage="Post trip comment is required" ForeColor="Red"
                        ToolTip="Post trip comment is required" ValidationGroup="ValidateForm">*</asp:RequiredFieldValidator></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Fuel Litres" ID="Label3">
                    </asp:Label></td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="fuelLtr">
                    </asp:TextBox>
                </td>
                <td>

                    <asp:Label runat="server" Text="Fuel Cost (R)" ID="Label4">
                    </asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="fuelCost">
                    </asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="style2">Current ODO Meter</td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="currentODDO" Enabled="false" OnTextChanged="currentODDO_TextChanged" >
                    </asp:TextBox>
                                     

                </td>
            </tr>
            <tr>
                <td class="style2">End ODO Meter</td>
                <td>
                    <asp:TextBox runat="server" Height="22px" Width="190px" ID="endODDO">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="endODDO" Display="Dynamic" ErrorMessage="End ODO is required" ForeColor="Red"
                        ToolTip="End ODO value is required" ValidationGroup="ValidateForm">*</asp:RequiredFieldValidator>

                </td>
            </tr>
        </table>

    </fieldset>

    <fieldset class="NormalPanel">
        <legend>Log all trips</legend>
        <table>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="grdLogs" runat="server" BackColor="White" Font-Size="9" Width="350px" CssClass="GridTable" ShowFooter="False"
                        AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" OnRowDeleting="grdLogs_RowDeleting" >
                        <Columns>
                            <asp:TemplateField HeaderText="Start Point">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSP" runat="server" Text='<%# Bind("StartPoint") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Destination">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtEP" runat="server" Text='<%# Bind("Destination") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Odometer ">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtStartOdo" CssClass="StartOdo" runat="server" Text='<%# Bind("startODO") %>' Width="80" MaxLength="7" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Odometer ">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtEndOdo" CssClass="EndOdo" runat="server" Text='<%# Bind("endODO") %>' Width="80" MaxLength="7" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Kilometers">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtKilos" runat="server" Text='<%# Bind("kilos") %>' Width="60" CssClass="Kilos"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trip Date">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtTripdate" CssClass="DateField" runat="server" Text='<%# Bind("tripdate") %>' Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"/>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ItemStyle-Width="60" HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton Text="Remove" ID="btnDelete" CommandName="Delete" runat="server" />
                                </ItemTemplate>

                                <ItemStyle Width="60px"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="height: 44px; width: 195px" cellpadding="5">
                        <tr>
                            <td> 
                                <asp:Button ID="btnAddLog" runat="server" Text="Add Log" Height="32px" OnClick="btnAddLog_Click" />
                            </td> 
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </fieldset>

    

    <fieldset class="NormalPanel">
        <legend>Offences</legend>
        <table>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="grdOffences" runat="server" BackColor="White" Font-Size="9"  Width="910px" CssClass="GridTable" ShowFooter="false"
                        AutoGenerateColumns="false" ShowHeaderWhenEmpty="false" OnRowDataBound="grdOffences_RowDataBound" OnRowDeleting="grdOffences_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Offence Type" ItemStyle-Width="300px">
                                <ItemTemplate>
                                    <asp:Label ID="lblOffenceType" runat="server" Text='<%# Eval("OffenceTypeId") %>' Visible="false" />
                                    <asp:DropDownList ID="cboOffenceType" runat="server" Width="280px"  DataTextField="OffenceTypeName" DataValueField="OffenceTypeId" AppendDataBoundItems="true">
                                        <asp:ListItem Text="Select "  Value="0"/>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Offence Date" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtOffenceDate" CssClass="DateField" runat="server" Text='<%# Bind("OffenceDate") %>' Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comments" ItemStyle-Width="350px">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtComments" runat="server" Text='<%# Bind("Comments") %>' Width="320" MaxLength="250" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="60px" HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton Text="Remove" ID="btnDelete" CommandName="Delete" runat="server" />
                                </ItemTemplate>

                                <ItemStyle Width="60px"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="height: 44px; width: 195px" cellpadding="5">
                        <tr>
                            <td> 
                                <asp:Button ID="btnAddOffence" runat="server" Text="Add Offence" Height="32px" OnClick="btnAddOffence_Click" />
                            </td> 
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset>
        <table>
            <tr>
                <td>
                    <table style="height: 44px; width: 195px" cellpadding="5">
                        <tr>
                            <td>
                                <asp:Button ID="btnBack" runat="server" Height="29px" Text="Back" Width="93px" OnClick="btnBack_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCloseTrip" ValidationGroup="ValidateForm" runat="server" Height="30px" OnClick="btnCloseTrip_Click"  Text="Close Trip" Width="95px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </fieldset>

    <div id="validation_dialog" style="display: none;">
        <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="ValidateForm" ForeColor="Red" runat="server" Width="332px" />
    </div>
    <script type="text/javascript">

        var saveFlag = false;

        $(document).ready(function () {

            $(".DateField").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true
            });

            $(".DateField").attr('readonly', 'readonly');
            $(".Kilos").attr('readonly', 'readonly');

            function inIt() {

                Page_ClientValidate();
            }

            inIt();

            $("[id$=btncloseTrip]").click(function () {
                saveFlag = true;
            });

            function calcKilos(startId, endId, kilosId) {
                if ($.isNumeric($('#' + endId).val()) && $.isNumeric($('#' + startId).val())) {
                    $('#' + kilosId).val(Number($('#' + endId).val()) - Number($('#' + startId).val()));
                }
                else {
                    $('#' + kilosId).val('');
                }
            }

            $(".StartOdo").change(function () {

                var txtStartOdoId = $(this)[0].id;
                var txtEndOdoId = txtStartOdoId.replace('txtStartOdo', 'txtEndOdo');
                var txtKilosId = txtStartOdoId.replace('txtStartOdo', 'txtKilos');

                calcKilos(txtStartOdoId, txtEndOdoId, txtKilosId);

            });

            $(".EndOdo").change(function () {

                var txtEndOdoId = $(this)[0].id;
                var txtStartOdoId = txtEndOdoId.replace('txtEndOdo', 'txtStartOdo');
                var txtKilosId = txtEndOdoId.replace('txtEndOdo', 'txtKilos');

                calcKilos(txtStartOdoId, txtEndOdoId, txtKilosId);

            });

            //MainContent_grdLogs_txtStartOdo_0
            //MainContent_grdLogs__0
        });

        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false && saveFlag) {
                $("#validation_dialog").dialog({
                    title: "Validation Errors",
                    width: 350,
                    modal: true,
                    resizable: false,
                    dialogClass: 'dialogTitleClass',
                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
                return false;
            }
            return true;
        }

    </script>
</asp:Content>
