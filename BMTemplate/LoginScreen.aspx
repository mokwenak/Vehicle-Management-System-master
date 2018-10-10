 <%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="LoginScreen.aspx.cs" Inherits="BMTemplate.LoginScreen" %>
<asp:Content ID="logincontent1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="Styles/BMStyles.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    .LoginTable
     {
       height: 10px;
     }
     .style1
     {
       width: 250px;
     }
     .trlog
     {
       height:10px
     }
     .verticallline 
     {
       width: 1px; 
       background-color:black; 
       height:100%; 
       float:left; 
      }        
</style>
</asp:Content>
<asp:Content ID="logincontent2" ContentPlaceHolderID="MainContent" runat="server">
  
            <h2> </h2>  
        <table >
        <tr style="height:100">
             <td width="250">
             <img  src="Images/Heading.jpg" alt ="LogoBM02" style="margin-left: 50px"/> 
             </td>
           <td >                               
             <asp:Login ID="Login1" runat="server" style="margin-left:170px ; border-radius:10px" Width="250px"  BackColor="#636363" 
                     Height="38px">
                 <LayoutTemplate>
                    
                     <table cellpadding ="2" cellspacing ="0" border="0" bgcolor ="#636363" style = "Height:50px; width :250px; border-radius: 10px; border: 1px solid black ;border-collapse:separate">
                         <tr>
                             <td  >
                              <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                     ForeColor="White">User name</asp:Label>
                             </td>
                              
                              <td class="LoginTable" style="border-left: 1px solid White;height: 100%;"   >
                                
                                  <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                      ForeColor="White">Password</asp:Label>    
                             
                              </td>
                                               
                         </tr>
                         <tr class="trlog" >
                                <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                </td>
                              
                                <td  style="border-left: 1px solid White;">
                                  <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                </td>

                                <td >
                                   <asp:ImageButton ID="LoginButton" runat="server" CommandName="Login" Text="" ImageUrl="~/Images/loginButton.png" 
                                    ValidationGroup="Login1" 
                                    Width="28px" BorderColor="White" Height="28px" ForeColor="White" 
                                        onclick="LoginButton_Click" />
                                </td>
                         </tr>
                     </table>
                   
                 </LayoutTemplate>
             </asp:Login>
             </td> 
         </tr>   
        <tr>
         <td>
         </td>
         <td class="style1" >
         </td>
         <td class="style1">&nbsp;</td>
       </tr>
  </table>  
   <div >
        <img   src="Images/Main image- vehicle4.jpg" alt="BMlogo" width="100%" style="border-radius:5px" />
   </div>    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
   <asp:UpdateProgress ID="UpdateProgress1" runat="server">
   <ProgressTemplate> 
   <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/load.gif" />
  </ProgressTemplate>

</asp:UpdateProgress>
    
</asp:Content>
