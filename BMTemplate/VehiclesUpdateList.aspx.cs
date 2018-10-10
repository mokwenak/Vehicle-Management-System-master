using BMTemplate.Enums;
using BMTemplate.Repositories;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BMTemplate
{
    public partial class VehiclesUpdateList : BasePage
    {

        protected void grdVehicles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                SearchVehicles();

                grdVehicles.PageIndex = e.NewPageIndex;

                grdVehicles.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private void SearchVehicles()
        {
            string SelectedItem = cboSerachOptions.SelectedValue.ToString();
            string searchText = txtSearch.Text.ToString();

            if (searchText != null)
            {
                IList vehicles = null;

                if (SelectedItem == SelectedValues.ONE)
                {
                    vehicles = new VehicleRepository().GetVehiclesByVehRegNo(searchText);
                }
                else if (SelectedItem == SelectedValues.TWO)
                {
                    vehicles = new VehicleRepository().GetVehiclesByVinNo(searchText);
                }

                if (vehicles == null)
                {

                    lblMessage.Text = Messages.SELECT_SEARCH_CRITERIA;
                }
                else if (vehicles.Count > 0)
                {
                    grdVehicles.DataSource = vehicles;
                    grdVehicles.DataBind();
                    lblMessage.Text = string.Empty;
                }
                else
                {
                    grdVehicles.DataSource = vehicles;
                    grdVehicles.DataBind();
                    lblMessage.Text = Messages.RECORD_DOES_NOT_EXIST;

                }
            }
        }

        protected void grdVehicles_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.VEHICLE_DETAILS, grdVehicles.SelectedValue.ToString());
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                SearchVehicles();

            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}