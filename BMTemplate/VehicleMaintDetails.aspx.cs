using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using System.Web.Security;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class VehicleMaintDetails : BasePage
    {
        
        private MaintananceRepository m_Repository = new MaintananceRepository();

        public long MaintId
        {
            get
            {
                if(ViewState["MaintId"] == null)
                {
                    return 0;
                }

                return Convert.ToInt64(ViewState["MaintId"]);
            }
            set
            {
                ViewState["MaintId"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                LoadDataforDropDowns();
                if (string.IsNullOrEmpty(this.RedirectId))
                {
                    this.Mode = OperationMode.Add;
                }
                else
                {
                    long id;

                    if (!long.TryParse(this.RedirectId, out id))
                    {
                        this.RedirectPage(Pages.TRIP_AUTHORISATION);
                        return;
                    }

                    this.MaintId = id;
                    this.loadMaintanancedata(id);

                    this.Mode = OperationMode.Update;

                    btnSave.Text = "Update";
                    Vehicledialog.InnerText = "UPDATE MAINTANANCE";
                }
            }
        }
        
        private void LoadDataforDropDowns()
        {
            cboVehicleRegno.DataSource = new VehicleRepository().GetVehicles();
            cboVehicleRegno.DataBind();

            cboServiceType.DataSource = new VehicleRepository().GetSeriveType();
            cboServiceType.DataBind();

        }
        private void ClearFields()
        {
          this.cboVehicleRegno.SelectedIndex = -1;
          this.txbKilometers.Text = string.Empty;
          this.txtServiceDate.Text = string.Empty;
          this.Comments.Text = string.Empty;
          this.cboServiceType.SelectedIndex = -1;
        }

        private void loadMaintanancedata(long id)
        {
           
            var maintanace  = this.m_Repository.GetVehicleMaintananceID(id);

            if (maintanace != null)
            {
                this.cboVehicleRegno.SelectedValue = maintanace.VehicleId.ToString();
                if (maintanace.ServiceDate != null)
                {
                    this.txtServiceDate.Text = maintanace.ServiceDate.ToString(this.DateFormat);
                }

                this.txbKilometers.Text = maintanace.OdoMeter.ToString();
                this.Comments.Text = maintanace.Comments;
                this.cboServiceType.SelectedValue = maintanace.ServiceTypeId.ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            long vehicleId = 0;
            if (this.cboVehicleRegno.SelectedItem != null) {
                vehicleId = Convert.ToInt64(this.cboVehicleRegno.SelectedValue);
            }

            int servicetype =0;
            if (this.cboServiceType.SelectedItem != null)
            {
                servicetype = Convert.ToInt32(this.cboServiceType.SelectedValue);
            }

            string comments= this.Comments.Text;
            int Kilometers = 0;

            if (int.TryParse(this.txbKilometers.Text, out Kilometers) == false)
            {
                this.ShowMessage(Messages.ODO_METER_INVALID);
                return;
            }

            DateTime ServiceDate = DateTime.ParseExact(this.txtServiceDate.Text,this.DateFormat,null);


            if (this.Mode == OperationMode.Add)
            {
                if (m_Repository.AddMaintanance(vehicleId, servicetype, ServiceDate, Kilometers, comments))
                {
                    this.ShowMessage(Messages.RECORD_INSERTED_SUCESSFULLY);
                    this.ClearFields();
                }
                else
                {
                    this.ShowMessage(Messages.RECORD_UPDATED_NOT_SUCESSFULLY);
                }
            }
            else
            {
                if (m_Repository.UpdateVehicleMaintanance(MaintId, vehicleId, servicetype, ServiceDate, Kilometers, comments))
                {
                    ShowAlertAndNavigate(Messages.RECORD_UPDATED_SUCESSFULLY, Pages.VEHICLE_MAINTS_UPDATE_LIST);
                }
                else
                {
                    this.ShowMessage(Messages.RECORD_UPDATED_NOT_SUCESSFULLY);
                }
            }
        }
    }
}



       
       
    

       

        