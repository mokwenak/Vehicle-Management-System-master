using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class TripsHistory : BasePage
    {

        TripRepository m_Repository = new TripRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                 
            }
        }

        protected void grdTrips_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.RedirectPage(Pages.TRIP_HISTORY_DETAILS, grdTrips.SelectedValue.ToString());
        }
        private void BindGrid()
        {
            grdTrips.DataSource = m_Repository.AllClosedTrips().Select<Trip, object>(new Func<Trip, object>(t => new { ShortTripDesc = t.TripDescription.PadRight(50).Substring(0, 50), t.TripId, t.TripDate, t.Vehicle.RegistrationNumber, t.ProjectName })).ToList();
            grdTrips.DataBind();
        }
        protected void grdTrips_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.grdTrips.PageIndex = e.NewPageIndex;
            BindGrid();
        }

    }
}