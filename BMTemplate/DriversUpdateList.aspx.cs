using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class DriversUpdateList : BasePage
    {
        DriverRepository m_Repository = new DriverRepository();

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
        

        protected void grdDrivers_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.RedirectPage(Pages.DRIVER_DETAILS, grdDrivers.SelectedValue.ToString());
        }
 
        private void SeachDrivers()
        {
            string selectedItem = cboSearchOptions.SelectedValue.ToString();
            string searchtxt = txtSearch.Text.ToString();

            IList drivers = null;

            if (selectedItem == SelectedValues.ONE)
            {
                drivers = m_Repository.GetSummaryByIdNumber(searchtxt);
            }
            else if (selectedItem == SelectedValues.TWO)
            {
                drivers = m_Repository.GetSummaryByPersal(searchtxt);
            }
            else if (selectedItem == SelectedValues.THREE)
            {
                drivers = m_Repository.GetSummaryBySurname(searchtxt);
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

    }
}