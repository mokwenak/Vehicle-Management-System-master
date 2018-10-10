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
    public partial class UsersUpdateList : BasePage
    {
        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Search();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private void Search()
        {
            string selectedItem = cboSerachOptions.SelectedValue.ToString();
            string searchText = txtSearch.Text.ToString();

            if (selectedItem.Equals(SelectedValues.ONE))
            {
                var users = new UserRepository().GetUsersByUserName(searchText);

                if (users.Count > 0)
                {
                    grdUsers.DataSource = users;
                    grdUsers.DataBind();
                    lblMessage.Text = string.Empty;
                }
                else
                {
                    grdUsers.DataSource = null;
                    grdUsers.DataBind();
                    lblMessage.Text = Messages.RECORD_DOES_NOT_EXIST;
                }

            }
            else if (selectedItem.Equals(SelectedValues.TWO))
            {
                var users = new UserRepository().GetUsersByPersal(searchText);

                if (users.Count > 0)
                {
                    grdUsers.DataSource = users;
                    grdUsers.DataBind();
                    lblMessage.Text = string.Empty;
                }
                else
                {
                    grdUsers.DataSource = null;
                    grdUsers.DataBind();
                    lblMessage.Text = Messages.RECORD_DOES_NOT_EXIST;
                }

            }
            else if (selectedItem.Equals(SelectedValues.ZERO))
            {
                lblMessage.Text = Messages.SELECT_SEARCH_CRITERIA;
            }
        }

        protected void grdUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                Search();

                grdUsers.PageIndex = e.NewPageIndex;

                grdUsers.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void grdUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.USERS_DETAILS, Convert.ToString(grdUsers.SelectedValue));
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}