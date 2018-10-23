using BMTemplate.Enums;
using BMTemplate.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BMTemplate
{
    public partial class Track : BasePage
    {
        private TripRepository m_Repository = new TripRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                var trips = m_Repository.GetOpenTrips((int)Workflows.Approved);

                if(trips.Count() > 0)
                {
                    cboTrips.DataSource = trips.Select(a => new { TripId = a.TripId, TripRef = string.Format("TRIP-{0}", a.TripId)  }).ToList();
                    cboTrips.DataBind();
                    cboTrips.Items.Insert(0, "Select");
                }

            }
        }

        protected void cboTrips_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboTrips.SelectedIndex > 0)
            {
                var trip = m_Repository.GetTrip(Convert.ToInt64(cboTrips.SelectedItem.Value));

                if (trip != null)
                {
                    txtProject.Text = trip.ProjectName;
                    txtStartPoint.Text = trip.StartPoint;
                    txtEndPoint.Text = trip.EndPoint;


                    var vehicle = new VehicleRepository().getAllVehiclesById(trip.VehicleId);

                    if (vehicle != null)
                    {
                        txtRegistration.Text = vehicle.RegistrationNumber;

                        var vehicleModel = new VehicleRepository().GetVehicleModelById(vehicle.VehicleModelId);

                        if (vehicleModel != null)
                        {
                            txtModel.Text = vehicleModel.VehicleModelName;

                        }
                    }
                    //}else
                    //{
                    //    txtProject.Text = string.Empty;
                    //    txtStartPoint.Text = string.Empty;
                    //    txtEndPoint.Text = string.Empty;
                    //    txtModel.Text = string.Empty;
                    //    txtRegistration.Text = string.Empty;
                    //}
                }
                else { 

                    txtProject.Text = string.Empty;
                    txtStartPoint.Text = string.Empty;
                    txtEndPoint.Text = string.Empty;
                    txtModel.Text = string.Empty;
                    txtRegistration.Text = string.Empty;
                }

            }
        }
    }
}