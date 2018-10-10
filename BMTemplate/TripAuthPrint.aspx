<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripAuthPrint.aspx.cs" Inherits="BMTemplate.TripAuthPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>       
    <style type="text/css">
        .tableStyle
        {
            width: 35%;
        }
        .style2
        {
            width: 249px;
        }
        .style3
        {
            height: 23px;
            width: 265px;
        }
        .style4
        {
            width: 269px;
        }
        .style6
        {
            width: 265px;
            height: 22px;
        }
        .style10
        {
            width: 312px;
        }
        .style11
        {
            height: 23px;
        }
        .style12
        {
            width: 35%;
            height: 23px;
        }
        .style13
        {
            height: 48px;
        }
        .style14
        {
            height: 23px;
            width: 30%;
        }
        </style>
    
    <script src="Jquery2/js/jquery-1.8.3.js" type="text/javascript"></script>
  
</head>
<body style="margin:0;padding:0">
  <form id="form1" runat="server">
    <div  >
  <table border="1" width="100%" cellspacing="1" height="100%">
	<tr>
     <td >  
     <img src="Images/BM_Header.jpg" alt="statslogo" 
             style="width: 660px; height:80px;"   />    
     </td>
    
    </tr>
    <tr>
		<td>
		
			<table runat="server" border="0" width="100%" cellspacing="0" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
				<tr>      </tr>
                
                <tr>
					<td colspan="2" align="right">
					  
                     </td>
					<td align="right" valign="top" >
					
			
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
					<p align="center"><i><font size="5">Hired Vehicle Trip 
					Authority</font></i></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Vehicle registration number</td>
					<td id="VehReg" runat="server" width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium"><b><i><font color="#0000FF"></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;<p>&nbsp;</td>
					<td width="50%" colspan="2" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Rental Company</td>
					<td id="RentalCO" runat="server" width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium"><b><i><font color="#0000FF"></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;<p>&nbsp;</td>
					<td width="50%" colspan="2" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: none; border-bottom-width: medium; border-right-style:none; border-right-width:medium">Driver </td>
					<td id="Drivernameinfo" runat="server"  width="50%"  colspan="2" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium"><b><i><font color="#0000FF"></font></i></b></td>
				</tr>
				
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: none; border-top-width: medium; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">ID Number</td>
					<td  id="DriverIDinfo" runat="server"  width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-top-style: none; border-top-width: medium; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium"><b><i><font color="#0000FF"></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
					<td width="50%" colspan="2" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium">Co-Driver</td>
					<td id="CoDriverName" runat="server" width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-left-style:none; border-left-width:medium; border-bottom-style:none; border-bottom-width:medium"><b><i><font color="#0000FF"></font></i></b></td>

				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" height="25">Id Number</td>
					<td  id="CoDriverIdNo" runat="server"  width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium; border-top-style:none; border-top-width:medium" height="25"><b><i><font color="#0000FF"></font></i></b></td>

				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
					<td width="50%" colspan="2" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1px">Provincial Office issuing authority</td>
					<td id="ProvinceIssuing" runat="server" width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium; border-top-style:solid; border-top-width:1px"><b><i><font color="#0000FF"></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;<p>&nbsp;</td>
					<td width="50%" colspan="2" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Project Name</td>
					<td id="Project" runat="server"  width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium"><b><i><font color="#0000FF"></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium">&nbsp;</td>
					<td width="50%" colspan="2" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Petrol card number</td>
					<td  id="PetrolCard" runat="server" width="50%" colspan="2" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium"><b><i><font color="#0000FF"></font></i></b></td>
				
				</tr>
                <tr style="height:250px"> 
                
                
                
                </tr>
				</table>
		
		</td>
	</tr>
</table>

<p  style="page-break-before:always">&nbsp;</p>

<table border="1" runat="server" width="100%" cellspacing="1" height="200">
<tr>
 <td >
  <img src="Images/BM_Header.jpg" alt="statslogo" 
             style="width: 660px; height:80px;"   />  
 </td>
</tr>
   <tr>
    <td  align="center" >
        <font  size ="5"> TRIP AUTHORITY </font>     
    </td>
    </tr>
     
    <tr>
        <td>
            <font  size="5">
              Particulars 
            </font>
        </td>
    
    </tr>
    <tr>
        <td>
       <table runat="server">
      <tr>
        <td  id="TaskDesc" runat="server" >
                 
         </td> 
         <td>      
         </td>

         <td id="TaskDuration" runat="server" class="style11" >   
          </td>
         <td  >
           
         </td>
      </tr>
      <tr>
           <td id="TaskDescr" runat="server"  width="28%" class="style11">
                   
           </td>  
           <td  class="style12">
         
         
         </td>  





           <td id="areaofResponsibility"  runat="server" class="style12">
            
           </td>    
           </tr>
             </table>
        </td>   
    </tr>
    <tr>
        <td > 
           <font size ="5"> 
            Particulars of the Vehicle 
           </font>
        </td>
    </tr>
      <tr>
      <td style="border-style: solid; border-width: 2px">
      <table>
      <tr>
        <td  id="VehRegAuth" runat="server" >
                 
         </td> 
         <td>      
         </td>

         <td id="VehDescption" runat="server" class="style11" >   
          </td>
         <td  width="30%" class="style11" >
           
         </td>
      </tr>
      <tr>
            <td  colspan="2" align="left" style ="background-color:GrayText;border-width:2px;border-bottom:2px;border-left:2px;border-right:2px;border-top:2px">
               Start of the Project</td>
            <td  colspan="2" align="left" style ="background-color:GrayText;border-width:2px">           
               End of the Project
            </td>      
      </tr>
      <tr>
           <td id="startOddo" runat="server"  width="28%" class="style11">
                   
           </td>  
           <td  runat="server" class="style12">
         
         
         </td>  





           <td class="style12">
            Oddo Meter Reading:
           </td>    
           </tr>
             <tr>
                <td >
                 Signature of Driver:                
                 </td>  
                 <td >
         
         
         </td>                  
                  <td >
                  Signature of Driver:
                  </td>      
            </tr>
      <tr>
      <td>
     Date:
      
      </td>
      <td class="tableStyle">
         
         
         </td>  
      <td class="tableStyle">
     Date:
      </td>      
      </tr>
      <tr>
      <td>
        Name of Issuing officer:        
      </td>
      <td class="tableStyle">
         
         
         </td>  
      <td class="tableStyle">
        Name of Issuing officer: 
      </td>
     </tr>
      </table>
      </td>

      </tr>      
     <tr>
         <td ><font size= "5">Particulars of the driver</font></td>
          
        
     
     </tr>


     <tr>
        <td>
        <asp:GridView  ID="DriverGriedview" runat="server"  HeaderStyle-ForeColor="White"   AutoGenerateColumns="False" AllowPaging="false"
                               DataKeyNames="DriverIdNumber"  style="width:250px;" >
                       
                        <Columns>
                             <asp:ButtonField DataTextField="DriverIdNumber" HeaderText="DriverId" ItemStyle-Width="100" 
                                        CommandName="Select" SortExpression="DriverIdNumber"  Visible="False"  /> 
                              <asp:BoundField DataField="NAME"  HeaderText="NAME"  ItemStyle-Width="100"/>
                              <asp:BoundField DataField="Surname" HeaderText=" Surname" ItemStyle-Width="100"   />
                              <asp:BoundField DataField="DriverIdNumber" HeaderText="ID NO"   ItemStyle-Width="15"  />
                        </Columns>   
                    </asp:GridView> 
     
        </td>
   </tr>
   <tr>
      <td class="style13" >
      I read and understood Terms and Conditions as set out in the Operating Instructions For Officers and<br />
      Employees using Stats SA Motor Vehicles.<br />
          <br />
          (NB. A new logbook is to be used for every vehicle if replaced)
      </td>
   
   </tr>
   
   
   <tr>
   <td>
      <font size ="5">Particulars of Passengers </font> 
   
   </td> 
   </tr>
   <tr>
      <td >
      <asp:GridView  ID="PassengerGridView" runat="server"  HeaderStyle-ForeColor="White"   AutoGenerateColumns="False" AllowPaging="false"
                               DataKeyNames="TripId"  style="width:250px;">
                        <Columns>
                            <asp:ButtonField DataTextField="TripId" HeaderText="Card Number" ItemStyle-Width="100" 
                                        CommandName="Select" SortExpression="TripId"  Visible="false"  /> 
                              <asp:BoundField DataField="PassengerFirstName"  HeaderText="NAME"  ItemStyle-Width="100"/>
                              <asp:BoundField DataField="PassengerSurname" HeaderText="Surname" ItemStyle-Width="100"   />
                              <asp:BoundField DataField="PassengerIdNo" HeaderText="ID NO"   ItemStyle-Width="15"  />
                        </Columns>   
                    </asp:GridView> 
      <%--<table id="PassengerTable" runat="server">
           <tr>
              <td>
                 
              </td>
              
                         
           </tr>
         
      </table> --%>
     
      
      </td>
   </tr>
   <tr>
    <td >
      It is hereby authorized that the vehicle, as described above, may be used by the driver and passengers as specified for<br/>
      the execution of their duties as described in the duty sheet.                       
    </td> 
   </tr>          
   <tr>
       <td>
       <table>
          <tr>
             <td>
              <font size ="5"> AUTHORISATION </font>              
             </td>
             <td class="style10">
             
             
             </td>
             <td class="style2">
             
             
               OFFICE STAMP</td>
             <td width ="200px">
             
             
                 &nbsp;</td>
               <td width ="200px">
             
             
                   &nbsp;</td>
          </tr>
          <tr> 
             <td>
             
              Manager/District Manager
                                     
             </td>
             <td class="style10">
             
             
             </td>
              <td class="style2">
             
             
                  &nbsp;</td>
               <td width ="200px">
             
             
                   &nbsp;</td>
          
          </tr>
          <tr> 
              <td class="style4">
                 <table border ="2">
                    <tr>
                        <td align="center" class="style3" style="border-top:2px;border-right:2px;border-left:2px;">
                            Signature:</td> 
                        
                                                 
                        
                                             
                    </tr>
                     <tr>
                         <td class="style6" style="border-top:2px;border-right:2px;border-left:2px;">
                             <br />
&nbsp; ----------------------------------</td> 
                    </tr>
                                    
                </table>
              
             </td>
              <td class="style4">
             <table border="2">
                    <tr>
                        <td align="center" class="style3" style="border-top:2px;border-right:2px;border-left:2px;">
                            Date:</td> 
                        
                                                 
                        
                                             
                    </tr>
                     <tr>
                         <td class="style6" style="border-top:2px;border-right:2px;border-left:2px;border-bottom:2px">
                             &nbsp;&nbsp;
                             <br />&nbsp; -------------------------------</td> 
                    </tr>
                                    
                </table>
             
             </td>
          
          </tr>
          </table>
       
       </td>
      
   </tr>
      
</table>


<%--<p  style="page-break-before:always">&nbsp;</p>
<table border="1" width="100%" cellspacing="1" height="90">
	<tr>
    <td>
     <img src="Images/BM_Header.jpg" alt="statslogo" 
             style="width: 660px; height:80px;" />
    </td>
   
    
    </tr>
    <tr>
		<td>
		
			<table border="0"  cellspacing="1" width="100%" >
				<tr>
					<td colspan="5">
					    &nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5">
					<p align="center"><b><font size="4">Vehicle INSPECTION SHEET</font></b></td>
				</tr>
				<tr>
					<td colspan="5" id="officedesc" runat="server"  ><font size="2">Office:&nbsp; <i><b> <font color="#0000FF"></font></b></i><br>
					</font></td>
				</tr>
				<tr>
					<td colspan="5" id="VehicleDesciption" runat="server"><font size="2">
					<font color="#0000FF"> <b><i>  
					
					</i></b></font></font></td>
				</tr>
                <tr>
                  <td colspan="5" id="Vehdes" runat ="server">
                                   
                  </td>
                </tr>
                <tr  colspan="5" runat="server"> 
                   <td id="MakeDescript">  
                   
                   </td>
                
                </tr>
                <tr> 
                   <td colspan="5" id="VehinspectRegistration" runat="server">  
                   
                   </td>
                
                </tr>
				<tr>
					<td width="40%">&nbsp;</td>
					<td width="26%" colspan="2" align="center" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Vehicle handed 
					out</font></td>
					<td colspan="2" align="center" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Vehicle handed in</font></td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td align="center" 
                        
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">
					<font size="2">YES</font></td>
					<td width="13%" align="center" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">NO</font></td>
					<td width="12%" align="center" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">YES</font></td>
					<td align="center" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">
					<font size="2">NO</font></td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Body (any dents, scratches etc.)</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Rear Mirror</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Lights (head lights, brake lights, indicator 
					lights, reverse lights and number plate lights)</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Horn - working</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Wiper blades - serviceable</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Tyres - serviceable</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Spare wheel</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Jack &amp; handle</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Wheel spanner</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Number plates (front &amp; back - secure)</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Oil level correct</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Brake fluid level correct</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Water level correct</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Battery water level correct </font> </td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Ignition and door keys</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Radio/tape/CD player/speakers</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Involved in an accident (if yes)</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Accident report submitted to hired company</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
					<font size="2">Accident report submitted to Stats SA</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style1">&nbsp;</td>
					<td width="13%" 
                        style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
                        &nbsp;</td>
					<td width="12%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;</td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" 
                        class="style5">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5"><table border="0">
						<tr>
							<td colspan="2" align="center" width="50%" style="border-style: solid; border-width: 1px">
							<b><font size="2">Issuing 
							of vehicle</font></b></td>
							<td colspan="2" align="center" width="50%" style="border-style: solid; border-width: 1px">
							<b><font size="2">Handing 
							back of vehicle</font></b></td>
						</tr>
						<tr>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
						</tr>
						<tr>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Driver</font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Date</font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Driver</font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Date</font></td>
						</tr>
						<tr>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2"><br/>
							_ _ _ _ _ _ _ _ _ _ </font></td>
						</tr>
						<tr>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Transport officer</font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Date</font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Transport officer</font></td>
							<td width="25%" align="center" style="border-style: solid; border-width: 1px">
							<font size="2">Date</font></td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
		
		</td>
	</tr>
</table>
<p  style="page-break-before:always">&nbsp;</p>
<table border="1" width="100%" cellspacing="1" height="90">
	<tr> 
    <td>
    <img src="Images/BM_Header.jpg" alt="statslogo" 
             style="width: 660px; height:80px; margin-top: 0px;"/>  
    </td>
    
    
    </tr>
    
    
    <tr>
		<td>
		
			<table border="0" width="100%" cellspacing="1">
				<tr>
					<td>
					    &nbsp;</td>
					
					
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
					<p align="center"><font size="5">Transport Declaration</font></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" id="declarationline1" runat="server"><font size="2"><br>
                 </font></td>
				</tr>
                <tr>
					<td colspan="2" id="DeclarationLine2" runat="server" ></td>
				</tr>
				<tr>
					<td colspan="2"><font size="2">Under no circumstances can 
					the Government allow any unofficial passenger/s in a 
					Government Vehicle (Government-owned or Hired), irrespective 
					whether these individuals are full time government employees 
					or private citizens. The only passenger/s allowed in a 
					Government Vehicle will be individuals who have been 
					officially added to the trip authority and who will be 
					performing official duties.<br>
					<br>
					In the event of unforeseen circumstances, where provision 
					has not been made for the passenger/s, the Budget 
					Manager should be informed before hand. The budget manager 
					would approve the addition of any passengers to the current 
					trip authority, before such an individual can be added. Only 
					then would the passenger be regarded as an official 
					passenger.<br>
					<br>
					STATS SA will under no circumstances accept responsibility 
					in the case of an accident and/or traffic violation where 
					negligence or recklessness can be proven on the side of the 
					active driver of the vehicle. The 
					employee will face disciplinary actions, which could lead to 
					dismissal.<br>
					<br>
					The vehicle, when not in use, should be parked in a secure 
					parking bay at all times.
					The overnight parking arrangement is either a lockable 
					fenced yard or a lockup garage.</font></td>
				</tr>
				</table>
		
		</td>
	</tr>
</table>

<table border="1" width="100%" cellspacing="1" height="90">
	
    <tr>
		<td>
		
			<table border="0" width="100%" cellspacing="1" runat="server">
				<tr>
					<td height="23" colspan="3" bgcolor="#CCCCCC">
					<p align="center">FOR OFFICE USE ONLY</p>
					<p align="center">GARAGING AND PARKING OF GOVERNMENT 
					VEHICLES (GG or HIRED)</p>
					<p align="left"><font size="2">Approval is granted for the free parking of 
					the below mentioned vehicle at the official/private premises. The approval is subject to the conditions 
					that the vehicle is to be used strictly for official 
					purposes and, furthermore that all the conditions stipulated 
					in Transport Circular No. 1 of 1975, as amended, be adhered 
					to.</font></p>
					<p id="Maketypedeclaration" runat="server" align="left"><font size="2"> </font> <font color="#0000FF"><b><i>
					<font size="2"></font></i></b></font></p>
					<p id="Regnodeclaration" runat="server" align="left"><font size="2"><font color="#0000FF"> <b><i>></i></b></font> 
					</font></p> 
					</td>
				</tr>
				<tr>
                   <td colspan="3" id="declaln1" runat="server" align="left">                  
                  </td>
				</tr>
                <tr>
                   <td colspan="3" id="declaln2" runat="server" align="left">                  
                  </td>
				</tr>
                <tr>
					
				</tr>
				<tr>
					<td align="center"><font size="2"></br>
					_ _ _ _ _ _ _ _ _ _ </font></td>
					<td align="center"><font size="2"></br>
					_ _ _ _ _ _ _ _ _ _ </font></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><font size="2">Supervisor</font></td>
					<td align="center"><font size="2">Driver</font></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><font size="2"></br>
					_ _ _ _ _ _ _ _ _ _ </font></td>
					<td align="center"><font size="2"></br>
					_ _ _ _ _ _ _ _ _ _ </font></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><font size="2">Date</font></td>
					<td align="center"><font size="2">Date</font></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" id="Celldeclaration" runat="server"><font size="2">Cellular number: </font> <font color="#0000FF"> <b><i>
					<font size="2"></font></i></b></font></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		
		</td>
	</tr>
</table>

<p  style="page-break-before:always">&nbsp;</p>

<table border="1" width="100%" cellspacing="0" cellpadding="0" id="table1">
	<tr>
         <td>
         
          <img src="Images/BM_Header.jpg" alt="statslogo" 
             style="width: 660px; height:80px; margin-top: 0px;"/>  
         </td>
    </tr>
    
    <tr>
		<td>
		<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2">
			
			
            <tr>
				<td colspan="21" align="center" >
				
					<font style="font-size: 16pt; font-weight: 700">Log sheet 
					for hired vehicles</font></td>
				<td><font size="2">Page 1 </font></td>
			</tr>
			<tr>
				<td colspan="12">
					<font size="2">Survey/Task</font></td>
				<td colspan="4">
					<font size="2">Province/Office</font></td>
				<td colspan="5">
					<font size="2">Driver</font></td>
				<td>
					<font size="2">Driver's Persal number</font></td>
			</tr>
			<tr>
				<td id="logbookSurvey" runat="server" colspan="12">
					<font size="2" color="#0000FF"><b><i></i></b></font></td>
				<td id="logbookprovince" runat="server" colspan="4">
					<font size="2" color="#0000FF"><b><i></i></b></font></td>
				<td id="logbookDriver" runat="server"       colspan="5">
					<font size="2" color="#0000FF"><b><i></i></b></font></td>
				<td id="logbookPersalNr" runat="server">
					<font size="2" color="#0000FF"><b><i></i></b></font></td>
			</tr>
			<tr>
				<td colspan="12">
					<font size="2">Vehicle registration no</font></td>
				<td colspan="4">
					<font size="2">Vehicle type</font></td>
				<td colspan="6">
					<font size="2">KM reading when vehicle was issued</font></td>
			</tr>
			<tr>
				<td colspan="12" id="logbookregistration" runat="server"><font size="2" color="#0000FF"><b><i></i></b></font></td>
				<td colspan="4"  id="logbookvehtype" runat="server"><font size="2" color="#0000FF"><b><i></i></b></font></td>
				<td colspan="6"  id="logbooklogstartoddo" runat="server">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="22">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="19">
					<b><font size="2">Fuel Consumption</font></b></td>
				<td colspan="3">
				<p align="center"><b><font size="2">Transport <br>
				officer</font></b></td>
			</tr>
			<tr>
				<td colspan="5" bordercolor="#000000" style="border-style: solid; border-width: 1px">
					<b><font size="2">Date</font></b></td>
				<td colspan="4" bordercolor="#000000" style="border-style: solid; border-width: 1px">
					<b><font size="2">Km <br>
				reading</font></b></td>
				<td colspan="4" bordercolor="#000000" style="border-style: solid; border-width: 1px">
					<b><font size="2">Liters</font></b></td>
				<td colspan="3" bordercolor="#000000" style="border-style: solid; border-width: 1px">
					<b><font size="2">Amount <br>
				(R)</font></b></td>
				<td colspan="3" bordercolor="#000000" style="border-style: solid; border-width: 1px"><b><font size="2">Cash (C) / <br>
				Card (P)</font></b></td>
				<td style="border-left-style:solid; border-left-width:3px">&nbsp;</td>
				<td bordercolor="#000000" style="border-style: solid; border-width: 1px"><b><font size="2">Km/l</font></b></td>
				<td bordercolor="#000000" style="border-style: solid; border-width: 1px">
					<b><font size="2">Signature <br>
					&nbsp;</font></b></td>
			</tr>
			<tr>
				<td colspan="5">&nbsp;</td>
				<td colspan="4">&nbsp;</td>
				<td colspan="4">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
				<td style="border-left: 3px solid #000000">&nbsp;</td>
				<td style="border-left: 1px solid #000000; border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px" bordercolor="#000000">&nbsp;</td>
				<td style="border-style: solid; border-width: 1px" bordercolor="#000000">&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="5" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td colspan="4" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td colspan="4" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td colspan="3" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td colspan="3" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td style="border-left-style:solid; border-left-width:3px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td bordercolor="#000000" style="border-style: solid; border-width: 1px">
				&nbsp;</td>
				<td bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
			</tr>
			
			
			<tr>
				<td colspan="9" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<b><font size="2">Total</font></b></td>
				<td colspan="4" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td colspan="3" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td colspan="3" bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<font size="2" color="#FFFFFF">_</font></td>
				<td style="border-left-style:solid; border-left-width:3px">
				<b>
				<font size="2" color="#FFFFFF">_</font></b></td>
				<td bordercolor="#000000" style="border-style: solid; border-width: 1px">
				&nbsp;</td>
				<td bordercolor="#000000" style="border-style: solid; border-width: 1px">
				<b>
				<font size="2" color="#FFFFFF">_</font></b></td>
			</tr>

			<tr>
				<td colspan="22"><font size="2">I certify</font></td>
			</tr>
			<tr>
				<td colspan="22">
					<ul>
						<li><font size="2">that the motor vehicle was 
						necessarily and wholly used for official purposes on the 
						trips specified</font></li>
						<li><font size="2">that there have been no deviations 
						from authorised routes for private purposes, and</font></li>
						<li><font size="2">that the fuel used and kilometers 
						traveled in connection with these trips, <i><b>either 
						paid in cash or with a petrol card</b></i>, have been 
						recorded on this log sheet</font></li>
					</ul></td>
			</tr>
			<tr>
				<td colspan="22">
				<table border="1" width="100%" cellspacing="0" cellpadding="0" id="table3" style="border-top-width: 0px; border-bottom-width: 0px">
					<tr>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">&nbsp;</td>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">&nbsp;</td>
						<td style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="20%" rowspan="2">&nbsp;</td>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">&nbsp;</td>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">&nbsp;</td>
					</tr>
					<tr>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">
						<font size="2">Driver</font></td>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">
						<font size="2">Date</font></td>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">
						<font size="2">Project/District<br>
						Manager</font></td>
						<td style="border-style: solid; border-width: 1px" width="20%" bordercolor="#000000">
						<font size="2">Date</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="22"><b><font size="2">Comments:</font></b></td>
			</tr>
			<tr>
				<td colspan="22" style="border-bottom: 1px solid #000000" bgcolor="#C0C0C0">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="22" style="border-bottom: 1px solid #000000" bgcolor="#C0C0C0">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="22" style="border-bottom: 1px solid #000000" bgcolor="#C0C0C0">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="22" style="border-bottom: 1px solid #000000" bgcolor="#C0C0C0">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="11" style="border-bottom: 1px solid #000000" bgcolor="#C0C0C0">
				<font size="2">Finance/District Manager:</font></td>
				<td colspan="11" style="border-bottom: 1px solid #000000">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="11" style="border-bottom: 1px solid #000000" bgcolor="#C0C0C0">
				<font size="2">Date:</font></td>
				<td colspan="11" style="border-bottom: 1px solid #000000">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<p  style="page-break-before:always"></p>

<table border="1" width="100%" cellspacing="1" height="90">
	<tr>
      <td>
       <img src="Images/BM_Header.jpg" alt="statslogo" 
        style="width: 660px; height:80px; margin-top: 0px;"/>  
      </td>
    
    </tr>
    
    <tr>
		<td>
		
			<table border="0" width="100%" cellspacing="0" style="border-left-width: 0px; border-right-width: 0px; border-top-width: 0px">
				<tr>
					<td colspan="2">&nbsp;</td>
					<td colspan="6">
					
					<font style="font-size: 16pt; font-weight: 700">Log sheet 
					for hired vehicles</font></td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-styleolid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="2">Survey/Project</font></td>
					<td colspan="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="2">Province</font></td>
					<td colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="2">Driver</font></td>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="2">Driver's Persal number</font></td>
				</tr>
				<tr>
					<td id="logsheet2Project" runat="server" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" colspan="2">
					<font id="size="2" color="#0000FF"><b><i></i></b></font></td>
					<td id="logsheet2Province" runat="server" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" colspan="4">
					<font size="2" color="#0000FF"><b><i></i></b></font></td>
					<td id="logsheet2Driver" runat="server"   style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" colspan="2">
					<font size="2"  color="#0000FF"><b><i></i></b></font></td>
					<td id="logsheet2Persal" runat="server"    style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="2" color="#0000FF"><b><i></i></b></font></td>
				</tr>
				<tr>
					<td style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" colspan="2">
					<font size="2" >Vehicle registration no</font></td>
					<td  style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" colspan="4">
					<font size="2">Vehicle type</font></td>
					<td colspan="3"  style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="2">KM reading when vehicle was issued</font></td>
				</tr>
				<tr>
					<td id="logsheet2VehicleRegno" runat="server"  style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" colspan="2"><font size="2" color="#0000FF"><b><i></i></b></font></td>
					<td id="logsheet2VehicleType"  runat="server"  style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" colspan="4"><font size="2" color="#0000FF"><b><i></i></b></font></td>
					<td id="logsheet2startOddo"  runat="server" colspan="3" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">&nbsp;</td>
				</tr>
				<tr>
					<td width="100%" colspan="9"><font size="2">&nbsp;</font><table border="1" width="100%" cellspacing="0">
						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<b><font size="1">Date</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
					<b><font size="1">Departed <br>
					from</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
					<b><font size="1">Depart-ing 
					time</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
					<b><font size="1">Arrived <br>
					at</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
					<b><font size="1">Arrival <br>
					time</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
					<b><font size="1">KM reading <br>
					arrival</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
					<b><font size="1">Km <br>
					traveled</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
					<b><font size="1">Number of
					passengers</font></b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
					<b><font size="1">Reason for <br>
					the trip</font></b></td>
						</tr>

						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>

						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>

						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>

						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>

						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
						<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
<tr>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" 
                                class="style9">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="131">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="32">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="125">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="31">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="42">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="48">
							<font size="5">&nbsp;</font></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000">
							<font size="5">&nbsp;</font></td>
						</tr>
						<tr>
							<td style="padding-left: 2px; padding-right: 2px; border-top-color:#000000" width="387" colspan="6">
							<p align="right"><b>&nbsp;Sub total/Total 
							kilometers traveled&nbsp;&nbsp;
					</b></td>
							<td style="padding-left: 2px; padding-right: 2px" bordercolor="#000000" width="34">&nbsp;</td>
							<td style="padding-left: 2px; padding-right: 2px" width="48">&nbsp;</td>
							<td style="padding-left: 2px; padding-right: 2px">&nbsp;</td>
						</tr>
					</table>
</td>
				</tr>
				<tr>
					<td width="100%" colspan="9"><font size="1">&nbsp;</font></td>
				</tr>
				<tr>
					<td width="100%" colspan="9" style="border-top-style: none; border-top-width: medium">
					<ul>
						<li><font size="1">that the motor vehicle was 
						necessarily and wholly used for official purposes on the 
						trips specified</font></li>
						<li><font size="1">that there have been no deviations 
						from authorised routes for private purposes, and</font></li>
						<li><font size="1">that the fuel used and kilometers 
						traveled in connection with these trips, <i><b>either 
						paid in cash or with a petrol card</b></i>, have been 
						recorded on this log sheet</font></li>
					</ul>
					</td>
				</tr>
				<tr>
					<td width="20%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" height="36">&nbsp;</td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" height="36">
					<font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2" height="36"><font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" height="36">
					<font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" height="36">
					<font size="1">&nbsp;</font></td>
				</tr>
				<tr>
					<td width="20%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="1">Driver</font></td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="1">Date</font></td>
					<td width="20%" colspan="2"><font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="1">Project/District Manager</font></td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000">
					<font size="1">Date</font></td>
				</tr>
				<tr>
					<td width="100%" colspan="9">
					<p align="center"><i><b><font size="1">Office use</font></b></i></td>
				</tr>
				<tr>
					<td width="100%" colspan="9" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" bgcolor="#CCCCCC">
					<font size="1">Comments:</font></td>
				</tr>
				<tr>
					<td width="100%" colspan="9" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" bgcolor="#CCCCCC">
					<font size="1">&nbsp;</font></td>
				</tr>
				<tr>
					<td width="100%" colspan="9" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" bgcolor="#CCCCCC">
					<font size="1">&nbsp;</font></td>
				</tr>
				<tr>
					<td width="20%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" bgcolor="#CCCCCC">
					<font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" bgcolor="#CCCCCC">
					<font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2"><font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2"><font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2"><font size="1">&nbsp;</font></td>
				</tr>
				<tr>
					<td width="20%" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" bgcolor="#CCCCCC">
					<font size="1">Finance/District Manager</font></td>
					<td width="20%" colspan="2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px" bordercolor="#000000" bgcolor="#CCCCCC">
					<font size="1">Date</font></td>
					<td width="20%" colspan="2"><font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2"><font size="1">&nbsp;</font></td>
					<td width="20%" colspan="2"><font size="1">&nbsp;</font></td>
				</tr>
				</table>
		
		</td>
	</tr>
</table>
--%>
    </div>
    </form>
    <script type="text/javascript">

        $(document).ready(function () {         
            var fmePrint = parent.document.getElementById('fmePrint')
            if (fmePrint != null) {
                fmePrint.contentWindow.focus();
                fmePrint.contentWindow.print(); 
            }
        });
    </script>
</body>
</html>
