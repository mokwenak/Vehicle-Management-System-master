using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using System.Web.Security;


namespace BMTemplate
{
    public partial class TripAuthPrint : System.Web.UI.Page
    {
        string tripId = string.Empty;
       
        string selectedcodriver = string.Empty;
        private TripRepository m_context = new TripRepository();
        List<Trip> TripInfo = new List<Trip>();


        protected void Page_Load(object sender, EventArgs e)
        {
           // curTrip = (List<Trip>)e.ToString;
            string tripid = Request.QueryString["TripID"];
            TripInfo = this.m_context.TripAuthofOpenedTrip(Convert.ToInt32(tripid));
      
         
            Loadtripdata();
        }

        public void Loadtripdata()
        {
           if (TripInfo.Count > 0)
           {
             
             this.VehReg.InnerText = TripInfo.ElementAt(0).RegistrationNumber;
             var supplTypeId = this.m_context.SupplyRentalCoforOpenedTrip(TripInfo.ElementAt(0).RegistrationNumber.ToString());
             var SupplTypeDesc = this.m_context.SupplyTypeDescription(supplTypeId.ElementAt(0).SupplyTypeId.Value);
             RentalCO.InnerText = SupplTypeDesc.ElementAt(0).SupplyTypeName.ToString();

             var DriverNameSurnameinfo = this.m_context.DriverinforforIssuedtrip(TripInfo.ElementAt(0).DriverIdNumber.ToString()); 
             
             Drivernameinfo.InnerText = DriverNameSurnameinfo.ElementAt(0).NAME.ToString()+" "+DriverNameSurnameinfo.ElementAt(0).Surname.ToString();
             DriverIDinfo.InnerText = TripInfo.ElementAt(0).DriverIdNumber.ToString();
             
                
             if( selectedcodriver !="")
             {
             var CoDriverNameSurnameinfo = this.m_context.CoDriverinforforIssuedtrip(TripInfo.ElementAt(0).DriverIdNumber.ToString());
             
                 CoDriverName.InnerText = CoDriverNameSurnameinfo.ElementAt(0).NAME.ToString() + " " + CoDriverNameSurnameinfo.ElementAt(0).Surname.ToString();
                 CoDriverIdNo.InnerText = TripInfo.ElementAt(0).CO_DRIVER_ID.ToString();
             }
             else
             {
               CoDriverName.InnerText ="NONE";
               CoDriverIdNo.InnerText ="NONE";
             }

             // Logged in User 
             var Officedtls = this.m_context.GettheOfficIDeoftheUser(TripInfo.ElementAt(0).MAINT_USER.ToString());
             var officeId = this.m_context.ProvIDescdofIssuedTrip(Officedtls.ElementAt(0).OfficeId.Value);
             var provinceId = this.m_context.ProvIDescdofIssuedTrip(officeId.ElementAt(0).ProvinceId);
             var provinceDescrition = this.m_context.ProvIDescdofIssuedTrip(provinceId.ElementAt(0).ProvinceId);

             ProvinceIssuing.InnerText = provinceDescrition.ElementAt(0).PROV_DESC.ToString();
             // Project 
             Project.InnerText = TripInfo.ElementAt(0).ProjectName.ToString();
             // Petrol Card 
             PetrolCard.InnerText = TripInfo.ElementAt(0).CARD_NO.ToString();
                        
             // Get the Resp code Description   
             var Respcodedesc = this.m_context.TripRespcodeDescription(TripInfo.ElementAt(0).ResponsibilityCode.ToString());
             TaskDesc.InnerText = "Name of the Task:" + Respcodedesc.ElementAt(0).RESP_DESC;
             TaskDuration.InnerText = "Duration of the Project :" + TripInfo.ElementAt(0).TripDate.ToString() + " " + "to" + " " + TripInfo.ElementAt(0).RETURN_DATE.ToString();
             TaskDescr.InnerText = "Description of the Task :"+" "+TripInfo.ElementAt(0).TripDescription.ToString();
             areaofResponsibility.InnerText = TripInfo.ElementAt(0).TripDescription;
             VehRegAuth.InnerText ="Registration No:"+" "+TripInfo.ElementAt(0).RegistrationNumber.ToString();
             var VehicleTypeID = this.m_context.VehTypeID(TripInfo.ElementAt(0).RegistrationNumber.ToString());
             var VehTypeDesc = this.m_context.VehType(VehicleTypeID.ElementAt(0).VehicleTypeId.Value);
             var VehMakeID = this.m_context.VehMakeID(VehicleTypeID.ElementAt(0).VehicleTypeId.Value);
             VehDescption.InnerText ="Description of Vehicle :"+VehMakeID.ElementAt(0).VehicleMakeName+","+VehTypeDesc.ElementAt(0).VehicleTypeName;
             DriverGriedview.DataSource = this.m_context.LoadDriver(TripInfo.ElementAt(0).DriverIdNumber.ToString());
             DriverGriedview.DataBind();
             
             var Driverinfo = this.m_context.DriverinforforIssuedtrip(TripInfo.ElementAt(0).DriverIdNumber.ToString());
             startOddo.InnerText =  "Oddo Meter Reading:"+" "+TripInfo.ElementAt(0).START_ODO.ToString();
              
             PassengerGridView.DataSource = this.m_context.LoadPassengersPerTrip(TripInfo.ElementAt(0).TripId);
             PassengerGridView.DataBind();
            /*****************************************************************************
             * Commented 
             * 
             *****************************************************************************/
            //officedesc.InnerText ="Office:"+officeId.ElementAt(0).PROV_DESC.ToString();
            //VehicleDesciption.InnerText = "All defects, shortages and damages must be stated after inspection";
            //MakeDescript.InnerText = "Description of Vehicle :" + VehMakeID.ElementAt(0).VehicleMakeName + "," + VehTypeDesc.ElementAt(0).VehicleTypeName;
            //VehinspectRegistration.InnerText = TripInfo.ElementAt(0).RegistrationNumber;
            //Vehdes.InnerText = "Description of Vehicle :" + VehMakeID.ElementAt(0).VehicleMakeName + "," + VehTypeDesc.ElementAt(0).VehicleTypeName + TripInfo.ElementAt(0).RegistrationNumber;
            //declarationline1.InnerText = "I" + " " + " " + Driverinfo.ElementAt(0).NAME + " " + " " + Driverinfo.ElementAt(0).Surname + " " + " " + "hereby declare that the Vehicle" + " " + " " + VehMakeID.ElementAt(0).VehicleMakeName + "," + "registration number:" + " " + " " + TripInfo.ElementAt(0).RegistrationNumber + " " + " " + "will be in my care";
            //DeclarationLine2.InnerText = "for" + " " + " " + "The Period" + " " + " " + TripInfo.ElementAt(0).TripDate.ToString() + " " + " " + TripInfo.ElementAt(0).RETURN_DATE.ToString(); 
            //Maketypedeclaration.InnerText ="Make and Type :"+ VehMakeID.ElementAt(0).VehicleMakeName+","+VehTypeDesc.ElementAt(0).VehicleTypeName;
            //Regnodeclaration.InnerText = "Registration no: "+TripInfo.ElementAt(0).RegistrationNumber;
            //declaln1.InnerText = "I (Driver of the vehicle), " + " " + " " + DriverNameSurnameinfo.ElementAt(0).Surname + "   " + DriverNameSurnameinfo.ElementAt(0).NAME + "  " + DriverNameSurnameinfo.ElementAt(0).PsersalNumber.ToString() + "." + "ID number" + "  " + DriverNameSurnameinfo.ElementAt(0).DriverIdNumber.ToString() + "  " + "herewith";
            //Celldeclaration.InnerText ="Cellphone number :"+ DriverNameSurnameinfo.ElementAt(0).CellNumber.ToString();
            //logbookSurvey.InnerText = Respcodedesc.ElementAt(0).RESP_DESC;
            //logbookprovince.InnerText = provinceDescrition.ElementAt(0).PROV_DESC.ToString();
            //logbookDriver.InnerText = DriverNameSurnameinfo.ElementAt(0).NAME.ToString() + "  " +DriverNameSurnameinfo.ElementAt(0).Surname.ToString();
            //logbookPersalNr.InnerText = DriverNameSurnameinfo.ElementAt(0).PsersalNumber.ToString();
            //logbookregistration.InnerText = TripInfo.ElementAt(0).RegistrationNumber.ToString();
            //logbookvehtype.InnerText = VehTypeDesc.ElementAt(0).VehicleTypeName;
            //logbooklogstartoddo.InnerText = TripInfo.ElementAt(0).START_ODO.ToString();
            //logsheet2Project.InnerText =  Respcodedesc.ElementAt(0).RESP_DESC;
            //logsheet2Province.InnerText = provinceDescrition.ElementAt(0).PROV_DESC.ToString();
            //logsheet2Driver.InnerText = DriverNameSurnameinfo.ElementAt(0).NAME.ToString() + "  " +DriverNameSurnameinfo.ElementAt(0).Surname.ToString();
            //logsheet2Persal.InnerText = DriverNameSurnameinfo.ElementAt(0).PsersalNumber.ToString();
             
            //logsheet2VehicleRegno.InnerText =  TripInfo.ElementAt(0).RegistrationNumber.ToString();
            //logsheet2VehicleType.InnerText =	VehTypeDesc.ElementAt(0).VehicleTypeName;
            //logsheet2startOddo.InnerText = TripInfo.ElementAt(0).START_ODO.ToString();
            }
                        
        }




    }
}