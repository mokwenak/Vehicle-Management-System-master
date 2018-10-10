<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TripsAvailableVehicles.aspx.cs" Inherits="BMTemplate.TripsAvailableVehicles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">                           
    </asp:Content>
   <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
       <h3  class="PageTitle" id="HeaderControl" runat="server">Non Allocated Vehicles</h3> 
     <fieldset style="border-radius: 5px;box-shadow: 5px 5px 2px #888888;">
        <legend>Vehicles </legend>
        <table class="Normaltable"  >
           <tr>
              <td colspan="2">
               <asp:GridView ID="grdVehicles" CssClass="GridTable" runat="server"  
                AutoGenerateColumns="false"
                PageSize="10"  
                      Width="951px" onpageindexchanging="grdVehicles_PageIndexChanging"    
                      AllowPaging="true" Height ="100px">
                <Columns>
                 <asp:BoundField DataField="RegistrationNumber" DataFormatString="{0}" HeaderText="Registration No"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="RegistrationNumber" />
                   <asp:BoundField DataField="VehicleModel.VehicleMake.VehicleMakeName" DataFormatString="{0}" HeaderText="Make"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="VehicleMakeName"  />
                         <asp:BoundField DataField="VehicleModel.VehicleModelName" DataFormatString="{0}" HeaderText="Model"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="VehicleModelName"  /> 
                 </Columns> 
              </asp:GridView>
              </td>
                  <td>     
                 
            </td>                
        </tr>        
    </table>
    </fieldset>
</asp:Content>