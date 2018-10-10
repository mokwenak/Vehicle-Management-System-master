using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BMTemplate.Repositories;
using System.Collections;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class TripAuthorisation : BasePage
    {
        private TripRepository m_Repository = new TripRepository();

        public long TripId
        {
            get

            {
                if (ViewState["TripId"] == null)
                {
                    return 0;
                }

                return Convert.ToInt64(ViewState["TripId"]);
            }
            set
            {
                ViewState["TripId"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;

            if (!IsPostBack)
            {
                cboVehiclesType.DataSource = new VehicleRepository().GetVehicleTypes();
                cboVehiclesType.DataBind();

                LoadDrivers(this.GetAllDrivers());
                //LoadRESPCODES(new VehicleRepository().GetAllResponsibilies());
                if (string.IsNullOrEmpty(this.RedirectId))
                {
                    this.Mode = OperationMode.Add;

                    this._tripDate.Text = this.Today.ToString(this.DateFormat);
                    this.returnDate.Text = this.Today.ToString(this.DateFormat);

                 //   GetVehiclesAvailable(this.TripId, this.Today, this.Today);
                }
                else
                {
                    long tripId;

                    if (!long.TryParse(this.RedirectId, out tripId))
                    {
                        this.RedirectPage(Pages.TRIP_CLOSURE);
                        return;
                    }

                    this.TripId = tripId;
                    this.Mode = OperationMode.Update;

                    Trip trip = m_Repository.GetTrip(tripId);

                    if (trip == null || !string.IsNullOrEmpty(trip.PostInspector))
                    {
                        this.RedirectPage(Pages.TRIP_CLOSURE);
                        return;
                    }
                   // GetVehiclesAvailable(tripId, trip.TripDate, trip.EstimatedReturnDate);

                    this._tripDate.Text = trip.TripDate.ToString(this.DateFormat);
                    this.returnDate.Text = trip.EstimatedReturnDate.ToString(this.DateFormat);
                    //VehiclesDD.SelectedValue = trip.VehicleId.ToString();
                    //VehiclesDD.SelectedValue = trip.VehicleId.ToString();
                    //driverDD.SelectedValue = trip.DriverId.ToString();
                    //RESPCdeDD.SelectedValue = trip.ResponsibilityId.ToString();
                    //ODDOMeter.Text = trip.StartOdoMeter.ToString();
                    ProJTxt.Text = trip.ProjectName;
                    tripDescpText.Text = trip.TripDescription;
                    //authBy.Text = trip.AuthirisedBy;
                    //inspectorTxt.Text = trip.PreInspector;
                    //preTripInspect.Text = trip.PreInspectionComments;
                    startPoint.Text = trip.StartPoint;
                    destination.Text = trip.EndPoint;

                    if (trip.CoDriverId != null)
                    {
                        coDriverDD.SelectedValue = trip.CoDriverId.ToString();
                    }
                    //VehicleDetails(trip.VehicleId);
                    //txtBoxBnkCard.Text = trip.GarageCard?.CardNumber ?? string.Empty;

                }
            }
        }

       
        private List<object> GetAllDrivers()
        {
            List<Driver> drivers = new DriverRepository().GetAllDrivers();
                
            return drivers.Select<Driver, object>(new Func<Driver, object>((d) => new { d.DriverId, DriverText = string.Format("{0} {1}, {2}, {3}", d.FirstName, d.Surname, d.Status.StatusName, d.LicenseExpiryDate.CompareTo(DateTime.Today) >= 0 ? "Valid License" : "Expired License") })).ToList();
         }

        private void LoadData(long tripId)
        {
            //var trip = m_Repository.GetTrip(tripId);

            //if (trip != null)
            //{
            //    VehiclesDD.SelectedValue = trip.VehicleId.ToString();
            //    VehicleDetails(trip.VehicleId);
            //}
        }
      
        public void GetVehiclesAvailable(long tripId, DateTime tripDate, DateTime returnDate)
        {
            //string selected = string.Empty;

            //if(this.VehiclesDD.SelectedIndex > 0)
            //{
            //    selected = this.VehiclesDD.SelectedValue;
            //}

            //VehiclesDD.DataSource = new VehicleRepository().GetVehiclesAvailableForTrip(tripId, tripDate, returnDate);
            //VehiclesDD.DataBind();

            //if (!string.IsNullOrEmpty(selected))
            //{
            //    VehiclesDD.SelectedValue = selected;
            //}          
        }

        public void LoadDrivers(IList  drivers)
        { 
            driverDD.DataSource = drivers;
            driverDD.DataBind();

            coDriverDD.DataSource = drivers;
            coDriverDD.DataBind();

            coDriverDD.Items.Insert(0, "Select");
        }


        public void LoadRESPCODES(List<Responsibility> _codes)
        {
            //var data = _codes.Select<Responsibility, object>(new Func<Responsibility, object>((r) => new { r.ResponsibilityId, ResponsibilityText = string.Format("{0} --> {1}", r.ResponsibilityCode, r.ResponsibilityName) }));
            //RESPCdeDD.DataSource = data;
            //RESPCdeDD.DataBind();
        }

        protected void btn_SubmitTrip_Click(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsValid)
                {
                    return;
                }

                long _driverID = 0;
                long? CodriverID = null;
                long CardCID = 0;
                int RESPCodeID = 0;
                long vehicleId = 0;
                long vehicleTypeId = 0;

                if (cboVehiclesType.SelectedIndex > 0)
                {
                    vehicleTypeId = Convert.ToInt64(cboVehiclesType.SelectedValue);
                }

                //var card = new GarageCardRepository().GetCard(txtBoxBnkCard.Text);

                //if (card != null)
                //{
                //    CardCID = card.GarageCardId;
                //}

                if (driverDD.SelectedIndex > 0)
                {
                    _driverID = Convert.ToInt64(driverDD.SelectedValue);
                }

                if (coDriverDD.SelectedIndex > 0)
                {
                    CodriverID = Convert.ToInt64(coDriverDD.SelectedValue);
                }

                //if (RESPCdeDD.SelectedIndex > 0)
                //{
                //    RESPCodeID = Convert.ToInt32(RESPCdeDD.SelectedValue);
                //}

                long tripId = 0;

                if (this.Mode == OperationMode.Add)
                {
                    tripId = m_Repository.AddTrip(vehicleId, _driverID, CodriverID, tripDescpText.Text, ProJTxt.Text, DateTime.ParseExact(_tripDate.Text, "dd/MM/yyyy", null), DateTime.ParseExact(returnDate.Text, "dd/MM/yyyy", null), this.UserName, startPoint.Text, destination.Text, vehicleTypeId);

                    string body = string.Format("Dear {0} \r\n\r\nThere is a trip authorisation waiting to your approval. Kindly logon to vehicle management system to authorise the trip. \r\n\r\nRegards", this.ManagerName);

                   var success = new EmailRepository().SendEmail(this.ManagerAddress, this.ManagerName, "Trip request for authorisation", body);
                }
                else
                {

                    if (!long.TryParse(this.RedirectId, out tripId))
                    {
                        this.RedirectPage(Pages.TRIP_CLOSURE);
                        return;
                    }
                    m_Repository.UpdateTrip(tripId, vehicleId, _driverID, CodriverID, tripDescpText.Text, ProJTxt.Text, DateTime.ParseExact(_tripDate.Text, "dd/MM/yyyy", null), DateTime.ParseExact(returnDate.Text, "dd/MM/yyyy", null), this.UserName, startPoint.Text, destination.Text, vehicleTypeId);

                }
                this.RedirectPage(Pages.TRIP_PASSENGERS, tripId.ToString());
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }

       
        private void VehicleDetails(long vehId)
        {
            //    VehModelTxt.Text = string.Empty;
            //    VEH_Make.Text = string.Empty;
            //    ODDOMeter.Text = string.Empty;

            //if (vehId > 0)
            //{
            //    var vehicle = new VehicleRepository().GetVehicle(vehId);

            //    if (vehicle != null)
            //    {
            //        VehModelTxt.Text = vehicle.VehicleModel.VehicleModelName;
            //        VEH_Make.Text = vehicle.VehicleModel.VehicleMake.VehicleMakeName;
            //        ODDOMeter.Text = vehicle.CurrentOdoMeter.ToString();

            //        var card = new GarageCardRepository().GetCardByVehicleId(vehId);

            //        txtBoxBnkCard.Text = card?.CardNumber ?? string.Empty;

            //        this.ServiceWarning(vehicle.VehicleId);
            //    }
            //}
        }

        protected void driverDD_SelectedIndexChanged(object sender, EventArgs e)
        {

            var selectedValue = coDriverDD.SelectedValue;

            coDriverDD.DataSource = this.GetAllDrivers();
            coDriverDD.DataBind();
            coDriverDD.Items.Insert(0, "Select");

            if (driverDD.SelectedIndex > 0)
            {
                coDriverDD.Items.RemoveAt(driverDD.SelectedIndex);
            }

            if (coDriverDD.SelectedIndex > 0)
            {
                if (!driverDD.SelectedValue.Equals(coDriverDD.SelectedValue))
                {
                    coDriverDD.SelectedValue = selectedValue;
                }
            }
        }

        protected void _tripDate_TextChanged(object sender, EventArgs e)
        {
            try
            {
                DateTime tripDate = DateTime.ParseExact(this._tripDate.Text, this.DateFormat, null);
                DateTime returnDt = DateTime.ParseExact(this.returnDate.Text, this.DateFormat, null);

                GetVehiclesAvailable(this.TripId, tripDate, returnDt);
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}