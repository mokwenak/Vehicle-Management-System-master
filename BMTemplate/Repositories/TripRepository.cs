using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BMTemplate.Enums;
using BMTemplate.Extensions;

namespace BMTemplate.Repositories
{
    public class TripRepository : BaseRepository
    {
        public List<Trip> SearchByRegNo(string regNo)
        {
            var list = (from Trip t in m_Context.Trips
                        where t.Vehicle.RegistrationNumber.Contains(regNo) && t.PostInspectionComments == null
                        select t).ToList();

            return list;
        }
        
        public List<Trip> SearchByIdNumber(string idNo)
        {
            var list = (from Trip t in m_Context.Trips
                        where t.Driver.DriverIdNumber.Contains(idNo) && t.PostInspectionComments == null
                        select t).ToList();

            return list;
        }

        public Trip GetTrip(long tripId)
        {
            return m_Context.Trips.Where(t => t.TripId.Equals(tripId)).SingleOrDefault();
        }

        public List<OffenceType> GetOfficeTypes()
        {
            return this.m_Context.OffenceTypes.ToList();
        }

        public long AddTrip(long vehicleId, long driverId, long? coDriverId, string tripDsrc, string projNm, DateTime tripDte, DateTime expReturnDte, string userNm, string startPoint, string endPoint, long vehicleTypeId)
        {

            Trip objTRP = new Trip(); // NEW TRIP

            objTRP.VehicleId = vehicleId;
            objTRP.DriverId = driverId;
            objTRP.CoDriverId = driverId;
           // objTRP.GarageCardId = garageCardId;
            // objTRP.StartOdoMeter = odoMeter;
            objTRP.TripDescription = tripDsrc;
            objTRP.ProjectName = projNm;
            objTRP.TripDate = tripDte;
            objTRP.EstimatedReturnDate = expReturnDte;
           // objTRP.AuthirisedBy = authBy;
           // objTRP.Authorised = auth;
           // objTRP.PreInspector = preTripInspct;
            objTRP.WorkflowId = 1;
            objTRP.StartPoint = startPoint;
            objTRP.EndPoint = endPoint;

            this.m_Context.Trips.Add(objTRP);
            var isSaved = this.m_Context.SaveChanges();
            
            return objTRP.TripId;
        }
        public long AuhthoriseTrip(long tripId, string authBy, string preTripComment, string userNm)
        {
            Trip objTRP = this.GetTrip(tripId);

            if (objTRP != null)
            {
                objTRP.AuthirisedBy = authBy;
                objTRP.PreInspectionComments = preTripComment;
               
                this.m_Context.SaveChanges();
            }

            return objTRP.TripId;
        }

        public long UpdateTrip(long tripId, long vehicleId, long driverId, long? coDriverId, string tripDsrc, string projNm, DateTime tripDte, DateTime expReturnDte, string userNm, string startPoint, string endPoint, long vehicleTypeId)
        {

            Trip objTRP = this.GetTrip(tripId);

            if (objTRP != null)
            {
                objTRP.VehicleId = vehicleId;
                objTRP.DriverId = driverId;
                objTRP.CoDriverId = coDriverId;
                //objTRP.GarageCardId = garageCardId;
                //objTRP.ResponsibilityId = responsibilityId;
                //objTRP.StartOdoMeter = odoMeter;
                objTRP.TripDescription = tripDsrc;
                objTRP.ProjectName = projNm;
                objTRP.TripDate = tripDte;
                objTRP.EstimatedReturnDate = expReturnDte;
                //objTRP.AuthirisedBy = authBy;
                //objTRP.Authorised = auth;
                //objTRP.PreInspector = preTripInspct;
                //objTRP.PreInspectionComments = preTripComment;
                objTRP.StartPoint = startPoint;
                objTRP.EndPoint = endPoint;

                this.m_Context.SaveChanges();

                return objTRP.TripId;
            }

            return 0;
        }

        public List<TripPoco> GetOpenTrips(int workflowId)
        {
            //var user = new UserRepository().GetUser(CurrentUser.GetUserName());

            //if (user == null)
            //{
            //    return null;
            //}
            
            //var userId = user.UserId;
            //var OfficeTypeId = user.Office.OfficeTypeId;
            //var usersofficeid = user.OfficeId;
            //var provinceID = user.Office.ProvinceId;
           
           var trips = (from t in this.m_Context.Trips
                    join d in this.m_Context.Drivers
                        on t.DriverId equals d.DriverId
                    join cd in this.m_Context.Drivers
                        on t.CoDriverId equals cd.DriverId 
                    where t.WorkflowId == workflowId
                    select new TripPoco() { TripId = t.TripId, TripDescription = t.TripDescription, ProjectName = t.ProjectName, DriverName = t.Driver.FirstName + " " + t.Driver.Surname, TripDate = t.TripDate, EstimatedReturnDate = t.EstimatedReturnDate}).ToList();

            return trips;
          
        }

        public List<Trip> AllClosedTrips()
        {
            var user = new UserRepository().GetUser(CurrentUser.GetUserName());

            if (user == null)
            {
                return null;
            }

            var userId = user.UserId;
            var OfficeTypeId = user.Office.OfficeTypeId;
            var usersofficeid = user.OfficeId;
            var provinceID = user.Office.ProvinceId;

            //var offices = new OfficeRepository().GetOfficesByProv(user.Office.ProvinceId).ToIds();

            //if (OfficeTypeId == (int)OfficeTypes.PROVINCE)
            //{
            //    return (from o in this.m_Context.Offices
            //            join v in this.m_Context.Vehicles
            //            on o.OfficeId equals v.OfficeId
            //            join t in this.m_Context.Trips
            //            on v.VehicleId equals t.VehicleId
            //            where t.PostInspectionComments != null && o.ProvinceId == provinceID
            //            select t).OrderByDescending(a => a.TripId).ToList();
            //}
            //if (OfficeTypeId == (int)OfficeTypes.DISTRICT)
            //{
            //    return (from t in this.m_Context.Trips
            //            join v in this.m_Context.Vehicles
            //            on t.VehicleId equals v.VehicleId
            //            where t.PostInspectionComments != null && v.OfficeId == usersofficeid
            //            select t).OrderByDescending(a => a.TripId).ToList();
            //}
            //else
            //{
                return (from Trip t in this.m_Context.Trips
                        where t.PostInspectionComments != null
                        select t).OrderByDescending(a => a.TripId).ToList();
          //  }
        }

        public bool CloseTrip(Trip t)
        {

            var trip = this.m_Context.Trips.Find(t.TripId);

            trip.PostInspector = t.PostInspector;
            trip.PostInspectionComments = t.PostInspectionComments;
            trip.FuelLiters = t.FuelLiters;
            trip.FuelCost = t.FuelCost;
            trip.EndOdoMeter = t.EndOdoMeter;
            trip.EstimatedReturnDate = DateTime.Now;

            if (trip.Vehicle != null)
            {
                trip.Vehicle.CurrentOdoMeter = (int)t.EndOdoMeter;
            }
            else
            {
                throw new BusinessException("Vehicle not found for trip.");
            }

            foreach (var log in t.TripLogs)
            {
                this.m_Context.TripLogs.Add(log);
            }

            foreach (var Offence in t.TripOffences)
            {
                this.m_Context.TripOffences.Add(Offence);
            }

            return this.m_Context.SaveChanges() > 0;
        }

        public List<Passenger> CapturePassengers(long tripId, List<Passenger> passangers)
        {
            var trip = this.GetTrip(tripId);


            var prevList = trip.Passengers.Where(a => passangers.Any(new Func<Passenger, bool>( p => p.PassengerId == a.PassengerId)));
            var deletedList = trip.Passengers.Except(prevList);

            this.m_Context.Passengers.RemoveRange(deletedList);

            foreach(var passenger in passangers)
            {
                if(passenger.PassengerId == 0)
                {
                    this.m_Context.Passengers.Add(passenger);
                }
                else
                {
                    var dbPassenger = m_Context.Passengers.Find(passenger.PassengerId);

                    if(dbPassenger != null)
                    {
                        dbPassenger.PassengerFirstName = passenger.PassengerFirstName;
                        dbPassenger.PassengerSurname = passenger.PassengerSurname;
                        dbPassenger.PassengerIdNo = passenger.PassengerIdNo;
                        dbPassenger.Reason = passenger.Reason;
                    }
                }
            }
            

            if( this.m_Context.SaveChanges() > 0)
            {
                var t = this.GetTrip(tripId);
                
                if(t != null)
                {
                    return t.Passengers.ToList();
                }
            }

            return new List<Passenger>();
        }
    }
}