using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class AccidentsAddList : BasePage
    {
        private TripRepository m_Repository = new TripRepository();

        protected void Search_clickbtn(object sender, ImageClickEventArgs e)
        {
            try
            {
                this.LoadTrips();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private void LoadTrips()
        {

            label.Text = string.Empty;
            List<object> list = null;

            if (this.cbocboSerachOptions.SelectedIndex < 1)
            {
                label.Text = Messages.SELECT_SEARCH_CRITERIA;
            }
            else if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.ONE))
            {
                list = m_Repository.SearchByRegNo(this.txtSearch.Text)
                      .Select<Trip, object>(new Func<Trip, object>(t => new { t.TripId, t.TripDate, TripDescription = t.TripDescription.PadRight(50).Substring(0, 50),string.Empty, t.ProjectName })).ToList();
            }
            //.Select<Trip, object>(new Func<Trip, object>( t => new { t.TripId, t.TripDate, TripDescription = t.TripDescription.PadRight(50).Substring(0, 50), t.Vehicle.RegistrationNumber, t.ProjectName })).ToList();
       
            else if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.TWO))
            {
                list = m_Repository.SearchByIdNumber(this.txtSearch.Text)
                                    .Select<Trip, object>(new Func<Trip, object>(t => new { t.TripId, t.TripDate, TripDescription = t.TripDescription.PadRight(50).Substring(0, 50), string.Empty , t.ProjectName })).ToList();
            }

            if (list != null && list.Count == 0)
            {
                label.Text = Messages.RECORD_DOES_NOT_EXIST;
            }

            this.grdTrips.DataSource = list;
            this.grdTrips.DataBind();
        }

        protected void grdTrips_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.ACCIDENT_DETAILS, grdTrips.SelectedValue.ToString());
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
                LoadTrips();

                grdTrips.PageIndex = e.NewPageIndex;

                grdTrips.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}