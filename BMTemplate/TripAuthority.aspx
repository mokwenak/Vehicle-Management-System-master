<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TripAuthority.aspx.cs" Inherits="BMTemplate.TripAuthority" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">   
    <style type="text/css">
        .style1
        {
            width: 4375px;
        }
        .style2
        {
            width: 3847px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%--<table border="1" width="90%" cellspacing="1" height="90">
 <tr>
	<td>
	<table border="0"  cellspacing="1" style="border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px">
       <tr>
		<td><img src="Images/BM_Header.jpg"  alt="Heade" /></td>
			<td align="right" valign="top" class="style2">			
			</td>
			 </tr>
				<tr>
					<td colspan="2">
					<p align="center"><font size="5">
                    Hired Vehicle Trip Authority</font></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
                
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Vehicle registration number</td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium" 
                        class="style2"><b><i><font color="#0000FF"><%=vehicleregistration%></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;<p>&nbsp;</td>
					<td 
                        
                        style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" 
                        class="style2">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Rental Company</td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium" 
                        class="style2"><b><i><font color="#0000FF"><%=rentalName%></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;<p>&nbsp;</td>
					<td 
                        
                        style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" 
                        class="style2">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: none; border-bottom-width: medium; border-right-style:none; border-right-width:medium">Driver </td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium" 
                        class="style2"><b><i><font color="#0000FF"><%=drivername%></font></i></b></td>
				</tr>
				
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: none; border-top-width: medium; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">ID Number</td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-top-style: none; border-top-width: medium; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium" 
                        class="style2"><b><i><font color="#0000FF"><%=driverID%></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
					<td 
                        
                        style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" 
                        class="style2">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium">Co-Driver</td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-left-style:none; border-left-width:medium; border-bottom-style:none; border-bottom-width:medium" 
                        class="style2"><b><i><font color="#0000FF"><%=codrivername%></font></i></b></td>

				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" height="25">Id Number</td>
					<td 
                        style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium; border-top-style:none; border-top-width:medium" 
                        height="25" class="style2"><b><i><font color="#0000FF"><%=codriverID%></font></i></b></td>

				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
					<td 
                        
                        style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" 
                        class="style2">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1px">Provincial Office issuing authority</td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium; border-top-style:solid; border-top-width:1px" 
                        class="style2"><b><i><font color="#0000FF"><%=session("province")%></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">&nbsp;<p>&nbsp;</td>
					<td 
                        
                        style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" 
                        class="style2">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Project Name</td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium" 
                        class="style2"><b><i><font color="#0000FF"><%=respCode%></font></i></b></td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium">&nbsp;</td>
					<td 
                        
                        style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" 
                        class="style2">&nbsp;</td>
				</tr>
				<tr>
					<td width="50%" style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-right-style:none; border-right-width:medium">Petrol card number</td>
					<td 
                        
                        style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px; border-left-style:none; border-left-width:medium" 
                        class="style2"><b><i><font color="#0000FF">_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _</font></i></b></td>			
				</tr>
				</table>
		
		</td>
	</tr>
</table>

<p  style="page-break-before:always">&nbsp;</p>

<table cellspacing="1" height="90"  border ="2" width="90%">
<tr>
 <td >
 <img  alt ="statslogo" src ="Images/BM_Header.jpg" />
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
            <table  style="border-width:2px">
              <tr>
                  <td>
                     Name of the Task: 
                 </td> 
                  <td>
                  
                    Duration of the Project:                  
                  </td>
              </tr >
              <tr>
                 <td>
                   Description of the Task:
                 </td>
                 <td>
                   Area of Responsibility:                 
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
        <td >
            Registration No:      
         </td> 
         <td >   
            Description of Vehicle:        
         </td>
      </tr>
      <tr>
            <td   align="center" style ="background-color:GrayText;border-width:2px">
               Start of the Project</td>
            <td   align="center" style ="background-color:GrayText;border-width:2px">           
               End of the Project
            </td>      
      </tr>
      <tr>
           <td>
              Oddo Meter Reading:          
           </td>    
           <td>
            Oddo Meter Reading:
           </td>    
           </tr>
             <tr>
                <td>
                 Signature of Driver:                
                 </td>                  
                  <td>
                  Signature of Driver:
                  </td>      
            </tr>
      <tr>
      <td>
     Date:
      
      </td>
      <td>
     Date:
      </td>      
      </tr>
      <tr>
      <td>
        Name of Issuing officer:        
      </td>
      <td>
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
         <table>
         <tr>
            <td width ="50%">Name:</td>
            <td width ="50%">Surname:</td>
         
         
         </tr>
         <tr>
             <td colspan="2">
             
                 Identity Number:
             
             </td> 
         
         </tr>
         
         
         </table>
     
        </td>
   </tr>
   <tr>
      <td >
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
      <table>
           <tr>
              <td>
                 Surname 
              </td>
              <td>
                 Initials             
              </td>
              <td>
                 Identity Number 
              </td>
              <td>
                 Designation              
              </td>
                         
           </tr>
      </table> 
      
      
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
               AUTHORISATION                
             </td>
             <td>
               OFFICE STAMP            
             </td>
          </tr>
          <tr> 
              <td>
                 <table>
                    <tr>
                        <td  colspan="2" align="center">
                         Manager/District Manager
                        </td>  
                             <table>
                                <tr>
                                    <td>
                                     Signature:____________________________________________&nbsp;&nbsp; Date:_________________________________________________                                  
                                    </td>
                                </tr>                                 
                             </table>
                             
                        <td>
                        
                        
                        </td>                      
                    </tr>
                
                </table>
              
             </td>
          
          </tr>
       </table>
       
       </td>
      
   </tr>
   <tr>
        <td>
        
        </td>   
   </tr>
</table>


<p style ="page-break-before:always">&nbsp;</p>



<table border="1" width="90%" cellspacing="1" height="90">
	<tr>
		<td>
		
			<table border="0"  cellspacing="1">
				<tr>
					<td colspan="2">
					<img border="0" alt="Imagestatssa"  src="Images/BM_Header.jpg" height="78" 
                            style="width: 798px"/></td>
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
					<td colspan="5"><font size="2">Office:&nbsp; <i><b> <font color="#0000FF"><%=session("province")%></font></b></i><br>
					All defects, shortages and damages must be stated after 
					inspection</font></td>
				</tr>
				<tr>
					<td colspan="5"><font size="2">Description of vehicle 
					<font color="#0000FF"> <b><i><%=vehicleMake%><br>
					<%=vehicleModel%><br>
					<%=vehicleregistration%></i></b></font></font></td>
				</tr>
				<tr>
					<td width="50%">&nbsp;</td>
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
</table>--%>

<p  style="page-break-before:always">&nbsp;</p>
<p  style="page-break-before:always">&nbsp;</p>




</asp:Content>
