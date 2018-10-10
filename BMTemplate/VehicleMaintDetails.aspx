<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleMaintDetails.aspx.cs" Inherits="BMTemplate.VehicleMaintDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1 {
            width: 100px;
        }

        .style2 {
            width: 210px;
        }
    </style>
</asp:Content>

  
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 id="Vehicledialog" class="PageTitle" runat="server">Capture Maintenance</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Maintenance</legend>
        <table class="Normaltable">
            <tr>
                <td class="style2">Vehicle Registration Number</td>
                <td class="style2">

                    <asp:DropDownList ID="cboVehicleRegno" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Style="margin-left: 1px; width: 140px" AppendDataBoundItems="true"
                        DataTextField="RegistrationNumber" DataValueField="VehicleId" Height="19px">
                        <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegnum" ControlToValidate="cboVehicleRegno" InitialValue="0"
                        runat="server" ErrorMessage="Registration number is required." ToolTip="Registration number is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1"></td>
                <td class="style2">Service Type</td>
                <td class="style2">

                    <asp:DropDownList ID="cboServiceType" runat="server" BorderWidth="2px" AppendDataBoundItems="true" DataTextField="ServiceTypeName" DataValueField="ServiceTypeId"
                        BorderColor="Silver" Style="margin-left: 1px; width: 140px">
                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="cboServiceType" InitialValue="0"
                        runat="server" ErrorMessage="Service Type is required." ToolTip="Service Type is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Kilometrelbl" runat="server" Text="Kilometers(km)"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txbKilometers" runat="server" BorderWidth="2px" BorderColor="Silver"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldVinNumber" ControlToValidate="txbkilometers"
                        runat="server" ErrorMessage="Kilometers are required" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1"></td>
                <td class="style2">
                    <asp:Label ID="Commentslbl" runat="server" Text="Comments"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Comments" runat="server" BorderWidth="2px"
                        BorderColor="Silver" TextMode="MultiLine"
                        MaxLength="20" Height="73px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="Comments" ToolTip="Card Returned Date is requiered"
                        runat="server" ErrorMessage="Comm Date is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">Service Date</td>
                <td>
                    <asp:TextBox ID="txtServiceDate" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtServiceDate" ToolTip="Service Date is required"
                        runat="server" ErrorMessage="Service Date is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style2"></td>
                <td class="style1"></td>
                <td></td>

            </tr>
            <tr>
                <td>
                    <asp:Button CssClass="Button" Height="34px" Width="101px" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </fieldset>
    <div id="validation_dialog" style="display: none;">
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" Width="332px" />
    </div>


    <script type="text/javascript">
    var saveFlag = false;
    $(document).ready(function () {

        function init() {

            $("[id$=txtServiceDate]").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true
            });



            $("[id$=txtServiceDate]").attr('readonly', 'true');


            Page_ClientValidate();
        }

        init();

        $("[id$=btnSave]").click(function () {
            saveFlag = true;
        });
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
