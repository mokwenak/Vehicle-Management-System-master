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
    public partial class VehicleMaintsUpdateList : BasePage
    {

        private MaintananceRepository m_Repository = new MaintananceRepository();
        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                this.LoadMaintananceData();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private void LoadMaintananceData()
        {

            if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.ONE))
            {
                this.VehicleMaintananceGridView.DataSource = m_Repository.SearchRegno(this.txtSearch.Text);
                this.VehicleMaintananceGridView.DataBind();
            }
            else if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.TWO))
            {
                this.VehicleMaintananceGridView.DataSource = m_Repository.SearchMaintId(this.txtSearch.Text);
                this.VehicleMaintananceGridView.DataBind();
            }

            if (this.cbocboSerachOptions.SelectedIndex < 1)
            {
                lblNoData.Text = Messages.SELECT_SEARCH_CRITERIA;
            }
            else
            if (this.VehicleMaintananceGridView.Rows.Count == 0)
            {
                lblNoData.Text = Messages.RECORD_DOES_NOT_EXIST;
            }
            else
            {
                lblNoData.Text = string.Empty;
            }
        }

        protected void VehicleMaintananceGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                LoadMaintananceData();
                VehicleMaintananceGridView.PageIndex = e.NewPageIndex;
                VehicleMaintananceGridView.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void VehicleMaintananceGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.VEHICLE_MAINT_DETAILS, Convert.ToString(VehicleMaintananceGridView.SelectedValue));
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}