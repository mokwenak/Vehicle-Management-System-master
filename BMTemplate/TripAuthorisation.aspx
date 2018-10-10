<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Culture="en-GB" CodeBehind="~/TripAuthorisation.aspx.cs" Inherits="BMTemplate.TripAuthorisation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle">Request a vehicle</h3>
    <p>
        <asp:Label ID="lblError" runat="server" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>
    </p>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Trip Information</legend>
        <table class="Normaltable">
            <tr>
                <td class="LabelColumn">
                    <asp:Label runat="server" Text="Project Name" ID="Label9"></asp:Label>
                </td>
                <td class="FieldColumn" colspan="2">
                    <asp:TextBox runat="server" CssClass="LargeField" ID="ProJTxt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ProJTxt"
                        Display="Dynamic" ErrorMessage="Project Name is required" ForeColor="Red"
                        ToolTip="Project Name is required">*</asp:RequiredFieldValidator>
                </td>
            </tr>          
            <tr>
                <td class="LabelColumn">
                    <asp:Label runat="server" Text="Trip Description" ID="Label5"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox runat="server" Height="103px" Width="410px" ID="tripDescpText"
                        Style="margin-top: 0px" TextMode="MultiLine">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tripDescpText"
                        Display="Dynamic" ErrorMessage="Trip Description is required" ForeColor="Red"
                        ToolTip="Trip Description is required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="LabelColumn">
                    <asp:Label runat="server" Text="Trip Date" ID="Label8"></asp:Label>
                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="_tripDate" runat="server"
                        BorderWidth="2px" BorderColor="Silver" CssClass="SmallField"
                        Style="background-image: url(../Images/Calendar4.png); background-repeat: no-repeat; background-position: right" AutoPostBack="True" OnTextChanged="_tripDate_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="_tripDate"
                        Display="Dynamic" ErrorMessage="Trip Date is required" ForeColor="Red"
                        ToolTip="Trip Date is required">*</asp:RequiredFieldValidator>
                </td>

                <td class="LabelColumn" style="width: 195px">
                    <asp:Label runat="server" Text="Expected Return Date" ID="Label7"></asp:Label>
                </td>
                <td class="FieldColumn" style="width: 191px">
                    <asp:TextBox ID="returnDate" runat="server"
                        BorderWidth="2px" BorderColor="Silver" CssClass="SmallField"
                        Style="background-image: url(../Images/Calendar4.png); background-repeat: no-repeat; background-position: right" AutoPostBack="True" OnTextChanged="_tripDate_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="returnDate"
                        Display="Dynamic" ErrorMessage="Expected Return Date is required" ForeColor="Red"
                        ToolTip="Expected Return Date is required">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ID="valCompareReturnDate" ControlToValidate="returnDate" ControlToCompare="_tripDate" Operator="GreaterThanEqual" Type="Date" Display="Dynamic" ErrorMessage="Expected Return Date can not less than Trip Date" ForeColor="Red"
                        ToolTip="Expected Return Date can not less than Trip Date">*</asp:CompareValidator>
                </td>
            </tr>

            <tr>

                <td class="LabelColumn">
                    <asp:Label runat="server" Text="Start Point" ID="Label1"></asp:Label>
                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="startPoint" runat="server"
                        BorderWidth="2px" BorderColor="Silver" CssClass="SmallField">
                           <%-- ontextchanged="startPoint_TextChanged">--%>
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="_tripDate"
                        Display="Dynamic" ErrorMessage="Trip Date is required" ForeColor="Red"
                        ToolTip="Trip Date is required">*</asp:RequiredFieldValidator>
                </td>

                <td class="LabelColumn" style="width: 195px">
                    <asp:Label runat="server" Text="Destination" ID="Label2"></asp:Label>
                </td>
                <td class="FieldColumn" style="width: 191px">
                    <asp:TextBox ID="destination" runat="server"
                        BorderWidth="2px" BorderColor="Silver" CssClass="SmallField">
                           <%-- ontextchanged="startPoint_TextChanged">--%>
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="returnDate"
                        Display="Dynamic" ErrorMessage="Expected Return Date is required" ForeColor="Red"
                        ToolTip="Expected Return Date is required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
                      
        </table>
    </fieldset>
    <br />
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Driver and Vehicle Information</legend>
        <table class="Normaltable">
            <tr>
                <td class="LabelColumn">
                    <asp:Label runat="server" Text="Driver"></asp:Label>
                </td>
                <td class="FieldColumn" colspan="2">
                    <asp:DropDownList ID="driverDD" runat="server" CssClass="LargeField" AppendDataBoundItems="true" DataTextField="DriverText" DataValueField="DriverId" OnSelectedIndexChanged="driverDD_SelectedIndexChanged">
                        <asp:ListItem Text="Select" Value="0" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="driverDD"
                        Display="Dynamic" ErrorMessage="Driver is required" ForeColor="Red" InitialValue="0"
                        ToolTip="Driver is required">*</asp:RequiredFieldValidator>
                </td>
                <td class="LabelColumn" style="width: 191px">Co. Driver</td>
                <td class="FieldColumn">
                    <asp:DropDownList ID="coDriverDD" runat="server" CssClass="MediumField" DataTextField="DriverText" DataValueField="DriverId"
                        Height="16px"
                        Width="186px">
                        <asp:ListItem Text="Select" Value="0" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="LabelColumn">
                    <asp:Label ID="TripIDlb0" runat="server" Text="Vehicle Type"></asp:Label>
                </td>
                <td class="FieldColumn">
                    <asp:DropDownList ID="cboVehiclesType" runat="server" CssClass="MediumField" AutoPostBack="True" AppendDataBoundItems="true"
                        DataTextField="VehicleTypeName" DataValueField="VehicleTypeId">
                        <asp:ListItem Text="Select " Value="0" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="cboVehiclesType"
                        Display="Dynamic" ErrorMessage="Vehicle Type is required" ForeColor="Red" InitialValue="0"
                        ToolTip="Vehicle Type is required">*</asp:RequiredFieldValidator>
                </td>               
            </tr>

            <tr>
                <td class="LabelColumn">
                    <asp:Button ID="btn_SubmitTrip" class="Button" runat="server" Height="34px"
                        OnClick="btn_SubmitTrip_Click" Text="Next" Width="101px" />
                </td>
            </tr>
        </table>
    </fieldset>

    <div id="validation_dialog" style="display: none;">
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" Width="332px" />
    </div>
    <script type="text/javascript">

        var saveFlag = false;
        var today = new Date('<%= this.Today.ToLongDateString() %>');
        $(document).ready(function () {

            function inIt() {

                $("[id$=_tripDate]").datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    minDate: today
                });

                $("[id$=returnDate]").datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    minDate: today
                });

                Page_ClientValidate();
            }

            inIt();

            $("[id$=btn_SubmitTrip]").click(function () {
                saveFlag = true;
            });

        });

        $("[id$=driverDD]").change(function () {

            var driver = getDriverInfo($(this).find('option').filter(':selected').text());

            if (driver.IsSuspended) {
                alert('The selected driver, ' + driver.Name + ', has been suspended');
                $(this).val("");
            }
            else if (!driver.IsValidLicence) {
                alert('The selected driver, ' + driver.Name + ', has an expired license');
                $(this).val("");
            }
            enableSubmitBtn();
        });

        $("[id$=coDriverDD]").change(function () {

            var driver = getDriverInfo($(this).find('option').filter(':selected').text());

            if (driver.IsSuspended) {
                alert('The selected co-driver , ' + driver.Name + ', has been suspended.');
                $(this).val("");
            }
            else if (!driver.IsValidLicence) {
                alert('The selected co-driver, ' + driver.Name + ', has an expired license.');
                $(this).val("");
            }

            enableSubmitBtn();
        });

        function enableSubmitBtn() {

            var driver = getDriverInfo($("[id$=driverDD]").find('option').filter(':selected').text());
            var coDriver = getDriverInfo($("[id$=coDriverDD]").find('option').filter(':selected').text());

            $("[id$=btn_SubmitTrip]").prop("disabled", !(driver.IsActive && driver.IsValidLicence && coDriver.IsActive && coDriver.IsValidLicence));
        }

        function getDriverInfo(selected) {

            var values = selected.split(",", 3);

            var driver = {};

            if (values.length == 3) {
                driver = {
                    Name: values[0],
                    IsActive: values[1].trim() == 'Active',
                    IsSuspended: values[1].trim() == 'Suspended',
                    IsValidLicence: values[2].trim() == 'Valid License'
                };
            }
            else {
                driver = {
                    Name: values[0],
                    IsActive: true,
                    IsSuspended: false,
                    IsValidLicence: true
                };
            }

            return driver;
        }

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
