<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehiclesUpdateList_Delete.aspx.cs" Inherits="BMTemplate.CodeListMaintanace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">                 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 id="Vehicledialog"  class="PageTitle"  runat="server">VehiCLE CODELIST </h3>
    <fieldset style="border-radius: 5px;box-shadow: 5px 5px 2px #888888;">
    <legend>Vehicle Code List</legend>
        <table class="Normaltable">
            <tr>
                <td class="style2">
                    Vehicle Make</td>
                <td >
                    <asp:DropDownList ID="cboVehMake"  DataTextField="VehicleMakeName" 
                        DataValueField="VehicleMakeId"  runat="server" 
                        onselectedindexchanged="cboVehMake_SelectedIndexChanged">
                    </asp:DropDownList>
                
                </td>
                <td>Capture New Vehicle Model</td>
                <td>
                    <asp:TextBox ID="txtVehModel"   runat="server" BorderWidth="2px" BorderColor="Silver" 
                            MaxLength="20"></asp:TextBox> 
                </td>
                <td class="style2">
                     <asp:Button CssClass="Button" Height="34px" Width="101px"  ID="Add0" 
                        runat ="server" Text ="Add" onclick="savebtn_Click"  OnClientClick="CallConfirmBox();" ></asp:Button >  
                </td>              
            </tr>
            <tr>
                <td> 
                    &nbsp;</td>
                <td class="style2" >
                    &nbsp;</td>     
                <td >Capture New Vehicle Make</td>            
                <td >
                    <asp:TextBox ID="txtVehMake"   runat="server" BorderWidth="2px" BorderColor="Silver" 
                            MaxLength="20"></asp:TextBox> 
                </td>
                <td>
                     <asp:Button CssClass="Button" Height="34px" Width="101px"  ID="Add" 
                        runat ="server" Text ="Add" onclick="addmakebtn_Click"></asp:Button >  
                </td>
            </tr>
            <tr>                       
                <td> 
                </td>
                <td></td>
                <td>
                
                </td>
                <td>
                   </td>
                <td>
                    &nbsp;</td>

            </tr>
            <tr>
                <td>
                     <asp:Button CssClass="Button" Height="34px" Width="101px"  ID="btnSave" runat ="server" Text ="Exit" onclick="btnSave_Click"></asp:Button >  
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