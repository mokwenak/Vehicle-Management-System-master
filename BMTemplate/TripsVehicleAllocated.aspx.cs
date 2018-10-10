using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
namespace BMTemplate
{
    public partial class TripsVehicleAllocated : BasePage
    {

        private TripRepository m_Repository = new TripRepository();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadAvailableVehicles();
            }
        }

        private void loadAvailableVehicles()
        {
            this.gridTrips.DataSource = m_Repository.GetOpenTrips()
                                    .OrderBy(a => a.Vehicle.RegistrationNumber)
                                    .Select<Trip, object>(new Func<Trip, object>(t => new {
                                        t.TripId,
                                        t.TripDate,
                                        t.EstimatedReturnDate,
                                        TripDescription = t.TripDescription.PadRight(50).Substring(0, 50),
                                        t.Vehicle.RegistrationNumber,
                                        t.ProjectName,
                                        VehicleModelName = t.Vehicle.VehicleModel.VehicleModelName,
                                        VehicleMakeName = t.Vehicle.VehicleModel.VehicleMake.VehicleMakeName
                                    })).ToList();
            this.gridTrips.DataBind();   
    
        }
        protected void gridTrips_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                loadAvailableVehicles();
                gridTrips.PageIndex = e.NewPageIndex;
                gridTrips.DataBind();
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }
    
    }
        
}