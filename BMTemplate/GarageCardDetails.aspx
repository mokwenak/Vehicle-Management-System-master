<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GarageCardDetails.aspx.cs" Inherits="BMTemplate.CaptureGarageCard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 id="Vehicledialog"  class="PageTitle"  runat="server">Capture Garage Card</h3>   
    <fieldset style="border-radius: 5px;box-shadow: 5px 5px 2px #888888;">
    <legend>Garage Card</legend>
        <table class="Normaltable">
            <tr>
                <td class="LabelColumn">
                    <asp:Label ID="BanklblName" runat="server" Text="Bank Name"></asp:Label>
                </td>
                <td class="FieldColumn">
                    <asp:DropDownList ID="cboBankname" runat="server"  BorderWidth="2px" 
                    BorderColor="Silver" style="margin-left: 1px;width:140px"  AppendDataBoundItems="true"
                     DataTextField="BankDescription" DataValueField="BankId" Height="19px"> 
                        <asp:ListItem Text="Select" Value="0" />
                    </asp:DropDownList> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegnum"  ControlToValidate="cboBankname"  InitialValue="0"
                        runat="server" ErrorMessage="Registration number is required."  ForeColor ="Red" Display="Dynamic" >*</asp:RequiredFieldValidator>  
                </td>
                <td class="LabelColumn"></td>
                <td class="LabelColumn">
                    <asp:Label ID="CardReceivedDatelbl" runat="server" Text="Card Received Date"></asp:Label>
                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="CardReceivedDatetxb" runat="server"  
                    BorderWidth="2px" BorderColor="Silver"  
                    style="background-image:url(Images/Calendar4.png);
                    background-repeat:no-repeat;
                    background-position:right" ></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  ControlToValidate="CardReceivedDatetxb" ToolTip="Card Received Date is Required."
                        runat="server" ErrorMessage="Card Received Date is Required."  ForeColor ="Red" Display="Dynamic" >*</asp:RequiredFieldValidator>      
                </td>              
            </tr>
            <tr>
                <td> 
                    <asp:Label ID="CardNolbl" runat="server" Text="Card Number"></asp:Label>  
                </td>
                <td class="FieldColumn" >
                    <asp:TextBox ID="CardNumber"   runat="server" BorderWidth="2px" BorderColor="Silver" 
                            MaxLength="20"></asp:TextBox>                                  
                        <asp:RequiredFieldValidator ID="RequiredFieldVinNumber"  ControlToValidate="CardNumber"
                        runat="server" ErrorMessage="Card Number is required"  ForeColor ="Red" Display="Dynamic" >*</asp:RequiredFieldValidator>  
                </td>     
                <td class="LabelColumn"></td>            
                <td class="LabelColumn"> 
                    Card Returned Date 
                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="CardReturnedDate" runat="server"  BorderWidth="2px" 
                        BorderColor="Silver"  style="background-image:url(Images/Calendar4.png);background-repeat:no-repeat;background-position:right"  ></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  ControlToValidate="CardReturnedDate" ToolTip="Card Returned Date is requiered"
                    runat="server" ErrorMessage="Card Returned Date is required."  ForeColor ="Red" Display="Dynamic" >*</asp:RequiredFieldValidator>          
                </td>
            </tr>
            <tr>                       
                <td class="LabelColumn"> 
                    Expiry Date 
                </td>
                <td class="FieldColumn">
                    <asp:TextBox ID="txtExpiryDate" runat="server"  BorderWidth="2px" 
                        BorderColor="Silver"  style="background-image:url(Images/Calendar4.png);background-repeat:no-repeat;background-position:right"  ></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate="txtExpiryDate" ToolTip="Card Expiry Date is requiered"
                    runat="server" ErrorMessage="Card Expiry Date is required."  ForeColor ="Red" Display="Dynamic" >*</asp:RequiredFieldValidator>          
                </td>
                <td class="LabelColumn">
                
                </td>
                <td class="LabelColumn">
                        Vehicle Registration Number
                   </td>
                <td class="FieldColumn">
                    <asp:DropDownList ID="cboVehicleRegno" runat="server"  BorderWidth="2px" 
                    BorderColor="Silver" style="margin-left: 1px; margin-top: 0px;" AppendDataBoundItems="true"
                     DataTextField="RegistrationNumber" DataValueField="VehicleId" Height="19px" Width="182px" 
                    >
                        <asp:ListItem Text="Select" Value="0" />
                    </asp:DropDownList> 
                        <asp:RequiredFieldValidator ID="valRequiredVehReg" InitialValue="0"  ControlToValidate="cboVehicleRegno" ToolTip="Vehicle Registration Number is requiered"
                    runat="server" ErrorMessage="Vehicle Registration Number is required."  ForeColor ="Red" Display="Dynamic" >*</asp:RequiredFieldValidator>          
                
                </td>

            </tr>
            <tr>
                <td>
                     <asp:Button CssClass="Button" Height="34px" Width="101px"  ID="btnSave" runat ="server" Text ="Save" onclick="btnSave_Click"></asp:Button >  
                </td>
            </tr>      
        </table>     
    </fieldset>
    <div id="validation_dialog" style="display:none;">
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" Width="332px" />
    </div> 
        <script type="text/javascript">
            var saveFlag = false;
            $(document).ready(function () {

                function init() {

                    $("[id$=CardReceivedDatetxb]").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true
                    });

                    $("[id$=CardReturnedDate]").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true
                    });

                    $("[id$=txtExpiryDate]").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true
                    });

                    $("[id$=CardReceivedDatetxb]").attr('readonly', 'true');
                    $("[id$=CardReturnedDate]").attr('readonly', 'true');
                    $("[id$=txtExpiryDate]").attr('readonly', 'true');

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