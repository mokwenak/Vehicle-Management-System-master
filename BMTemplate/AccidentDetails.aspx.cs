using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using System.Web.Security;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class AccidentDetails : BasePage
    {
        TripRepository mRepository = new TripRepository();
        AccidentRepository mAccRepository = new AccidentRepository();

        public long TripId
        {
            get
            {
                if (ViewState["TripId"] == null)
                {
                    return 0;
                }

                return Convert.ToInt64(ViewState["TripId"]);
            }
            set
            {
                ViewState["TripId"] = value;
            }
        }
        public long AccidentId
        {
            get
            {
                if (ViewState["AccidentId"] == null)
                {
                    return 0;
                }

                return Convert.ToInt64(ViewState["AccidentId"]);
            }
            set
            {
                ViewState["AccidentId"] = value;
            }
        }


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
                    long id;

                    if (!long.TryParse(this.RedirectId, out id))
                    {
                        this.RedirectPage(Pages.ACCIDENTS_ADD_LIST);
                        return;
                    } 

                    if (Request.UrlReferrer.ToString().Contains(this.ResolveUrl(Pages.ACCIDENTS_ADD_LIST)))
                    {
                        var trip = mRepository.GetTrip(id);

                        if (trip == null)
                        {
                            this.RedirectPage(Pages.ACCIDENTS_ADD_LIST);
                            return;
                        }

                        this.Mode = OperationMode.Add;

                        this.TripId = id;

                        Trip tripdetails = mRepository.GetTrip(id);

                        LoadTrip(tripdetails);
                    }
                    else if (Request.UrlReferrer.ToString().Contains(this.ResolveUrl(Pages.ACCIDENTS_UPDATE_LIST)))
                    {
                        this.Mode = OperationMode.Update;

                        this.AccidentId = id;

                        var accident = this.mAccRepository.GetAccidentID(id);

                        LoadTrip(accident?.Trip ?? null);
                        LoadAccident(accident);

                        this.TripId = accident?.TripId??0;

                        CapturAcciID.InnerHtml = "Update Accident";
                        Savbtn.Text = "Update";
                        
                    }
                    else
                    {
                        this.RedirectPage(Pages.ACCIDENTS_ADD_LIST);
                        return;
                    }

                }
            }
        }

        private void LoadTrip(Trip tripdetails)
        {

            if (tripdetails != null)
            {

                txbVhclRegistration.Text = ""; // tripdetails.Vehicle.RegistrationNumber.ToString();
                DriverNo.Text = tripdetails.Driver.DriverIdNumber.ToString();
                txbTripdate.Text = tripdetails.TripDate.ToString();
                txbTripdate.Text = tripdetails.TripDate.ToString(this.DateFormat);
                txbTripDescription.Text = tripdetails.TripDescription.ToString();
                txbProjectName.Text = tripdetails.ProjectName.ToString();
            }
        }

        private void LoadAccident(Accident accident)
        {
            if (accident != null)
            {

                if (accident.AccidentDate != null)
                {
                    this.txbAccidentDate.Text = accident.AccidentDate.ToString(this.DateFormat);
                }
                else
                {
                    this.txbAccidentDate.Text = string.Empty;
                
                }
                  TxbcaseNumber.Text= accident.CaseNumber.ToString();
                      txbAccidentDescription.Text=accident.AccidentDescription.ToString();    
                    txbComments.Text =accident.Comment.ToString();
                    txbPointofAccident.Text=accident.AccidentLocation.ToString();
             }
        }

        private void ClearFields()
        {

            this.txbAccidentDate.Text = string.Empty;
            TxbcaseNumber.Text = string.Empty;
            txbAccidentDescription.Text = string.Empty;
            txbComments.Text = string.Empty;
            txbPointofAccident.Text = string.Empty;
            txbAccidentDate.Text = string.Empty;
                   
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    return;
                }

                DateTime tripDate = DateTime.ParseExact(this.txbTripdate.Text, this.DateFormat, null);
                DateTime accidentDate = DateTime.ParseExact(this.txbAccidentDate.Text, this.DateFormat, null);

                if (tripDate <= accidentDate)
                {
                    if (this.Mode == OperationMode.Add)
                    {
                        if (mAccRepository.AddAccident(this.TripId, this.txbAccidentDescription.Text, this.TxbcaseNumber.Text, this.txbComments.Text, accidentDate, this.txbPointofAccident.Text))
                        {
                            this.ClearFields();

                            ShowAlertAndNavigate(Messages.RECORD_INSERTED_SUCESSFULLY, Pages.ACCIDENTS_ADD_LIST);
                        }
                        else
                        {
                            ShowMessage(Messages.RECORD_INSERTED_NOT_SUCESSFULLY);
                        }
                    }
                    else
                    {
                        if (mAccRepository.UpdateAccident(this.AccidentId, this.txbAccidentDescription.Text, this.TxbcaseNumber.Text, this.txbComments.Text, accidentDate, this.txbPointofAccident.Text))
                        {
                            ShowAlertAndNavigate(Messages.RECORD_UPDATED_SUCESSFULLY, Pages.ACCIDENTS_UPDATE_LIST);
                        }
                        else
                        {
                            ShowMessage(Messages.RECORD_UPDATED_NOT_SUCESSFULLY);
                        }
                    }
                }
                else
                {
                    ShowMessage(Messages.TRIP_ACCIDENT_CANNOT_EARLIER_TRIP_DATE);

                }
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }

        } 
        
} 
}