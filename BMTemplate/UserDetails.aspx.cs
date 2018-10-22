using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using FormsAuth;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class UserDetails : BasePage
    {
        private UserRepository repository = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                LoadLookups();

                if (string.IsNullOrEmpty(this.RedirectId))
                {
                    rbtRoles.SelectedIndex = 1;
                    this.Mode = OperationMode.Add;
                }
                else
                {
                    this.Mode = OperationMode.Update;

                    long userId;


                    if (long.TryParse(this.RedirectId, out userId))
                    {
                        this.LoadUser(userId);
                    }
                    else
                    {
                        RedirectPage(Pages.USERS_UPDATE_LIST);
                    }
                }
            }

            this.lblCreateUserHeader.Visible = this.Mode == OperationMode.Add;
            this.lblUpdateUserHeader.Visible = this.Mode == OperationMode.Update;
            this.txtUserName.ReadOnly = this.Mode == OperationMode.Update;
        }

        private void LoadLookups()
        {

            rbtRoles.Items.Clear();
            rbtRoles.DataSource = Roles.GetAllRoles();
            rbtRoles.DataBind();

            cboStatus.DataSource = new StatusRepository().GetAll();
            cboStatus.DataBind();

            var user = repository.GetUser(this.UserName);

            if (user != null)
            {
                if (user.Office.OfficeTypeId == (int)OfficeTypes.HEADOFFICE)
                {
                    cboOffices.DataSource = new OfficeRepository().GetOffices();
                }
                else
                {
                    cboOffices.DataSource = new OfficeRepository().GetOfficesByProv(user.Office.ProvinceId);
                }
                cboOffices.DataBind();
            }

        }

        private bool LoadUser(long userId)
        {
            var user = repository.GetUserById(userId);

            if(user == null)
            {
                return false;
            }

            txtUserName.Text = user.UserName;
            txtPersal.Text = user.EmployeeNumber;
            txtPhoneNo.Text = user.ContactNumber;
            txtEmail.Text = user.EmailAddress.Trim();
            cboOffices.SelectedValue = user.OfficeId.ToString();
            cboStatus.SelectedValue = user.StatusId.ToString();
            var userRoles = Roles.GetRolesForUser(user.UserName).ToList();

            if (userRoles.Count() > 0)
            {
                rbtRoles.SelectedValue = userRoles[0];
            }

            return true;
        }


        protected void valUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var result = Membership.FindUsersByName(txtUserName.Text);

            if (result != null && result.Count > 0 && Mode == OperationMode.Add)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        //protected void valADUsername_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    LdapAuthentication adAuth = new LdapAuthentication(ConfigurationManager.AppSettings["Statssa_adPath"].ToString());

        //    if (!adAuth.UserExists(txtUserName.Text) && Mode == OperationMode.Add)
        //    {
        //        args.IsValid = false;
        //    }
        //    else
        //    {
        //        args.IsValid = true;
        //    }
        //}



        protected void bntSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsValid)
                {
                    return;
                }


                var aspUser = Membership.GetUser(txtUserName.Text);

                if (aspUser == null)
                    
                {
                    string password = ConfigurationManager.AppSettings["ASP_Password"].ToString();
                    aspUser = Membership.CreateUser(txtUserName.Text, password, txtEmail.Text);
                }


                foreach (ListItem rbtRole in rbtRoles.Items)
                {
                    string newRole = rbtRole.Text;
                    var hasRole = Roles.IsUserInRole(txtUserName.Text, newRole);

                    if (hasRole == true && rbtRole.Selected == false)
                    {
                        Roles.RemoveUserFromRole(txtUserName.Text, newRole);
                    }//  End If
                    else
                    if (hasRole == false && rbtRole.Selected == true)
                    {

                        Roles.AddUserToRole(txtUserName.Text, newRole);
                    }
                }

                User user = repository.GetUser(txtUserName.Text);


                if (user == null)
                {
                    user = new User();

                    Guid userId = (Guid)aspUser.ProviderUserKey;
                    user.AspnetUserId = userId;
                }

                var officeId = Convert.ToInt32(cboOffices.SelectedValue);
                var statusId = Convert.ToInt32(cboStatus.SelectedValue);

                user.UserName = txtUserName.Text;
                user.StatusId = statusId;
                user.OfficeId = officeId;
                user.EmailAddress = txtEmail.Text;
                user.ContactNumber = txtPhoneNo.Text;
                user.EmployeeNumber = txtPersal.Text;

                if (OperationMode.Add == Mode)
                {
                    if (repository.AddUser(user))
                    {
                        this.ClearFields();
                        ShowMessage(Messages.RECORD_INSERTED_SUCESSFULLY);
                    }
                    else
                    {
                        ShowMessage(Messages.RECORD_INSERTED_NOT_SUCESSFULLY);
                    }

                }
                else if (OperationMode.Update == Mode)
                {
                    if (repository.UpdateUser(user))
                    {
                        ShowAlertAndNavigate(Messages.RECORD_UPDATED_SUCESSFULLY, Pages.USERS_UPDATE_LIST);
                    }
                    else
                    {
                        ShowMessage(Messages.RECORD_UPDATED_NOT_SUCESSFULLY);
                    }
                }
            }
            catch(MembershipCreateUserException ex)
            {
                this.HandleException(ex);
            }
        }

        private void ClearFields()
        {

            txtUserName.Text = string.Empty;
            txtPersal.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
            cboOffices.SelectedIndex = 0;
            cboStatus.SelectedIndex = 1;
        }
    }
}