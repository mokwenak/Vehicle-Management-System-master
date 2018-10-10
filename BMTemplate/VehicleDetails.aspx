<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleDetails.aspx.cs" Inherits="BMTemplate.VehicleDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Jquery2/css/ui-lightness/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/VMS.css" rel="stylesheet" type="text/css" />
    <link href="assets/js/pagination.css" rel="stylesheet" />
    <script src="Jquery2/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="Jquery2/js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
    <style type="text/css">
        .ErrorControl {
            background-color: #FBE3E4;
            border: solid 1px Red;
        }

        .style1 {
            width: 100px;
        }

        .style2 {
            width: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle" id="Vehicledialog" runat="server">Register Vehicle Details</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Vehicle Details</legend>
        <table class="Normaltable">
            <tr>
                <td class="style2">
                    <asp:Label ID="Persal" runat="server" Text="Registration Number"></asp:Label>:
                </td>
                <td class="style2">
                    <asp:TextBox ID="Regnum" runat="server" BorderWidth="2px" BorderColor="Silver"
                        MaxLength="10">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegnum" ControlToValidate="Regnum"
                        runat="server" ErrorMessage="Registration number is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1"></td>
                <td class="style2">
                    <asp:Label ID="Serveceintvelalbl" runat="server" Text="Service Interval"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="ServiceIntrevaltxb" runat="server" BorderWidth="2px"
                        BorderColor="Silver" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isNumeric(event.keyCode);"
                        onpaste="return false;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ServiceIntrevaltxb" ToolTip="Service interval is Required."
                        runat="server" ErrorMessage="Service interval is Required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="VINnumlbl" runat="server" Text="VIN Number"></asp:Label>:    
                </td>
                <td class="style2">
                    <asp:TextBox ID="VINnum" runat="server" BorderWidth="2px" BorderColor="Silver"
                        MaxLength="25">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldVinNumber" ControlToValidate="VINnum"
                        runat="server" ErrorMessage="Vin number is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1"></td>
                <td class="style2">
                    <asp:Label ID="StarOddoreadlbl" runat="server" Text="Start ODO meter Reading"></asp:Label>: 
                </td>
                <td>
                    <asp:TextBox ID="StarOddoreadtxb" runat="server" BorderWidth="2px" BorderColor="Silver" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isNumeric(event.keyCode);"
                        onpaste="return false;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="StarOddoreadtxb" ToolTip="Start Oddo Meter number is required."
                        runat="server" ErrorMessage="Start Oddo Meter number is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Vehclmadelbl" runat="server" Text="Vehicle Make"></asp:Label>:   
                </td>
                <td class="style2">
                    <asp:DropDownList ID="VehclmakeDrpdown" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Style="margin-left: 1px; width: 148px" AppendDataBoundItems="true"
                        OnSelectedIndexChanged="VehclmakeDrpdown_SelectedIndexChanged" DataTextField="VehicleMakeName" DataValueField="VehicleMakeId" AutoPostBack="True">
                        <asp:ListItem Text="Select " Value="0" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="VehclmakeDrpdown" InitialValue="0"
                        runat="server" ToolTip="Vehicle Make is required" ErrorMessage="Vehicle Make is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
                <td class="style1"></td>
                <td class="style2">
                    <asp:Label ID="Odlastlastservicelb" runat="server" Text="ODO meter at Last service"></asp:Label>:    
                </td>
                <td>
                    <asp:TextBox ID="Odlastlastservictxb" runat="server" BorderWidth="2px" BorderColor="Silver" onkeyup="keyUP(event.keyCode)"
                        onkeydown="return isNumeric(event.keyCode);"
                        onpaste="return false;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Vehclmodelbl" runat="server" Text="Vehicle Model"></asp:Label>:   
                </td>
                <td class="style2">
                    <asp:DropDownList ID="Vehclmodeldrd" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Style="margin-left: 1px; width: 148px" DataTextField="VehicleModelName" DataValueField="VehicleModelId">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Vehclmodeldrd" InitialValue="0"
                        runat="server" ToolTip="Vehicle Mode is required" ErrorMessage="Vehicle Model is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1"></td>
                <td class="style2">
                    <asp:Label ID="Vhclconditionlbl" runat="server" Text="Condition of Vehicle"></asp:Label>:  
                </td>
                <td>
                    <asp:TextBox ID="Vhclconditiontxb" runat="server" BorderWidth="2px" BorderColor="Silver"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="Vhclconditiontxb"
                        runat="server" ErrorMessage="Condition of Vehicle is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="ModelyrLbl" runat="server" Text="Model Year"></asp:Label>:   
                </td>
                <td class="style2">
                    <asp:TextBox ID="Modelyrtxb" runat="server" BorderWidth="2px"
                        BorderColor="Silver" MaxLength="4"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic"
                        ControlToValidate="Modelyrtxb" ID="RegularExpressModel"
                        ValidationExpression="^[\s\S]{4,}$" runat="server" ForeColor="Red" ToolTip="Minimum 4 characters required For Model Year"
                        ErrorMessage="Minimum 4 characters required For Model Year">*</asp:RegularExpressionValidator>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Modelyrtxb"
                        runat="server" ErrorMessage="Model Year is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1"></td>
                <td class="style2">
                    <asp:Label ID="PetroCardexprdtelbl" runat="server" Text="SupplyType"></asp:Label>: 
                </td>
                <td>
                    <asp:DropDownList ID="Supplytypedrp" runat="server" AppendDataBoundItems="true" BorderWidth="2px" BorderColor="Silver" Style="margin-left: 1px; width: 148px" DataTextField="SupplyTypeName" DataValueField="SupplyTypeId">
                        <asp:ListItem Text="Select " Value="0" />
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Supplytypedrp" InitialValue="0"
                        runat="server" ToolTip="Supplier Type is required" ErrorMessage="Supplier Type required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EngineCpcitylbl" runat="server" Text="Engine Capacity"></asp:Label>:    
                </td>
                <td class="style2">
                    <asp:DropDownList ID="cboEngineCapacity" runat="server" BorderWidth="2px" AppendDataBoundItems="true"
                        BorderColor="Silver" Style="margin-left: 1px; width: 148px" DataTextField="EngineCapicityName" DataValueField="EngineCapicityId">
                        <asp:ListItem Text="Select " Value="0" />
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="cboEngineCapacity" InitialValue="0"
                        runat="server" ToolTip="Engine Capacity is required" ErrorMessage="Engine Capacity required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
                <td class="style1"></td>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Text="VehicleType"></asp:Label>

                </td>
                <td>
                    <asp:DropDownList ID="VehicleTypedrp" runat="server" BorderWidth="2px" AppendDataBoundItems="true"
                        BorderColor="Silver" Style="margin-left: 1px; width: 148px"
                        DataTextField="VehicleTypeName" DataValueField="VehicleTypeId">
                        <asp:ListItem Text="Select " Value="0" />
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="VehicleTypedrp" InitialValue="0"
                        runat="server" ToolTip="Vehicle Make is required" ErrorMessage="Vehicle type required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Fueltypelbl" runat="server" Text="Fuel Type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="FueulTypetxb1" runat="server" BorderWidth="2px" AppendDataBoundItems="true"
                        BorderColor="Silver" Style="margin-left: 1px; width: 148px" InitialValue="0"
                        DataTextField="FuelTypeName" DataValueField="FuelTypeId">

                        <asp:ListItem Text="Select " Value="0" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="FueulTypetxb1" InitialValue="0"
                        runat="server" ToolTip="Fuel Type is required" ErrorMessage="Fuel type required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>


                </td>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="lblStatus" runat="server"
                        Text="Status"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cboStatus" runat="server" Style="margin-left: 1px; width: 148px" DataTextField="StatusName"
                        DataValueField="StatusId" AppendDataBoundItems="true">
                        <asp:ListItem Value="0" Text="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="valStatus" ControlToValidate="cboStatus"
                        runat="server" ErrorMessage="Status is required." ForeColor="Red" Display="Dynamic" InitialValue="0">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="DiskRenewDatelbl" runat="server" Text="Disc Renewable Date "></asp:Label>:    
                </td>
                <td>
                    <asp:TextBox ID="DiskRenewalDtetxb" runat="server"
                        BorderWidth="2px" BorderColor="Silver"
                        Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DiskRenewalDtetxb" ToolTip="Disc Renew Date is required"
                        runat="server" ErrorMessage="Disc Renew Date is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>

                </td>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="DateRecvedlbl" runat="server" Text="Date Received "></asp:Label>:    
                </td>
                <td>
                    <asp:TextBox ID="DateReceivedtxb" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DateReceivedtxb" ToolTip="Date Received is required."
                        runat="server" ErrorMessage="Date Received is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="DateRetrnedlbl" runat="server" Text="Return  Date"></asp:Label>:    
                </td>
                <td>
                    <asp:TextBox ID="DteReturnedtxb" runat="server" BorderWidth="2px"
                        BorderColor="Silver" Style="background-image: url(Images/Calendar4.png); background-repeat: no-repeat; background-position: right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="DteReturnedtxb" ToolTip="Date Returned is required"
                        runat="server" ErrorMessage="Date Returned is required." ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1"></td>
                <td>
                     <asp:Label ID="lblCurrentOdo" runat="server" Text="Current ODO meter "></asp:Label>:    
                </td>
                <td>
                    <asp:TextBox ID="txtCurrentOdo" runat="server" BorderWidth="2px"
                        BorderColor="Silver" MaxLength="4" ReadOnly="true" Enabled="False"></asp:TextBox>
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
        <div style="width: 100%; max-height: 350px;">
            <div id="auditTrail">
            </div>
        </div>
        <div>
            <input type="button" id="btnBack" value="<<"/>
            <input type="button" id="btnNext" value=">>"/>
            <br />
        </div>
    </fieldset>
    <div id="validation_dialog" style="display: none;">
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" Width="332px" />
    </div>


    <script type="text/javascript">
        var saveFlag = false;
        $(document).ready(function () {

            function init() {

                $("[id$=DiskRenewalDtetxb]").datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true
                });

                $("[id$=DateReceivedtxb]").datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true
                });

                $("[id$=DteReturnedtxb]").datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true
                });

                $("#btnNext").click(function(){
                    loadHistory(++currentPage);
                });

                $("#btnBack").click(function(){
                    loadHistory(--currentPage);
                });

                var vehicleHis = <%=this.AuditTrail %>;
                var pageSize = 5.00;
                var currentPage = 1;

                function loadHistory(pageNo)
                {
                    $("#btnNext").attr("disabled", pageNo >= (vehicleHis.length / pageSize ));
                    $("#btnBack").attr("disabled", pageNo <= 1);

                    var end = (pageNo * pageSize) - 1;
                    var start = end - pageSize + 1; 

                    if(end >= vehicleHis.length){
                        end = vehicleHis.length - 1;
                    }

                    if(start > vehicleHis.length){
                        return;
                    }
                    
                    
                    $("#auditTrail").accordion( "destroy" );

                    $("#auditTrail").html("");
                    for(var i = start; i <=  end; i++){
                        var item = vehicleHis[i];
                                
                        $( "#auditTrail").append("<h4>" + item.summary +"</h4>" );

                        var tableContent = '';

                        if( item.oldData){
                            tableContent = tableContent + '<thead><tr><th></th>';
                            for(var oh in item.oldData){
                                tableContent = tableContent + '<th>' + oh + '</th>';
                            }
                            tableContent = tableContent + '</tr></thead>';
                        }

                        if(item.newData && tableContent == ''){
                            tableContent = tableContent + '<thead><tr><th></th>';
                            for(var nh in item.newData){
                                tableContent = tableContent + '<th>' + nh + '</th>';
                            }
                            tableContent = tableContent + '</tr></thead>';
                        }
                                
                        if( item.oldData){
                            tableContent = tableContent + '<tbody><tr><td style="border-top: 1px solid silver;">Before Change</td>';
                            for(var oh in item.oldData){
                                tableContent = tableContent + '<td style="border-top: 1px solid silver;">' + item.oldData[oh] + '</td>';
                            }
                            tableContent = tableContent + '</tr></tbody>';
                        }
                                
                        if(item.newData){
                            tableContent = tableContent + '<tbody><tr><td style="border-top: 1px solid silver;">After Change</td>';
                            for(var nh in item.newData){
                                tableContent = tableContent + '<td style="border-top: 1px solid silver;">' + item.newData[nh] + '</td>';
                            }
                            tableContent = tableContent + '</tr></tbody>';
                        }

                        $( "#auditTrail").append("<div><table style='margin-bottom:0px;'>" + tableContent +"</table></div>" );
                    }
                    $("#auditTrail").accordion({
                        collapsible: true,
                        active : 'none'
                    });

                }

                if(vehicleHis.length > 0){

                    $("#auditTrail").accordion();

                    loadHistory(currentPage);
                }
                else{
                    $("#btnNext").hide();
                    $("#btnBack").hide();
                }
                
                $("[id$=DiskRenewalDtetxb]").attr('readonly', 'true');
                $("[id$=DateReceivedtxb]").attr('readonly', 'true');
                $("[id$=DteReturnedtxb]").attr('readonly', 'true');

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
