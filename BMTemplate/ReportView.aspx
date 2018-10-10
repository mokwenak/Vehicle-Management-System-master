<%@ Page Title="" Language="C#" MasterPageFile="~/Report.Master" AutoEventWireup="true" CodeBehind="ReportView.aspx.cs" Inherits="BMTemplate.ReportView" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <rsweb:ReportViewer ID="Reportviewver" runat="server" Width="950px"  style="display:table; margin: 0; overflow: auto;" 
            ShowBackButton="False" ShowCredentialPrompts="False" 
            ShowDocumentMapButton="False" ShowFindControls="False" ShowZoomControl="False" 
             SizeToReportContent="True"></rsweb:ReportViewer>
</asp:Content>
