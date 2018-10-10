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
    public partial class TripClosure : BasePage
    {

        private TripRepository m_Repository = new TripRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTrips();
            }
        }

        private void LoadTrips()
        {
            grdTrips.DataSource = m_Repository.GetOpenTrips()
                                    .OrderByDescending(a => a.TripId)
                                    .Select<Trip, object>(new Func<Trip, object>(t => new { t.TripId, t.TripDate, t.EstimatedReturnDate,
                                                                                            SHORT_DESC = t.TripDescription.PadRight(50).Substring(0, 50),
                                                                                            t.Vehicle.RegistrationNumber, t.ProjectName })).ToList();
            grdTrips.DataBind();
        }

        protected void grdTrips_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.TRIP_LOGS, grdTrips.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void grdTrips_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("Re-Print"))
                {
                    this.RedirectPage(Pages.TRIP_AUTHORITY_SLIP, e.CommandArgument.ToString());
                }
                else
                if (e.CommandName.Equals("CloseTrip"))
                {
                    this.RedirectPage(Pages.TRIP_LOGS, e.CommandArgument.ToString());
                }
                else
                if (e.CommandName.Equals("EditTrip"))
                {
                    this.RedirectPage(Pages.TRIP_AUTHORISATION, e.CommandArgument.ToString());
                }
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void grdTrips_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                this.grdTrips.PageIndex = e.NewPageIndex;
                LoadTrips();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

    }
}