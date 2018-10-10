<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccidentDetails.aspx.cs" Inherits="BMTemplate.AccidentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Jquery2/css/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet"
        type="text/css" />
    <script src="Jquery2/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="Jquery2/js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
    <link href="Jquery2/css/ui-lightness/jquery-ui-1.9.2.custom.min.css" rel="stylesheet"
        type="text/css" />
    <script src="Jquery2/js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
    <link href="Styles/VMS.css" rel="stylesheet" type="text/css" />


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

        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .ErrorControl {
            background-color: #FBE3E4;
            border: solid 1px Red;
        }

        .style2 {
            width: 210px;
        }

        .style8 {
            width: 243px;
        }

        .style9 {
            width: 93px;
        }

        .style10 {
            width: 10px;
        }

        .style11 {
            width: 100px;
        }

        .style12 {
            width: 122px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle" id="CapturAcciID" runat="server">Capture Accident</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Trip Details</legend>
        <table class="Normaltable">
            <tr>
                <td class="LabelColumn">Vehicle Registration

                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbVhclRegistration" runat="server" BorderWidth="2px" ReadOnly="true"
                        BorderColor="Silver"></asp:TextBox>
                </td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn">Driver No</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="DriverNo" runat="server" BorderWidth="2px" ReadOnly="true"
                        BorderColor="Silver"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColumn">Trip Date</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbTripdate" runat="server" BorderWidth="2px" ReadOnly="true"
                        BorderColor="Silver" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>

                </td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn">Project Name </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbProjectName" runat="server" BorderWidth="2px" ReadOnly="true"
                        BorderColor="Silver"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColumn">Trip Description</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbTripDescription" runat="server" BorderWidth="2px" ReadOnly="true"
                        BorderColor="Silver" Width="285px" TextMode="MultiLine" Height="146px"></asp:TextBox>
                </td>
                <td class="LabelColumn"></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </fieldset>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888; width: 97%;">
        <legend>Accident Details</legend>
        <table class="Normaltable">
            <tr>
                <td class="LabelColumn">Accident  Date</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbAccidentDate" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txbAccidentDate"
                        runat="server" ToolTip="Date of Accident is requiered" ErrorMessage="Date of Accident is requiered" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>

                <td class="LabelColumn"></td>
                <td class="LabelColumn">Case Number</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="TxbcaseNumber" runat="server" BorderWidth="2px"
                        BorderColor="Silver"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TxbcaseNumber"
                        runat="server" ToolTip="Case Number is requiered" ErrorMessage="Case Number is requiered" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="LabelColumn">Comments</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbComments" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Width="285px" TextMode="MultiLine" Height="143px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txbComments"
                        runat="server" ToolTip="Comments are  requiered" ErrorMessage="Comments are required" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>


                </td>
                <td class="LabelColumn"></td>
                <td>Point of   Accident</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbPointofAccident" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Height="142px" TextMode="MultiLine" Width="305px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txbPointofAccident"
                        runat="server" ToolTip="Vehicle Mode is requiered" ErrorMessage="Vehicle Model is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="LabelColumn">Accident  Description</td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txbAccidentDescription" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Width="286px" TextMode="MultiLine" Height="158px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txbAccidentDescription"
                        runat="server" ToolTip="Accident Description is requiered" ErrorMessage="Vehicle Model is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn"></td>
                <td class="FieldColumn"></td>
            </tr>
            <tr>
                <td class="LabelColumn"></td>
                <td class="FieldColumn"></td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn"></td>
                <td class="FieldColumn"></td>
            </tr>
            <tr>
                <td class="LabelColumn"></td>
                <td class="FieldColumn"></td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn"></td>
                <td class="FieldColumn"></td>
            </tr>
            <tr>
                <td class="LabelColumn"></td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn"></td>
            </tr>
            <tr>
                <td class="LabelColumn">
                    <asp:Button CssClass="Button" Height="34px" Width="101px" ID="Savbtn"
                        runat="server" Text="Save" OnClick="btnSave_Click"></asp:Button>
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

                $("[id$=txbAccidentDate]").datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true
                });

                $("[id$=txbAccidentDate]").attr('readonly', 'true');


                Page_ClientValidate();
            }

            init();

            $("[id$=Savbtn]").click(function () {
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
