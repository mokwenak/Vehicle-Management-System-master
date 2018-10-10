

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class TripPassengers : BasePage
    {

        TripRepository m_Repository = new TripRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                if (string.IsNullOrEmpty(this.RedirectId))
                {
                    this.RedirectPage(Pages.TRIP_AUTHORISATION);
                    return;
                }
                else
                {
                    long tripId;

                    if(!long.TryParse(this.RedirectId, out tripId))
                    {
                        this.RedirectPage(Pages.TRIP_AUTHORISATION);
                        return;
                    }

                    var trip = m_Repository.GetTrip(tripId);

                    if(trip == null)
                    {
                        this.RedirectPage(Pages.TRIP_AUTHORISATION);
                        return;
                    }

                    txtTripId.Text = this.RedirectId;
                    txtTripDescription.Text = trip.TripDescription;
                    txtDriver.Text = string.Format("{0} {1}", trip.Driver.FirstName, trip.Driver.Surname);

                    this.LoadControls(trip.Passengers);
                }
            }
        }
    
        protected void grdPassengers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                var list = this.RecreateList();

                list.RemoveAt(e.RowIndex);
                grdPassengers.DataSource = list;
                grdPassengers.DataBind();
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }

        public void LoadControls(object passengers)
        {
            grdPassengers.DataSource = passengers;
            grdPassengers.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                List<Passenger> passangers = new List<Passenger>();
                long tripId = Convert.ToInt64(txtTripId.Text);

                for (int i = 0; i < grdPassengers.Rows.Count; i++)
                {

                    TextBox txtName = (TextBox)grdPassengers.Rows[i].Cells[0].FindControl("txtName");
                    TextBox txtSurname = (TextBox)grdPassengers.Rows[i].Cells[1].FindControl("txtSurname");
                    TextBox txtIDNumber = (TextBox)grdPassengers.Rows[i].Cells[2].FindControl("txtIDNumber");
                    TextBox txtReason = (TextBox)grdPassengers.Rows[i].Cells[3].FindControl("txtReason");
                    Label lblPassengerId = (Label)grdPassengers.Rows[i].Cells[0].FindControl("lblPassengerId");

                    if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtSurname.Text) || string.IsNullOrEmpty(txtIDNumber.Text))
                    {
                        this.ShowMessage(Messages.PASSEGERS_MISSING_INFORMATION);
                        return;
                    }
                    else
                    {
                        passangers.Add(new Passenger()
                        {
                            PassengerId = Convert.ToInt64(lblPassengerId.Text),
                            TripId = tripId,
                            PassengerIdNo = txtIDNumber.Text,
                            PassengerFirstName = txtName.Text,
                            PassengerSurname = txtSurname.Text,
                            Reason = txtReason.Text
                        });
                    }
                }

                grdPassengers.Enabled = false;
                btnBack.Enabled = false;
                btnSave.Enabled = false;
                var result = true;
                if (passangers.Count > 0)
                {
                    var list = m_Repository.CapturePassengers(tripId, passangers);
                    result = list.Count > 0;
                    if (result)
                    {

                        this.grdPassengers.DataSource = list;
                        this.grdPassengers.DataBind();

                        this.ShowMessage(Messages.PASSENGERS_ADDED_SUCCESFULLY);
                    }
                }

                grdPassengers.Enabled = !result;
                btnBack.Enabled = !result;
                btnSave.Enabled = !result;
                this.RedirectPage(Pages.TRIP_AUTHORITY_SLIP, txtTripId.Text);

            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.TRIP_AUTHORISATION, txtTripId.Text);

            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void btnAddPassenger_Click(object sender, EventArgs e)
        {
            try
            {

                var list = this.RecreateList();

                list.Add(new { PassengerId = 0, PassengerFirstName = string.Empty, PassengerSurname = string.Empty, PassengerIdNo = string.Empty, Reason = string.Empty });
                grdPassengers.DataSource = list;
                grdPassengers.DataBind();

            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private List<object> RecreateList()
        {
            var list = new List<object>();

            for (int i = 0; i < grdPassengers.Rows.Count; i++)
            {

                Label lblPassengerId = (Label)grdPassengers.Rows[i].Cells[0].FindControl("lblPassengerId");

                TextBox _Nm = (TextBox)grdPassengers.Rows[i].Cells[0].FindControl("txtName");

                TextBox _SR = (TextBox)grdPassengers.Rows[i].Cells[1].FindControl("txtSurname");

                TextBox _ID = (TextBox)grdPassengers.Rows[i].Cells[2].FindControl("txtIDNumber");

                TextBox _RS = (TextBox)grdPassengers.Rows[i].Cells[3].FindControl("txtReason");

                list.Add(new { PassengerId = Convert.ToInt64(lblPassengerId.Text), PassengerFirstName = _Nm.Text, PassengerSurname = _SR.Text, PassengerIdNo = _ID.Text, Reason = _RS.Text });
            }

            return list;
        }
    }
}