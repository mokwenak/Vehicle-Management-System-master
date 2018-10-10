using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Data;
using System.Data.Entity;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Collections;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class DriversDeleteList : BasePage
    {

        DriverRepository m_Repository = new DriverRepository();
        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                this.SeachDrivers();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private void SeachDrivers()
        {
            string selectedItem = cboSearchOptions.SelectedValue.ToString();
            string searchtxt = txtSearch.Text.ToString();

            IList drivers = null;

            if (selectedItem == SelectedValues.ONE)
            {
                drivers = m_Repository.GetSummaryByIdNumber(searchtxt, STATUS.ACTIVE);
            }
            else if (selectedItem == SelectedValues.TWO)
            {
                drivers = m_Repository.GetSummaryByPersal(searchtxt, STATUS.ACTIVE);
            }
            else if (selectedItem == SelectedValues.THREE)
            {
                drivers = m_Repository.GetSummaryBySurname(searchtxt, STATUS.ACTIVE);
            }
            else if (selectedItem == SelectedValues.ZERO)
            {
                messageLbl.Text = Messages.SELECT_SEARCH_CRITERIA;
            }

            if (drivers != null)
            {
                if (drivers.Count > 0)
                {
                    grdDrivers.DataSource = drivers;
                    grdDrivers.DataBind();
                    messageLbl.Text = string.Empty;

                }
                else
                {
                    grdDrivers.DataSource = drivers;
                    grdDrivers.DataBind();
                    messageLbl.Text = Messages.RECORD_DOES_NOT_EXIST;
                }
            }
        }

        protected void grdDrivers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                SeachDrivers();

                grdDrivers.PageIndex = e.NewPageIndex;

                grdDrivers.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void grdDrivers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                string driverIdNo = grdDrivers.DataKeys[e.RowIndex].Value.ToString();
                if (m_Repository.DriversDeleteList(driverIdNo))
                {
                    this.SeachDrivers();

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
    }
}