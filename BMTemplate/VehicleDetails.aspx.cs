using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BMTemplate.Repositories;

namespace BMTemplate
{
    public partial class VehicleDetails : BasePage
    {

        VehicleRepository m_Repository = new VehicleRepository();

        public string AuditTrail
        {
            get
            {
                if (this.ViewState["AuditTrail"] == null)
                {
                    return string.Empty;
                }

                return this.ViewState["AuditTrail"].ToString();
            }
            set
            {
                this.ViewState["AuditTrail"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                LoadDataforDropDowns();

                // Load predefined data automatically 
                if (!string.IsNullOrEmpty(this.RedirectId))
                {

                    LoadVehicle(this.RedirectId);
                    Vehicledialog.InnerHtml = "Update Vehicle Details";
                    btnSave.Text = "Update";

                    this.Mode = OperationMode.Update;

                }
                else
                {
                    this.AuditTrail = "[]";
                    this.Mode = OperationMode.Add;
                }


            }

            Regnum.Enabled = this.Mode == OperationMode.Add;

            var user = new UserRepository().GetUser(CurrentUser.GetUserName());
            var OfficeTypeId = user.Office.OfficeTypeId;
                       
            if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.SYSTEM_ADMIN) && (OfficeTypeId == (int)Enums.OfficeTypes.HEADOFFICE) == true)
            {
                Regnum.Enabled = true;
            }

        }

        private void LoadDataforDropDowns()
        {

            VehclmakeDrpdown.DataSource = m_Repository.GetVehicleMake();
            VehclmakeDrpdown.DataBind();

            Supplytypedrp.DataSource = m_Repository.GetSupplyTypes();
            Supplytypedrp.DataBind();


            VehicleTypedrp.DataSource = m_Repository.GetVehicleTypes();
            VehicleTypedrp.DataBind();

            FueulTypetxb1.DataSource = m_Repository.GetVehicleFuelTypes();
            FueulTypetxb1.DataBind();

            cboEngineCapacity.DataSource = new VehicleRepository().GetVehicleEngineCapacity();
            cboEngineCapacity.DataBind();

            cboStatus.DataSource = new StatusRepository().GetAll();
            cboStatus.DataBind();
        }


        private void LoadVehicle(string reg)
        {
            // Fetch Data Please  
            var vehicle = m_Repository.GetVehicle(reg);

            if (vehicle != null)
            {
                
                Regnum.Text = vehicle.RegistrationNumber.ToString();
                VINnum.Text = vehicle.VINNumber.ToString();
                ServiceIntrevaltxb.Text = vehicle.ServiceInterval.ToString();
             
                VehclmakeDrpdown.SelectedValue = vehicle.VehicleModel.VehicleMakeId.ToString();

                this.LoadVehModels();

                this.Vehclmodeldrd.SelectedValue = vehicle.VehicleModelId.ToString();
                this.Supplytypedrp.SelectedValue = vehicle.SupplyTypeId.ToString();
                this.FueulTypetxb1.SelectedValue = vehicle.FuelTypeId.ToString();
                this.VehicleTypedrp.SelectedValue = vehicle.VehicleTypeId.ToString();
                this.cboEngineCapacity.SelectedValue = vehicle.EngineCapacityId.ToString();
                this.Odlastlastservictxb.Text = vehicle.LastServiceOdoMeter.ToString();
                this.txtCurrentOdo.Text = vehicle.CurrentOdoMeter.ToString();
                this.Vhclconditiontxb.Text = vehicle.VehicleCondition.ToString();
                Modelyrtxb.Text = vehicle.VehicleYear.ToString();
                DiskRenewalDtetxb.Text = vehicle.DiscRenewalDate.ToString(this.DateFormat);
               
                this.cboStatus.SelectedValue = vehicle.StatusId.ToString();
                this.AuditTrail = m_Repository.GetVehicleHistory(vehicle);
            }

        }

        private void SaveVehicles()
        {

            if (!Page.IsValid)
            {
                return;
            }

            var DiskRenewDate = DateTime.ParseExact(DiskRenewalDtetxb.Text, this.DateFormat, null);
            var Date_Received = DateTime.ParseExact(DateReceivedtxb.Text, this.DateFormat, null);
            var Date_Returned = DateTime.ParseExact(DteReturnedtxb.Text, this.DateFormat, null);

            int serviceInterval;
            if (int.TryParse(ServiceIntrevaltxb.Text, out serviceInterval) == false)
            {
                serviceInterval = 0;
            }

            int startOddo;

            if (int.TryParse(StarOddoreadtxb.Text, out startOddo) == false)
            {
                startOddo = 0;
            }

            int oddoLastService;

            if(int.TryParse(Odlastlastservictxb.Text, out oddoLastService) == false){
                oddoLastService = 0;
            }

            string condition = Vhclconditiontxb.Text;
            string capturedte = System.DateTime.Today.ToString();

            int supplytypeId = 0;
            int fueulTypeId = 0;
            int vehicleType = 0;
            int vehMakeId = 0;
            int vehModeId = 0;
            int engineCapacity = 0;
            int statusId = 0;
            int VehicleIDD = 0;

            if (Supplytypedrp.SelectedIndex >= 0)
                supplytypeId = Convert.ToInt32(Supplytypedrp.SelectedValue);

            if (FueulTypetxb1.SelectedIndex >= 0)
                fueulTypeId = Convert.ToInt32(FueulTypetxb1.SelectedValue);

            if (VehicleTypedrp.SelectedIndex >= 0)
                vehicleType = Convert.ToInt32(VehicleTypedrp.SelectedValue);

            if (VehclmakeDrpdown.SelectedIndex >= 0)
                vehMakeId = Convert.ToInt32(VehclmakeDrpdown.SelectedValue);

            if (Vehclmodeldrd.SelectedIndex >= 0)
                vehModeId = Convert.ToInt32(Vehclmodeldrd.SelectedValue);

            if (cboEngineCapacity.SelectedIndex >= 0)
                engineCapacity = Convert.ToInt32(cboEngineCapacity.SelectedValue);
            if (cboStatus.SelectedIndex >= 0)
                statusId = Convert.ToInt32(cboStatus.SelectedValue);

            var user = new UserRepository().GetUser(this.UserName);
            int OfficeID = user?.OfficeId ?? 0;
            
            Vehicle Vmsvehicle = new Vehicle()
            {
               VehicleId= VehicleIDD,
                RegistrationNumber = Regnum.Text,
                VehicleModelId = vehModeId,
                 VINNumber = VINnum.Text,
                VehicleYear = Modelyrtxb.Text,
                EngineCapacityId = engineCapacity,
                DiscRenewalDate = DiskRenewDate,             
                VehicleCondition = condition,
                ServiceInterval = serviceInterval,
                StatusId = statusId,
                SupplyTypeId = supplytypeId,
                FuelTypeId = fueulTypeId,
                VehicleTypeId = vehicleType,
                LastServiceOdoMeter = oddoLastService

        };

            if (this.Mode == OperationMode.Add)
            {

                Vmsvehicle.CurrentOdoMeter = Vmsvehicle.CurrentOdoMeter;
                this.InsertVehicle(Vmsvehicle, Regnum.Text);
                this.ClearFields();
            }
            else
            {
                this.UpdateVehicle(Vmsvehicle);
            }
        }

        private void InsertVehicle(Vehicle Vmsvehicle, string veh_reg_no)
        {
            if (m_Repository.VehicleExits(Vmsvehicle))
            {
                this.ShowMessage("Registration number already Exists");
            }
            else
            {
                this.m_Repository.AddVehicle(Vmsvehicle);
                this.ShowMessage(Messages.RECORD_INSERTED_SUCESSFULLY);
            }

        }

        private void ClearFields()
        {
            Regnum.Text = string.Empty;
            VINnum.Text = string.Empty;
            Modelyrtxb.Text = string.Empty;
            ServiceIntrevaltxb.Text = string.Empty;
            StarOddoreadtxb.Text = string.Empty;
            Vhclconditiontxb.Text = string.Empty;
            DateReceivedtxb.Text = string.Empty;
            DateReceivedtxb.Text = string.Empty;
            DiskRenewalDtetxb.Text = string.Empty;
            VehicleTypedrp.SelectedIndex = -1;
            VehclmakeDrpdown.SelectedIndex = -1;
            Supplytypedrp.SelectedIndex = -1;
            Vehclmodeldrd.SelectedItem.Text = string.Empty;
            Odlastlastservictxb.Text = string.Empty;
            cboEngineCapacity.SelectedIndex = -1;
            FueulTypetxb1.SelectedIndex = -1;
            DteReturnedtxb.Text = string.Empty;

        }

        private void UpdateVehicle(Vehicle veh)
        {
               if (this.m_Repository.UpdateVehicle(veh))
                //var vehicle = m_Repository.GetVehicle(reg);
            {
                ShowAlertAndNavigate("Record updated successfully", "'VehiclesUpdateList.aspx'");
            }
            else
            {
                ShowMessage("Record not updated successfully");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveVehicles();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void VehclmakeDrpdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.LoadVehModels();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private void LoadVehModels()
        {
            if (this.VehclmakeDrpdown.SelectedIndex >= 0)
            {
                Vehclmodeldrd.DataSource = m_Repository.GetVehicleModels(Convert.ToInt32(VehclmakeDrpdown.SelectedValue));
                Vehclmodeldrd.DataBind();
            }
            else
            {
                Vehclmodeldrd.DataSource = null;
                Vehclmodeldrd.DataBind();
            }
            Vehclmodeldrd.Items.Insert(0, new ListItem("Select", "0"));
        }

    }
}