<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TripsVehicleAllocated.aspx.cs" Inherits="BMTemplate.TripsVehicleAllocated" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">                           
    </asp:Content>
   <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <h3  class="PageTitle" id="HeaderControl" runat="server">Allocated Vehicles</h3> 
     <fieldset style="border-radius: 5px;box-shadow: 5px 5px 2px #888888;">
        <legend>Trips/Vehicles</legend>
        <table class="Normaltable"  width="200px"  >
            <tr>
                <td style="width:100px; text-align:left;" >
                   
            </td>          
            </tr>
           <tr>
              <td colspan="2">
               <asp:GridView ID="gridTrips" CssClass="GridTable" runat="server"  
                AutoGenerateColumns="false"   
                PageSize="10"  
                      Width="951px" onpageindexchanging="gridTrips_PageIndexChanging"    
                      AllowPaging="true">
                <Columns>
                 <asp:BoundField DataField="RegistrationNumber" DataFormatString="{0}" HeaderText="Reg. No"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="RegistrationNumber"  />
                          <asp:BoundField DataField="VehicleMakeName" DataFormatString="{0}" HeaderText="Make"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="VehicleMakeName"  />
                         <asp:BoundField DataField="VehicleModelName" DataFormatString="{0}" HeaderText="Model"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="VehicleModelName"  />
                            <asp:BoundField DataField="TripDescription" DataFormatString="{0}" HeaderText="Trip description"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="TripDescription"  />
                           <asp:BoundField DataField="TripDate" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Trip Date"
                        ItemStyle-Width="120" ReadOnly="True" SortExpression="TripDate"  />
     
                 </Columns> 
                 </asp:GridView>
              </td>
                  <td>     
                 
            </td>                
        </tr>        
    </table>
    </fieldset>
</asp:Content>
