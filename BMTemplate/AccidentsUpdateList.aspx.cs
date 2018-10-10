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
    public partial class AccidentsUpdateList : BasePage
    {

        AccidentRepository m_Repository = new AccidentRepository();

        private void LoadAccident()
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
                                    .Select<Accident, object>(new Func<Accident, object>(a => new { a.AccidentId, RegistrationNumber = a.Trip.Vehicle.RegistrationNumber, a.AccidentLocation, a.AccidentDescription, a.AccidentDate, a.CaseNumber})).ToList();
            }
            else if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.TWO))
            {
                list = m_Repository.SearchByIdNumber(this.txtSearch.Text)
                                    .Select<Accident, object>(new Func<Accident, object>(a => new { a.AccidentId, RegistrationNumber = a.Trip.Vehicle.RegistrationNumber, a.AccidentLocation, a.AccidentDescription, a.AccidentDate, a.CaseNumber })).ToList();
            }

            if (list != null && list.Count == 0)
            {
                label.Text = Messages.RECORD_DOES_NOT_EXIST;
            }

            this.grdAccidents.DataSource = list;
            this.grdAccidents.DataBind();


        }

        protected void Search_clickbtn(object sender, ImageClickEventArgs e)
        {
            try
            {
                LoadAccident();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
        protected void grdAccidents_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.ACCIDENT_DETAILS, grdAccidents.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void grdAccidents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                LoadAccident();

                grdAccidents.PageIndex = e.NewPageIndex;

                grdAccidents.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}