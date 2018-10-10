<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="BMTemplate.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        input.standardinput {
            width: 182px;
            height: 22px;
        }

        select.standardinput {
            width: 185px;
            height: 30px;
        }

        .labelcolumn {
            width: 100px;
        }

        .emptycolumn {
            width: 410px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 id="lblCreateUserHeader" class="PageTitle" runat="server" visible="false">New User</h3>
    <h3 id="lblUpdateUserHeader" class="PageTitle" runat="server" visible="false">Update User</h3>
    <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>User</legend>
        <table class="Normaltable">
            <tr>
                <td class="labelcolumn">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtUserName">User Name:</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="standardinput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" Display="Dynamic"
                        ControlToValidate="txtUserName" ErrorMessage="User Name is required." SetFocusOnError="true" 
                        ToolTip="User Name is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                         <asp:CustomValidator ID="valUsername" runat="server" ValidationGroup="CreateUserWizard1"
                            ControlToValidate ="txtUserName"  ForeColor ="Red" Display="Dynamic"
                            ErrorMessage="The user name has already been registered"  SetFocusOnError="true" 
                            ToolTip = "The user name has already been registered" 
                            OnServerValidate="valUsername_ServerValidate">*</asp:CustomValidator>
                         <asp:CustomValidator ID="valADUsername" runat="server" ValidationGroup="CreateUserWizard1"
                            ControlToValidate ="txtUserName"  ForeColor ="Red" Display="Dynamic"
                            ErrorMessage="he user does not exits in Active Directory" 
                            ToolTip = "The user does not exits in Active Directory"  SetFocusOnError="true" 
                            OnServerValidate="valADUsername_ServerValidate">*</asp:CustomValidator>
                </td>
                <td class="empytcolumn"></td>
                <td class="labelcolumn">
                    <asp:Label ID="lblPersal" runat="server" AssociatedControlID="txtPersal">Employee Number:</asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="txtPersal" runat="server" MaxLength="8" CssClass="standardinput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ControlToValidate="txtPersal" ErrorMessage="Employee Number is required."
                        ToolTip="Employee Number is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                  

                </td>
            </tr>
            <tr>
                <td class="labelcolumn">
                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="txtEmail">E-mail:</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" CssClass="standardinput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" Display="Dynamic" SetFocusOnError="true" 
                        ControlToValidate="txtEmail" ErrorMessage="E-mail is required."
                        ToolTip="E-mail is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="Dynamic"
                        ControlToValidate="txtEmail" ID="RegularExpressionValidator1" SetFocusOnError="true" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ForeColor="Red" ValidationGroup="CreateUserWizard1"
                        ErrorMessage="Email is invalid." ToolTip="Email is invalid.">*</asp:RegularExpressionValidator>
                </td>
                <td class="empytcolumn"></td>
                <td class="labelcolumn">
                    <asp:Label ID="DropDownStatuslbl" runat="server" AssociatedControlID="cboStatus">Status:</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cboStatus" runat="server"
                         DataTextField="StatusName" 
                        DataValueField="StatusId" CssClass="standardinput" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select "  Value="0"/>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="DropDownStatusRequired" runat="server"
                        ControlToValidate="cboStatus" ErrorMessage="Status is required." InitialValue="0"  SetFocusOnError="true" 
                        ToolTip="Status is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="labelcolumn">
                    <asp:Label ID="phonelbl" runat="server" AssociatedControlID="txtPhoneNo">Phone No.:</asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" CssClass="standardinput"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="quired" runat="server" Display="Dynamic"
                        ControlToValidate="txtPhoneNo" ErrorMessage="Phone no is required." SetFocusOnError="true" 
                        ToolTip="Phone no is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator Display="Dynamic"
                        ControlToValidate="txtPhoneNo" ID="RegularExpressionValidator3" SetFocusOnError="true" 
                        ValidationExpression="^[\s\S]{10,}$" runat="server" ForeColor="Red" ValidationGroup="CreateUserWizard1"
                        ErrorMessage="Phone is 10 characters required ">*</asp:RegularExpressionValidator>
                </td>
                <td class="empytcolumn"></td>
                <td class="labelcolumn">
                    <asp:Label ID="Officelbl" runat="server" AssociatedControlID="cboOffices">Office:</asp:Label>
                </td>
                <td>

                    <asp:DropDownList ID="cboOffices" runat="server"
                        DataTextField="OfficeName" DataValueField="OfficeId" CssClass="standardinput" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select "  Value="0"/>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="OfficeRequired" runat="server" InitialValue="0" 
                        ControlToValidate="cboOffices" ErrorMessage="Office is required." SetFocusOnError="true" 
                        ToolTip="Office is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                </td>
                <td class="empytcolumn"></td>
            </tr>
            <tr>
                <td class="labelcolumn">User Roles
                </td>
                <td>
                    <asp:RadioButtonList ID="rbtRoles" runat="server" RepeatDirection="Vertical" RepeatLayout="Table" CellPadding="0">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Button CssClass="Button" Height="34px" Width="101px" CausesValidation ="true"  ValidationGroup="CreateUserWizard1" ID="bntSave" runat="server" Text="Save" OnClick="bntSave_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </fieldset>
    <div id="validation_dialog" style="display: none;">
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" Width="332px"  ValidationGroup="CreateUserWizard1" />
    </div>


    <script type="text/javascript">
        var saveFlag = false;
        $(document).ready(function () {

            if ($("[id$=txtUserName]").val() == '')
                Page_ClientValidate(); 

            $("[id$=bntSave]").click(function () {
                saveFlag = true; 
            });

            $('[id$=IDNo],[id$=txtPersal], [id$=txtPhoneNo]').keydown(function (event) {
                if (!isNumeric(event.keyCode)) {
                    event.preventDefault();
                }
            });

            $('[id$=IDNo], [id$=txtPersal], [id$=txtPhoneNo]').bind("paste", function (e) {
                // access the clipboard using the api
                var pastedData = e.originalEvent.clipboardData.getData('text');
                if (!$.isNumeric(pastedData)) {
                    e.preventDefault();
                }
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
