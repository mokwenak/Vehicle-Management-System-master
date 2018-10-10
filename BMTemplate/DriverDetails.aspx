<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DriverDetails.aspx.cs" Inherits="BMTemplate.DriverDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
        }

        .loading {
            font-family: Arial;
            font-size: 10pt;
            border: 5px solid #67CFF5;
            width: 200px;
            height: 100px;
            display: none;
            position: fixed;
            background-color: White;
            z-index: 999;
        }

        .ErrorControl {
            background-color: #FBE3E4;
            border: solid 1px Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3 class="PageTitle" id="HeaderControl" runat="server" align="left">Register Driver Details</h3>
    <fieldset>
        <legend>Driver Details</legend>
        <table class="Normaltable">
            <tr>
                <td class="LabelColumn">
                    <asp:Label ID="PrsalNr" runat="server" Text="Employee Number"></asp:Label>
                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txtPersalNumber" runat="server" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isNumeric(event.keyCode);" CssClass="SmallField"
                        onpaste="return false;" MaxLength="8"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic"
                        ControlToValidate="txtPersalNumber" ID="RegularExpressionValidator12"
                        ValidationExpression="^[\s\S]{8,}$" runat="server" ForeColor="Red"
                        ErrorMessage="Minimum 8 characters required for Persal No." ToolTip="Minimum 8 characters required for Persal No.">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlToValidate="txtPersalNumber" Display="Dynamic"
                        runat="server" ErrorMessage="Persal number is required field" ToolTip="Persal number is required field" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn">
                    <asp:Label ID="lblInitials" runat="server" Text="Initials"></asp:Label>
                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txtInitials" runat="server" MaxLength="6" ViewStateMode="Enabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtInitials"
                        runat="server" ErrorMessage="Initials are required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="SmallField"
                        onpaste="return false;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName"
                        runat="server" ErrorMessage="Name is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblSurname" runat="server" Text="Surname"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSurname" runat="server"
                        CssClass="SmallField"
                        onpaste="return false;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtSurname"
                        runat="server" ErrorMessage="Surname is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCellNumber" runat="server" Text="Cell Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCellNumber" runat="server" MaxLength="10" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isAlphaNumeric(event.keyCode);" CssClass="SmallField"
                        onpaste="return false;"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic"
                        ControlToValidate="txtCellNumber" ID="RegularExpressionValidator3"
                        ValidationExpression="^[\s\S]{10,}$" runat="server" ForeColor="Red"
                        ErrorMessage="Phone is 10 characters required ">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtCellNumber"
                        runat="server" ErrorMessage="Cell is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblEmergencyContact" runat="server" Text="Emergency Contact No"></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="txtEmergencyContact" runat="server" MaxLength="10" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isNumeric(event.keyCode);" CssClass="SmallField"
                        onpaste="return false;"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic"
                        ControlToValidate="txtEmergencyContact" ID="RegularExpressionValidator7"
                        ValidationExpression="^[\s\S]{10,}$" runat="server" ForeColor="Red"
                        ErrorMessage=" Emergency Contanct Number is 10 characters">*</asp:RegularExpressionValidator>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtEmergencyContact"
                        runat="server" ErrorMessage="Emergency Contact is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>


                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmergencyName" runat="server" Text="Emergency Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmergencyName" runat="server" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isAlphaNumeric(event.keyCode);" CssClass="SmallField"
                        onpaste="return false;"> </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtEmergencyName"
                        runat="server" ErrorMessage="Emergency Name is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>

                <td></td>
                <td>
                    <asp:Label ID="lblIdNumber" runat="server" Text="SA ID No"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtIdNumber" runat="server" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isNumeric(event.keyCode);"
                        onpaste="return false;" MaxLength="13" OnTextChanged="txtIdNumber_TextChanged"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic"
                        ControlToValidate="txtIdNumber" ID="RegularExpressionValidator1"
                        ValidationExpression="^[\s\S]{13,}$" runat="server" ForeColor="Red"
                        ErrorMessage="Minimum 13 characters required for ID Nr.">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtIdNumber"
                        runat="server" ErrorMessage="SA_ID_NR is required field" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLicenseNumber" runat="server" Text="SA Licence Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLicenseNumber" runat="server" MaxLength="12" CssClass="SmallField"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtLicenseNumber"
                        runat="server" ErrorMessage="SA Licence Number is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblLicenseCode" runat="server" Text="SA Driver's Licence code"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLicenseCode" runat="server" CssClass="SmallField" MaxLength="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtLicenseCode"
                        runat="server" ErrorMessage="SA Licence code is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtLicenseCode" ID="RegularExpressionValidator2"
                        ValidationExpression="^[\s\S]{1,4}$"
                        runat="server" ErrorMessage="Minimum 1 and Maximum 4 characters required for SA -Licence Code." ForeColor="Red">*</asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLicenseIssueDate" runat="server" Text="Driver's Licence Issue date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLicenseIssueDate" CssClass="SmallField" runat="server" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtLicenseIssueDate"
                        runat="server" ErrorMessage="Driver Licence Issue date is required." Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblLicenseRenewDate" runat="server" Text="Driver's License Renewal Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLicenseRenewDate" runat="server" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txtLicenseRenewDate"
                        runat="server" ErrorMessage="Driver Licence Renewal date is required." Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDriverPDP" runat="server" Text="Driver's PDP"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cboDriverPDP" runat="server" CssClass="SmallField">
                        <asp:ListItem Text="Select Yes/No"></asp:ListItem>
                        <asp:ListItem Text="YES" Value="1"></asp:ListItem>
                        <asp:ListItem Text="NO" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="cboDriverPDP"
                        runat="server" ErrorMessage="Driver's PDP is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblDriverPDPIssueDate" runat="server" Text="Driver's PDP issue date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDriverPDPIssueDate" runat="server" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"
                        CssClass="SmallField"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valPDPDate" ControlToValidate="txtDriverPDPIssueDate"
                        runat="server" ErrorMessage="Driver's PDP issue date is required or Select NO PDP" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDrivertxtDriverPDPNumber" runat="server"
                        Text="Driver's PDP Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDriverPDPNumber" runat="server" MaxLength="12" CssClass="SmallField"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valtxtDriverPDPNumber" ControlToValidate="txtDriverPDPNumber"
                        runat="server" ErrorMessage="Driver's PDP Number is required." Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblStatus" runat="server"
                        Text="Status"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cboStatus" runat="server" CssClass="SmallField" DataTextField="StatusName"
                        DataValueField="StatusId" AppendDataBoundItems="true">
                        <asp:ListItem Value="0" Text="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="valStatus" ControlToValidate="cboStatus"
                        runat="server" ErrorMessage="Status is required." ForeColor="Red" Display="Dynamic" InitialValue="0">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
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

        var today = new Date();

        $(document).ready(function () {

            $("[id$=txtLicenseIssueDate]").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                maxDate: today,
                yearRange: '1945:' + (new Date).getFullYear()
            });

            $("[id$=txtLicenseRenewDate]").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                minDate: today
            });

            $("[id$=txtDriverPDPIssueDate]").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                maxDate: today
            });

            function enablePDP() {
                if ($("[id$=cboDriverPDP]").val() == '0') {

                    $("[id$=txtDriverPDPIssueDate]").val('');
                    $("[id$=txtDriverPDPNumber]").val('');

                    $("[id$=txtDriverPDPIssueDate]").attr('disabled', 'disabled');
                    $("[id$=txtDriverPDPNumber]").attr('disabled', 'disabled');

                    ValidatorEnable(document.getElementById($("[id$=valtxtDriverPDPNumber]").attr('id')), false);
                    ValidatorEnable(document.getElementById($("[id$=valPDPDate]").attr('id')), false);
                }
                else {
                    $("[id$=txtDriverPDPIssueDate]").removeAttr('disabled');
                    $("[id$=txtDriverPDPNumber]").removeAttr('disabled');

                    ValidatorEnable(document.getElementById($("[id$=valtxtDriverPDPNumber]").attr('id')), true);
                    ValidatorEnable(document.getElementById($("[id$=valPDPDate]").attr('id')), true);
                }
            }

            $('[id$=cboDriverPDP]').change(function () {
                enablePDP();
            });

            function inIt() {

                $("[id$=txtLicenseIssueDate]").attr('readonly', 'true');
                $("[id$=txtDriverPDPIssueDate]").attr('readonly', 'true');
                $("[id$=txtLicenseRenewDate]").attr('readonly', 'true');

                Page_ClientValidate();
                enablePDP();
            }

            inIt();
        });

        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
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
