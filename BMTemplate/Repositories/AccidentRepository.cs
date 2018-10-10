using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories
{
    public class AccidentRepository : BaseRepository
    {

        public Accident GetAccidentID(long Accid)
        {
            return this.m_Context.Accidents.Where(b => b.AccidentId.Equals(Accid)).SingleOrDefault();
        }

        public List<Accident> SearchByRegNo(string regno)
        {
            return this.m_Context.Accidents.Where(a => a.Trip.Vehicle.RegistrationNumber.Contains(regno)).ToList();
        }

        public List<Accident> SearchByIdNumber(string idNumber)
        {
            return this.m_Context.Accidents.Where(a => a.Trip.Driver.DriverIdNumber.Contains(idNumber)).ToList();
        } 

        public bool AddAccident(long tripID, string accidentDesc, string caseNumber, string comments, DateTime accidentDate, string pointOfAcident)
        {

            Accident NewAccident = new Accident()
            {
                TripId = tripID,
                AccidentDescription = accidentDesc,
                CaseNumber = caseNumber,
                Comment = comments,
                AccidentDate = accidentDate,
                AccidentLocation = pointOfAcident
            };

            this.m_Context.Accidents.Add(NewAccident);

            return this.m_Context.SaveChanges() > 0;
        }

        public bool UpdateAccident(long accid, string accidentDesc, string caseNumber, string comments, DateTime accidentDate, string pointOfAcident)
        {

            Accident acc = this.GetAccidentID(accid);

            if (acc != null)
            {
                acc.AccidentDescription = accidentDesc;
                acc.CaseNumber = caseNumber;
                acc.Comment = comments;
                acc.AccidentDate = accidentDate;
                acc.AccidentLocation = pointOfAcident;

                return this.m_Context.SaveChanges() > 0;
            }

            return false;
        }
    }
}