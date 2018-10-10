
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TripAuthoritySlip.aspx.cs" Inherits="BMTemplate.TripAuthoritySlip" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div style="width:auto;">
    <div style="width:100%; height:100%;"> 
      <rsweb:ReportViewer ID="PrntViewer" runat="server" Width="1299px"  style="display:table; margin: 0; overflow: auto;" 
      ShowBackButton="False" ShowCredentialPrompts="False" 
      ShowDocumentMapButton="False" ShowFindControls="False" ShowZoomControl="False" 
      SizeToReportContent="True"></rsweb:ReportViewer>
    </div>   
</div>
     
<div>
</div>
</asp:Content>
