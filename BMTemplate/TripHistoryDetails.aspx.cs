using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class TripHistoryDetails : BasePage
    {

        TripRepository m_Repository = new TripRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(this.RedirectId))
            {
                this.RedirectPage(Pages.TRIPS_HISTORY);
                return;
            }
            else
            {
                long tripId;

                if (!long.TryParse(this.RedirectId, out tripId))
                {
                    this.RedirectPage(Pages.TRIPS_HISTORY);
                    return;
                }

                LoadDetails(tripId);
            }
        }

        private void LoadDetails(long tripId)
        {
            var trip = m_Repository.GetTrip(tripId);

            if (trip == null || trip.Driver == null || trip.Vehicle == null || trip.Passengers == null)
            {
                return;
            }

            mainDrvertxt.Text = string.Format("{0} {1}", trip.Driver.FirstName, trip.Driver.Surname);
            if (trip.CoDriverId != null)
            {
              //  coDrvertxt.Text = string.Format("{0} {1}", trip.CoDriverId., trip.Driver1.Surname);
            }

            Veh_Regtxt.Text = trip.Vehicle.RegistrationNumber;
            projectTxt.Text = trip.ProjectName;
            tripDescription.Text = trip.TripDescription;
            authoByTxt.Text = trip.AuthirisedBy;
            cardCardNo.Text = trip.GarageCard.CardNumber;
            txtTripId.Text = trip.TripId.ToString();
            txtPostInspector.Text = trip.PostInspector.ToString();
            txtPostInspectionComments.Text = trip.PostInspectionComments.ToString();
            txtFuelLiters.Text = trip.FuelLiters.ToString();
            txtFuelCost.Text = trip.FuelCost.ToString();
            txtEndOdoMeter.Text = trip.EndOdoMeter.ToString();

            // passengers
            DataTable dtPassangers = new DataTable();

            dtPassangers.Columns.Add("ID No.", typeof(string));
            dtPassangers.Columns.Add("Passenger Name", typeof(string));
            dtPassangers.Columns.Add("Passenger Surname", typeof(string));
            dtPassangers.Columns.Add("Reason", typeof(string));

            DataTable dtLogs = new DataTable();

            dtLogs.Columns.Add("Start Point", typeof(string));
            dtLogs.Columns.Add("End Point", typeof(string));
            dtLogs.Columns.Add("Kilometers", typeof(string));
            dtLogs.Columns.Add("Trip Date", typeof(string));

            DataTable dtOffences = new DataTable();

            dtOffences.Columns.Add("Offence Type", typeof(string));
            dtOffences.Columns.Add("Offence Date", typeof(string));

            foreach (var log in trip.TripLogs)
            {
                dtLogs.Rows.Add(new string[] { log.StartPoint, log.EndPoint, Convert.ToString(log.EndOdoMeter - log.StartOdoMeter), trip.EstimatedReturnDate.ToString(this.DateFormat) });
            }

            foreach (var Offence in trip.TripOffences)
            {
                dtOffences.Rows.Add(new string[] { Offence.OffenceType.OffenceTypeName, Offence.OffenceDate.ToString(this.DateFormat)});
            }


            foreach (var passanger in trip.Passengers)
            {
                dtPassangers.Rows.Add(new string[] { passanger.PassengerIdNo, passanger.PassengerFirstName, passanger.PassengerSurname, passanger.Reason });
            }

            if (dtPassangers.Rows.Count == 0)
            {
                msg.Text = "No Passengers";
            }
            else
            {
                grdPassengers.DataSource = dtPassangers;
                grdPassengers.DataBind();

            }

            grdLogs.DataSource = dtLogs;
            grdLogs.DataBind();

            grdOffences.DataSource = dtOffences;
            grdOffences.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            this.RedirectPage(Pages.TRIPS_HISTORY);
        }

    }
}