using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BMTemplate.Enums;
using System.Collections;
using BMTemplate.Repositories;

namespace BMTemplate
{
    public partial class VehiclesDeleteList : BasePage
    {

        VehicleRepository m_Repository = new VehicleRepository();
        private void SearchVehicles()
        {
            string SelectedItem = cboSerachOptions.SelectedValue.ToString();
            string searchText = txtSearch.Text.ToString();

            if (searchText != null)
            {
                IList vehicles = null;

                if (SelectedItem == SelectedValues.ONE)
                {
                    vehicles = m_Repository.GetVehiclesByVehRegNo(searchText, STATUS.ACTIVE);
                }
                else if (SelectedItem == SelectedValues.TWO)
                {
                    vehicles = new VehicleRepository().GetVehiclesByVinNo(searchText, STATUS.ACTIVE);
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

        protected void grdVehicles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                long vehicleId = Convert.ToInt64(grdVehicles.DataKeys[e.RowIndex].Value);
                if (m_Repository.DeleteVehicle(vehicleId))
                {
                    this.SearchVehicles();

                    this.ShowMessage(Messages.RECORD_DELETED_SUCESSFULLY);
                }
                else
                {
                    this.ShowMessage(Messages.RECORD_NOT_DELETED_SUCESSFULLY);
                }
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                this.SearchVehicles();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
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
    }
}