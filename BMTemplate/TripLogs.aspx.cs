using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using BMTemplate.Enums;
using System.Collections;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace BMTemplate
{
    public partial class TripLogs : BasePage
    {

        TripRepository m_Repository = new TripRepository();

        private object OfficeTypes
        {
            get
            {
                if (ViewState["OfficeTypes"] == null)
                {
                    return null;
                }

                return JsonConvert.DeserializeObject(ViewState["OfficeTypes"].ToString());
            }
            set
            {
                ViewState["OfficeTypes"] = JsonConvert.SerializeObject(value);
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!this.IsPostBack)
            {
                if (string.IsNullOrEmpty(this.RedirectId))
                {
                    this.RedirectPage(Pages.TRIP_CLOSURE);
                    return;
                }
                else
                {
                    long tripId;

                    if (!long.TryParse(this.RedirectId, out tripId))
                    {
                        this.RedirectPage(Pages.TRIP_CLOSURE);
                        return;
                    }

                    tripIDTxt.Text = tripId.ToString();

                    var trip = m_Repository.GetTrip(tripId);

                    if (trip != null)
                    {

                        currentODDO.Text = trip.Vehicle.CurrentOdoMeter.ToString();

                        this.ServiceWarning(trip.VehicleId);
                    }

                    this.LoadControls();

                    this.OfficeTypes = new TripRepository().GetOfficeTypes().Select<OffenceType, object>(new Func<OffenceType, object>(o => new { o.OffenceTypeId, o.OffenceTypeName })).ToList();
                }
            }
        }

        public void LoadControls()
        {
            var list = new List<object>(new object[] { new { StartPoint = string.Empty, Destination = string.Empty, startODO = string.Empty, endODO = string.Empty, kilos = string.Empty, tripdate = string.Empty } });
            grdLogs.DataSource = list;
            grdLogs.DataBind();

            grdOffences.DataSource = new List<object>();
            grdOffences.DataBind();
        }

        protected void btnCloseTrip_Click(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsValid)
                {
                    return;
                }

                Trip trip = new Trip();

                trip.TripId = Convert.ToInt64(tripIDTxt.Text);

                trip.PostInspector = PostInspect.Text;
                trip.PostInspectionComments = PosttripComment.Text;

                if (string.IsNullOrEmpty(fuelLtr.Text))
                {
                    this.ShowMessage("Fuel Liters is required");
                    return;
                }

                if (string.IsNullOrEmpty(fuelCost.Text))
                {
                    this.ShowMessage("Fuel Cost is required");
                    return;
                }

                if (string.IsNullOrEmpty(endODDO.Text))
                {
                    this.ShowMessage("End Odo Meter is required");
                    return;
                }

                Decimal fuelLiters;
                if (!Decimal.TryParse(fuelLtr.Text, out fuelLiters))
                {
                    this.ShowMessage("Fuel Liters is invalid. Please enter a valid number");
                    return;
                }
                trip.FuelLiters = fuelLiters;

                Decimal fuelCst;
                if (!Decimal.TryParse(fuelCost.Text, out fuelCst))
                {
                    this.ShowMessage("Fuel Cost is invalid. Please enter a valid number");
                    return;
                }
                trip.FuelCost = fuelCst;

                int endOdoMeter;
                if (!int.TryParse(endODDO.Text, out endOdoMeter))
                {
                    this.ShowMessage("End Odo Meter is invalid. Please enter a valid number");
                    return;
                }
                else
                {
                    string endODDOText = endODDO.Text.Trim();
                    
                    string currentODDOText = currentODDO.Text.Trim();
                    if (currentODDOText.Length > 0)
                    {
                        //---------------------------------------------------
                        //Compare with the previous ODDO
                        //---------------------------------------------------
                        if (Convert.ToInt64(endODDOText) < Convert.ToInt64(currentODDOText))
                        {
                            this.ShowMessage("End ODDO Meter cannot be less than the vevicle current ODDO Meter");
                            return;
                        }
                    }
                    else
                    {
                        this.ShowMessage("Current ODDO cannot be empty");
                        return;
                    }
                }

                trip.EndOdoMeter = endOdoMeter;
                for (int i = 0; i < grdLogs.Rows.Count; i++)
                {

                    TextBox txtSP = (TextBox)grdLogs.Rows[i].Cells[0].FindControl("txtSP");
                    TextBox txtEP = (TextBox)grdLogs.Rows[i].Cells[1].FindControl("txtEP");
                    TextBox txtStartOdo = (TextBox)grdLogs.Rows[i].Cells[2].FindControl("txtStartOdo");
                    TextBox txtEndOdo = (TextBox)grdLogs.Rows[i].Cells[3].FindControl("txtEndOdo");
                    TextBox txtKilos = (TextBox)grdLogs.Rows[i].Cells[4].FindControl("txtKilos");
                    TextBox txtTripdate = (TextBox)grdLogs.Rows[i].Cells[5].FindControl("txtTripdate");


                    if (string.IsNullOrEmpty(txtSP.Text))
                    {
                        this.ShowMessage("Start Point is required");
                        return;
                    }

                    if (string.IsNullOrEmpty(txtEP.Text))
                    {
                        this.ShowMessage("End Point is required");
                        return;
                    }
                    if (string.IsNullOrEmpty(txtStartOdo.Text))
                    {
                        this.ShowMessage("Start Odo is required");
                        return;
                    }
                    if (string.IsNullOrEmpty(txtEndOdo.Text))
                    {
                        this.ShowMessage("End Odo is required");
                        return;
                    }
                    if (string.IsNullOrEmpty(txtTripdate.Text))
                    {
                        this.ShowMessage("Trip Date is required");
                        return;
                    }

                    int startODO, endODO;

                    if (!int.TryParse(txtStartOdo.Text, out startODO))
                    {
                        this.ShowMessage("Start Odo is invalid. Please enter a valid number");
                        return;
                    }

                    if (!int.TryParse(txtEndOdo.Text, out endODO))
                    {
                        this.ShowMessage("End Odo is invalid. Please enter a valid number");
                        return;
                    }


                    DateTime tripLogDate;

                    if (!DateTime.TryParseExact(txtTripdate.Text, this.DateFormat, null, System.Globalization.DateTimeStyles.None, out tripLogDate))
                    {
                        this.ShowMessage("Enter a valid Offence Date");
                    }

                    trip.TripLogs.Add(new TripLog() { TripId = trip.TripId, StartPoint = txtSP.Text, EndPoint = txtEP.Text, StartOdoMeter = startODO, EndOdoMeter = endODO, TripLogDate = tripLogDate });

                }

                for (int i = 0; i < grdOffences.Rows.Count; i++)
                {

                    DropDownList cboOffenceType = (DropDownList)grdOffences.Rows[i].Cells[0].FindControl("cboOffenceType");
                    TextBox txtOffenceDate = (TextBox)grdOffences.Rows[i].Cells[2].FindControl("txtOffenceDate");
                    TextBox txtComments = (TextBox)grdOffences.Rows[i].Cells[3].FindControl("txtComments");

                    int OffenceTypeId = 0;

                    if (cboOffenceType.SelectedIndex > 0)
                    {
                        OffenceTypeId = Convert.ToInt32(cboOffenceType.SelectedValue);
                    }
                    else
                    {
                        this.ShowMessage("Offence Type is required");
                        return;
                    }

                    if (string.IsNullOrEmpty(txtOffenceDate.Text))
                    {
                        this.ShowMessage("Offence Date is required");
                        return;
                    }

                    DateTime OffenceDate;

                    if (!DateTime.TryParseExact(txtOffenceDate.Text, this.DateFormat, null, System.Globalization.DateTimeStyles.None, out OffenceDate))
                    {
                        this.ShowMessage("Enter a valid Offence Date");
                    }

                    trip.TripOffences.Add(new TripOffence() { TripId = trip.TripId, OffenceTypeId = OffenceTypeId, Comments = txtComments.Text, OffenceDate = OffenceDate });
                }

                this.btnCloseTrip.Enabled = false;
                this.btnAddOffence.Enabled = false;
                this.btnCloseTrip.Enabled = false;
                this.grdLogs.Enabled = false;
                this.grdOffences.Enabled = false;


                if (this.m_Repository.CloseTrip(trip))
                {
                    ShowAlertAndNavigate("Trip Closed Succesfully", Pages.TRIP_CLOSURE);
                }
                else
                {
                    this.btnCloseTrip.Enabled = true;
                    this.btnAddOffence.Enabled = true;
                    this.btnCloseTrip.Enabled = true;
                    this.grdLogs.Enabled = true;
                    this.grdOffences.Enabled = true;
                }

            }
            catch (BusinessException ex)
            {
                this.ShowMessage(ex.Message);
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
                this.RedirectPage(Pages.TRIP_CLOSURE);
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void btnAddLog_Click(object sender, EventArgs e)
        {
            try
            {
                var list = this.RecreateLogsList();

                list.Add(new { StartPoint = string.Empty, Destination = string.Empty, startODO = string.Empty, endODO = string.Empty, kilos = string.Empty, tripdate = string.Empty });
                grdLogs.DataSource = list;
                grdLogs.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void grdLogs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                if (this.grdLogs.Rows.Count == 1)
                {
                    this.ShowMessage(Messages.YOU_CAN_NOT_REMOVE_ALL_RECORDS);
                    e.Cancel = true;
                    return;
                }

                var list = this.RecreateLogsList();

                list.RemoveAt(e.RowIndex);
                grdLogs.DataSource = list;
                grdLogs.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private List<object> RecreateLogsList()
        {
            var list = new List<object>();

            for (int i = 0; i < grdLogs.Rows.Count; i++)
            {

                TextBox _SP = (TextBox)grdLogs.Rows[i].Cells[0].FindControl("txtSP");
                TextBox _Desti = (TextBox)grdLogs.Rows[i].Cells[1].FindControl("txtEP");
                TextBox _StartODO = (TextBox)grdLogs.Rows[i].Cells[2].FindControl("txtStartOdo");
                TextBox _EndODO = (TextBox)grdLogs.Rows[i].Cells[3].FindControl("txtEndOdo");
                TextBox _kilos = (TextBox)grdLogs.Rows[i].Cells[4].FindControl("txtKilos");
                TextBox TDate = (TextBox)grdLogs.Rows[i].Cells[5].FindControl("txtTripdate");

                list.Add(new { StartPoint = _SP.Text, Destination = _Desti.Text, startODO = _StartODO.Text, endODO = _EndODO.Text, kilos = _kilos.Text, tripdate = TDate.Text });
            }

            return list;
        }

        protected void grdOffences_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList cboOffenceType = (DropDownList)e.Row.FindControl("cboOffenceType");
                    cboOffenceType.DataSource = this.OfficeTypes;
                    cboOffenceType.DataBind();


                    Label lblOffenceType = (Label)e.Row.FindControl("lblOffenceType");

                    cboOffenceType.SelectedValue = lblOffenceType.Text;
                }
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void btnAddOffence_Click(object sender, EventArgs e)
        {
            try
            {
                var list = this.RecreateOffencesList();

                list.Add(new { OffenceTypeId = "0", OffenceDate = string.Empty, Comments = string.Empty });
                grdOffences.DataSource = list;
                grdOffences.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        private List<object> RecreateOffencesList()
        {
            var list = new List<object>();

            for (int i = 0; i < grdOffences.Rows.Count; i++)
            {

                DropDownList cboOffenceType = (DropDownList)grdOffences.Rows[i].Cells[0].FindControl("cboOffenceType");
                TextBox txtOffenceDate = (TextBox)grdOffences.Rows[i].Cells[2].FindControl("txtOffenceDate");
                TextBox txtComments = (TextBox)grdOffences.Rows[i].Cells[3].FindControl("txtComments");

                list.Add(new { OffenceTypeId = cboOffenceType.SelectedValue.ToString(), OffenceDate = txtOffenceDate.Text, Comments = txtComments.Text });
            }

            return list;
        }


        protected void grdOffences_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                var list = this.RecreateOffencesList();

                list.RemoveAt(e.RowIndex);
                grdOffences.DataSource = list;
                grdOffences.DataBind();
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void endODDO_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCloseTripS_Click(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsValid)
                {
                    return;
                }

                Trip trip = new Trip();

                trip.TripId = Convert.ToInt64(tripIDTxt.Text);

                trip.PostInspector = PostInspect.Text;
                trip.PostInspectionComments = PosttripComment.Text;

                if (string.IsNullOrEmpty(fuelLtr.Text))
                {
                    this.ShowMessage("Fuel Liters is required");
                    return;
                }

                if (string.IsNullOrEmpty(fuelCost.Text))
                {
                    this.ShowMessage("Fuel Cost is required");
                    return;
                }

                if (string.IsNullOrEmpty(endODDO.Text))
                {
                    this.ShowMessage("End Odo Meter is required");
                    return;
                }

                Decimal fuelLiters;
                if (!Decimal.TryParse(fuelLtr.Text, out fuelLiters))
                {
                    this.ShowMessage("Fuel Liters is invalid. Please enter a valid number");
                    return;
                }
                trip.FuelLiters = fuelLiters;

                Decimal fuelCst;
                if (!Decimal.TryParse(fuelCost.Text, out fuelCst))
                {
                    this.ShowMessage("Fuel Cost is invalid. Please enter a valid number");
                    return;
                }
                trip.FuelCost = fuelCst;

                int endOdoMeter;
                if (!int.TryParse(endODDO.Text, out endOdoMeter))
                {
                    this.ShowMessage("End Odo Meter is invalid. Please enter a valid number");
                    return;
                }
                else
                {
                    string endODDOText = endODDO.Text.Trim();

                    string currentODDOText = currentODDO.Text.Trim();
                    if (currentODDOText.Length > 0)
                    {
                        //---------------------------------------------------
                        //Compare with the previous ODDO
                        //---------------------------------------------------
                        if (Convert.ToInt64(endODDOText) < Convert.ToInt64(currentODDOText))
                        {
                            this.ShowMessage("End ODDO meter cannot be less than the vevicle current ODDO meter");
                            return;
                        }
                    }
                    else
                    {
                        this.ShowMessage("Current ODDO cannot be empty");
                        return;
                    }
                }

                trip.EndOdoMeter = endOdoMeter;
                for (int i = 0; i < grdLogs.Rows.Count; i++)
                {

                    TextBox txtSP = (TextBox)grdLogs.Rows[i].Cells[0].FindControl("txtSP");
                    TextBox txtEP = (TextBox)grdLogs.Rows[i].Cells[1].FindControl("txtEP");
                    TextBox txtStartOdo = (TextBox)grdLogs.Rows[i].Cells[2].FindControl("txtStartOdo");
                    TextBox txtEndOdo = (TextBox)grdLogs.Rows[i].Cells[3].FindControl("txtEndOdo");
                    TextBox txtKilos = (TextBox)grdLogs.Rows[i].Cells[4].FindControl("txtKilos");
                    TextBox txtTripdate = (TextBox)grdLogs.Rows[i].Cells[5].FindControl("txtTripdate");


                    if (string.IsNullOrEmpty(txtSP.Text))
                    {
                        this.ShowMessage("Start Point is required");
                        return;
                    }

                    if (string.IsNullOrEmpty(txtEP.Text))
                    {
                        this.ShowMessage("End Point is required");
                        return;
                    }
                    if (string.IsNullOrEmpty(txtStartOdo.Text))
                    {
                        this.ShowMessage("Start Odo is required");
                        return;
                    }
                    if (string.IsNullOrEmpty(txtEndOdo.Text))
                    {
                        this.ShowMessage("End Odo is required");
                        return;
                    }
                    if (string.IsNullOrEmpty(txtTripdate.Text))
                    {
                        this.ShowMessage("Trip Date is required");
                        return;
                    }

                    int startODO, endODO;

                    if (!int.TryParse(txtStartOdo.Text, out startODO))
                    {
                        this.ShowMessage("Start Odo is invalid. Please enter a valid number");
                        return;
                    }

                    if (!int.TryParse(txtEndOdo.Text, out endODO))
                    {
                        this.ShowMessage("End Odo is invalid. Please enter a valid number");
                        return;
                    }


                    DateTime tripLogDate;

                    if (!DateTime.TryParseExact(txtTripdate.Text, this.DateFormat, null, System.Globalization.DateTimeStyles.None, out tripLogDate))
                    {
                        this.ShowMessage("Enter a valid Offence Date");
                    }

                    trip.TripLogs.Add(new TripLog() { TripId = trip.TripId, StartPoint = txtSP.Text, EndPoint = txtEP.Text, StartOdoMeter = startODO, EndOdoMeter = endODO, TripLogDate = tripLogDate });

                }

                for (int i = 0; i < grdOffences.Rows.Count; i++)
                {

                    DropDownList cboOffenceType = (DropDownList)grdOffences.Rows[i].Cells[0].FindControl("cboOffenceType");
                    TextBox txtOffenceDate = (TextBox)grdOffences.Rows[i].Cells[2].FindControl("txtOffenceDate");
                    TextBox txtComments = (TextBox)grdOffences.Rows[i].Cells[3].FindControl("txtComments");

                    int OffenceTypeId = 0;

                    if (cboOffenceType.SelectedIndex > 0)
                    {
                        OffenceTypeId = Convert.ToInt32(cboOffenceType.SelectedValue);
                    }
                    else
                    {
                        this.ShowMessage("Offence Type is required");
                        return;
                    }

                    if (string.IsNullOrEmpty(txtOffenceDate.Text))
                    {
                        this.ShowMessage("Offence Date is required");
                        return;
                    }

                    DateTime OffenceDate;

                    if (!DateTime.TryParseExact(txtOffenceDate.Text, this.DateFormat, null, System.Globalization.DateTimeStyles.None, out OffenceDate))
                    {
                        this.ShowMessage("Enter a valid Offence Date");
                    }

                    trip.TripOffences.Add(new TripOffence() { TripId = trip.TripId, OffenceTypeId = OffenceTypeId, Comments = txtComments.Text, OffenceDate = OffenceDate });
                }

                this.btnCloseTrip.Enabled = false;
                this.btnAddOffence.Enabled = false;
                this.btnCloseTrip.Enabled = false;
                this.grdLogs.Enabled = false;
                this.grdOffences.Enabled = false;


                if (this.m_Repository.CloseTrip(trip))
                {
                    ShowAlertAndNavigate("Trip Closed Succesfully", Pages.TRIP_CLOSURE);
                }
                else
                {
                    this.btnCloseTrip.Enabled = true;
                    this.btnAddOffence.Enabled = true;
                    this.btnCloseTrip.Enabled = true;
                    this.grdLogs.Enabled = true;
                    this.grdOffences.Enabled = true;
                }

            }
            catch (BusinessException ex)
            {
                this.ShowMessage(ex.Message);
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        protected void currentODDO_TextChanged(object sender, EventArgs e)
        {

        }
    }
}