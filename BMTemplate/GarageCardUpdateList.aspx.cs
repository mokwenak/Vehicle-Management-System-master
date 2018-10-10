using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using BMTemplate.Enums;
using System.Collections;

namespace BMTemplate
{
    public partial class GarageCardUpdateList : BasePage
    {
        private GarageCardRepository m_Repository = new GarageCardRepository();
        
        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                this.LoadCards();
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private void LoadCards()
        {
            IList cards = null;

            lblCard.Text = string.Empty;
            if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.ONE))
            {
                cards = m_Repository.SearchByCard(this.txtSearch.Text);
            }
            else if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.TWO))
            {
                cards = m_Repository.SearchByBank(this.txtSearch.Text);
            }
            else if (this.cbocboSerachOptions.SelectedValue.Equals(SelectedValues.THREE))
            {
                lblCard.Text = Messages.SELECT_SEARCH_CRITERIA;
            }

            this.CardsGridView.DataSource = cards;
            this.CardsGridView.DataBind();

            if (this.CardsGridView.Rows.Count == 0)
            {
                lblCard.Text = Messages.RECORD_DOES_NOT_EXIST;
            }
        }

        protected void CardsGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {

                LoadCards();

                CardsGridView.PageIndex = e.NewPageIndex;

                CardsGridView.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void CardsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.GARAGE_CARD_DETAILS, Convert.ToString(CardsGridView.SelectedValue));
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}