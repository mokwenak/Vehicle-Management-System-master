using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class DriverDetails : BasePage
    {
        private string GetDisabledDte = string.Empty;
        DriverRepository m_Repository = new DriverRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Protect the user from Copying a UrL and If that happens direct the user to Login Screen 
            string strPreviousPage = string.Empty;
            if (Request.UrlReferrer != null)
            {
                strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
            }
            if (strPreviousPage == string.Empty)
            {
                this.RedirectToLogin();
                return;
            }
            
            txtIdNumber.Attributes.Add("onkeydown", "return isNumeric(event.keyCode);");
            txtIdNumber.Attributes.Add("onpaste", "return false");
            txtIdNumber.Attributes.Add("onkeyup", "keyUP(event.keyCode)");

            if (!this.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this.RedirectId))
                {
                    this.Mode =  OperationMode.Update;
                    
                    cboStatus.DataSource = new StatusRepository().GetAll();
                    cboStatus.DataBind();

                    LoadDriver(this.RedirectId); 

                    HeaderControl.InnerHtml =  "Update Driver Details";

                    btnSave.Text = "Update";

                    this.cboStatus.Visible = true;
                    this.lblStatus.Visible = true;

                    var user = new UserRepository().GetUser(CurrentUser.GetUserName());
                    var OfficeTypeId = user.Office.OfficeTypeId;

                    if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.SYSTEM_ADMIN) && (OfficeTypeId == (int)Enums.OfficeTypes.HEADOFFICE) == true)
                    {
                        txtIdNumber.Enabled = true;

                    }

                }
                else
                {
                    this.Mode = OperationMode.Add;

                    this.cboStatus.Visible = false;
                    this.lblStatus.Visible = false;
                }
                
            }

        }

        private void LoadDriver(string id)
        {
            var driver = m_Repository.GetDriver(id);

            if (driver != null)
            {

                txtPersalNumber.Enabled = false;

                txtPersalNumber.Text = driver.EmployeeNumber.ToString();
                txtName.Text = driver.FirstName.ToString();
                txtInitials.Text = driver.Initials.ToString();
                txtCellNumber.Text = driver.CellNumber.ToString();
                txtEmergencyContact.Text = driver.EmergenceContactNo.ToString();
                txtEmergencyName.Text = driver.EmergenceName.ToString();
                txtIdNumber.Enabled = false;
                txtIdNumber.Text = driver.DriverIdNumber.ToString();
                txtLicenseRenewDate.Text = driver.LicenseExpiryDate.ToString(this.DateFormat);
                txtSurname.Text = driver.Surname.ToString();
                txtLicenseNumber.Text = driver.LicenseNumber.ToString();
                txtLicenseCode.Text = driver.LicenseCode.ToString().Trim();
                txtLicenseIssueDate.Text = driver.LicenseIssueDate.ToString(this.DateFormat);

                if (string.IsNullOrWhiteSpace(driver.PdpLicenseNumber))
                    cboDriverPDP.SelectedValue = SelectedValues.ZERO;
                else
                    cboDriverPDP.SelectedValue = SelectedValues.ONE;

                txtDriverPDPNumber.Text = driver.PdpLicenseNumber;
                if (driver.PdpLicenseDate != null)
                    txtDriverPDPIssueDate.Text = driver.PdpLicenseDate.Value.ToString(this.DateFormat);
                else
                    txtDriverPDPIssueDate.Text = string.Empty;

                cboStatus.SelectedValue = Convert.ToString(driver.StatusId);
            }
        }
       

        protected void btnSave_Click(object sender, EventArgs e)
        {
           try
            {

                int officeId =0;
                int statusId = (int)STATUS.ACTIVE; 

                // Get The Office Id of the user who currently logged in 
                var currentUser = new UserRepository().GetUser(this.UserName);

                if (currentUser != null)
                {
                    officeId = (int)currentUser.OfficeId;
                }
                
                var issuedte = DateTime.ParseExact(txtLicenseIssueDate.Text, this.DateFormat, null);
                var Renewedate = DateTime.ParseExact(txtLicenseRenewDate.Text, this.DateFormat, null);


                DateTime? driverPDPIssueDate = null;
                if (!string.IsNullOrEmpty(txtDriverPDPIssueDate.Text))
                {
                    driverPDPIssueDate = DateTime.ParseExact(txtDriverPDPIssueDate.Text, this.DateFormat, null);
                }

                if(cboStatus.SelectedIndex > 0)
                {
                    statusId = Convert.ToInt32(cboStatus.SelectedValue);
                }

                Driver DriverDTls = new Driver()
                {
                    DriverIdNumber = txtIdNumber.Text,
                    EmployeeNumber = txtPersalNumber.Text,
                    FirstName = txtName.Text,
                    Surname = txtSurname.Text,
                    Initials = txtInitials.Text,
                    CellNumber = txtCellNumber.Text,
                    EmergenceContactNo = txtEmergencyContact.Text,
                    EmergenceName = txtEmergencyName.Text,
                    LicenseNumber = txtLicenseNumber.Text,
                    LicenseCode = txtLicenseCode.Text,
                    LicenseIssueDate = issuedte,
                    LicenseExpiryDate = Renewedate,
                    PdpLicenseNumber = txtDriverPDPNumber.Text,
                    PdpLicenseDate = driverPDPIssueDate,
                    OfficeId = officeId,
                    StatusId = statusId
                };


                if (this.Mode == OperationMode.Update)
                {
                    this.UpdateDrivers(DriverDTls);
                }
                else
                {
                    if (this.InsertDrivers(DriverDTls))
                    {
                        // clear all of the Textboxes
                        txtPersalNumber.Text = string.Empty;
                        txtInitials.Text = string.Empty;
                        txtName.Text = string.Empty;
                        txtSurname.Text = string.Empty;
                        txtCellNumber.Text = string.Empty;
                        txtEmergencyContact.Text = string.Empty;
                        txtEmergencyName.Text = string.Empty;
                        txtIdNumber.Text = string.Empty;
                        txtLicenseNumber.Text = string.Empty;
                        txtLicenseCode.Text = string.Empty;
                        txtLicenseIssueDate.Text = string.Empty;
                        txtLicenseRenewDate.Text = string.Empty;
                        cboDriverPDP.SelectedIndex = -1;
                        txtLicenseIssueDate.Text = string.Empty;
                        txtLicenseRenewDate.Text = string.Empty;
                        txtDriverPDPIssueDate.Text = string.Empty;
                        txtDriverPDPNumber.Text = string.Empty;
                    }
                }

            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private bool InsertDrivers(Driver newDriver)
        {
            if (m_Repository.DriveExists(newDriver))
            {
                this.ShowMessage(Messages.PERSAL_ID_ALREADY_EXISTS);

                return false;
            }
            else
            {
                m_Repository.AddDriver(newDriver);

                ShowMessage(Messages.RECORD_INSERTED_SUCESSFULLY);

                return true;
            }
        }
        private void UpdateDrivers(Driver DriverDTls)
        {
            m_Repository.UpdateDriver(DriverDTls);
            
            ShowAlertAndNavigate(Messages.RECORD_UPDATED_SUCESSFULLY, Pages.DRIVERS_UPDATE_LIST);
        }

        protected void txtIdNumber_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}