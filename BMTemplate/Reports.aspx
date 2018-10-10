<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="BMTemplate.Reports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="PageTitle">Reports </h3> 
    <fieldset style="border-radius: 5px;box-shadow: 5px 5px 2px #888888;">
        <legend>Trips</legend>
        <asp:GridView ID="grdReports" CssClass="GridTable" runat="server"  DataKeyNames="ReportPath" AutoGenerateColumns="false"
                 onselectedindexchanged="grdReports_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" ReadOnly="True" ItemStyle-Width="20" />
                    <asp:ButtonField CommandName="Select" DataTextField="ReportDesc" HeaderText="Report" ItemStyle-Width="200" SortExpression="ReportDesc" />                   
                </Columns> 
        </asp:GridView>
    </fieldset>
     
<div>
</div>
</asp:Content>
