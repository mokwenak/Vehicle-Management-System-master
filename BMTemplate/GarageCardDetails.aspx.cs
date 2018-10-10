using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BMTemplate.Repositories;
using System.Windows.Forms;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class CaptureGarageCard1 : BasePage
    {

        private GarageCardRepository m_Repository = new GarageCardRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadDataforDropDowns();

                if (!string.IsNullOrEmpty(this.RedirectId))
                {
                    LoadCard(this.RedirectId);

                    Vehicledialog.InnerText = "Update Garage Card";
                    btnSave.Text = "Update";

                    this.Mode = OperationMode.Update;
                    this.CardNumber.Enabled = false;
                }
                else
                {
                    this.Mode = OperationMode.Add;
                }
                var user = new UserRepository().GetUser(CurrentUser.GetUserName());
                var OfficeTypeId = user.Office.OfficeTypeId;

                if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.SYSTEM_ADMIN) && (OfficeTypeId == (int)Enums.OfficeTypes.HEADOFFICE) == true)
                {
                    CardNumber.Enabled = true;
                }

            }
        }

        // Load Bank Info 
        private void LoadDataforDropDowns()
        {
            cboBankname.DataSource = new BankRepository().GetBanks();
            cboBankname.DataBind();

            cboVehicleRegno.DataSource = new VehicleRepository().GetVehicles();
            cboVehicleRegno.DataBind();
        }

        // Load Card Info 
        private void LoadCard(string cardNo)
        {
            var card = this.m_Repository.GetCard(cardNo);

            if (card != null)
            {
                this.CardNumber.Text = card.CardNumber;
                this.cboBankname.SelectedValue = Convert.ToString(card.BankId);
                this.cboVehicleRegno.SelectedValue = Convert.ToString(card.VehicleId);
                this.CardReceivedDatetxb.Text = card?.ReceivedDate.ToString(this.DateFormat) ?? string.Empty;
                this.CardReturnedDate.Text = card?.ReturnDate.ToString(this.DateFormat) ?? string.Empty;
                this.txtExpiryDate.Text = card?.ExpireDate.ToString(this.DateFormat) ?? string.Empty;
            }
        }

        private void ClearFields()
        {
            this.cboBankname.SelectedIndex = -1;
            this.CardNumber.Text = string.Empty;
            this.CardReceivedDatetxb.Text = string.Empty;
            this.CardReturnedDate.Text = string.Empty;
            this.txtExpiryDate.Text = string.Empty;
            this.cboVehicleRegno.SelectedIndex = -1;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    return;
                }
                
                string userId = Membership.GetUser().UserName.ToString();
                int bankId = Convert.ToInt32(this.cboBankname.SelectedValue);
                DateTime expireDate = DateTime.ParseExact(this.txtExpiryDate.Text, this.DateFormat, null);
                DateTime receivedDate = DateTime.ParseExact(this.CardReceivedDatetxb.Text, this.DateFormat, null);
                DateTime returnDate = DateTime.ParseExact(this.CardReturnedDate.Text, this.DateFormat, null);
                long vehicleId = Convert.ToInt64(cboVehicleRegno.SelectedValue.ToString());

                if (this.Mode == OperationMode.Add)
                {
                    var result = m_Repository.AddCard(this.CardNumber.Text, bankId, expireDate, receivedDate, returnDate, userId, vehicleId);

                    if (result == AddResult.Duplicate)
                    {
                        ShowMessage(Messages.RECORD_ALREADY_EXISTS);
                    }
                    else
                    {
                        this.ShowMessage(Messages.RECORD_INSERTED_SUCESSFULLY);
                        this.ClearFields();
                    }
                }
                else
                {
                    m_Repository.UpdateCard(this.CardNumber.Text, bankId, expireDate, receivedDate, returnDate, userId, vehicleId);
                    ShowAlertAndNavigate(Messages.RECORD_UPDATED_SUCESSFULLY, Pages.GARAGE_CARDS_UPDATE_LIST);
                }
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}