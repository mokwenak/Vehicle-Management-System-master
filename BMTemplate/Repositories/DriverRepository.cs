using BMTemplate.Enums;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BMTemplate.Extensions;

namespace BMTemplate.Repositories
{
    public class DriverRepository : BaseRepository
    {
        private IQueryable<Driver> getAllDrivers()
        {
            var user = new UserRepository().GetUser(CurrentUser.GetUserName());

            if (user == null)
            {
                return null;
            }

            var userId = user.UserId;
            var OfficeTypeId = user.Office.OfficeTypeId;
            var offices = new OfficeRepository().GetOfficesByProv(user.Office.ProvinceId).ToIds();

            if (OfficeTypeId == (int)OfficeTypes.HEADOFFICE)
            {
                return (from v in this.m_Context.Drivers
                        orderby v.FirstName, v.Surname
                        select v);
            }
            else
            {
                return (from v in this.m_Context.Drivers
                        where offices.Any(new Func<int, bool>(i => i == v.OfficeId))
                        orderby v.FirstName, v.Surname
                        select v);
            }
        }

        public Driver GetDriver(string driverIdNumber)
        {
            return this.m_Context.Drivers.Where(d => d.DriverIdNumber.Equals(driverIdNumber)).SingleOrDefault();
        }
        public Driver GetDriver(long id)
        {
            return this.m_Context.Drivers.Where(d => d.DriverId.Equals(id)).SingleOrDefault();
        }

        public bool DriveExists(Driver newDriver)
        {

            var items = this.m_Context.Drivers
                 .Where(vt => vt.EmployeeNumber == newDriver.EmployeeNumber || vt.DriverIdNumber == newDriver.DriverIdNumber).ToList();

            if (items.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<Driver> GetAllDrivers()
        {
            return this.getAllDrivers().ToList();
        }

        public IList GetSummaryBySurname(string surname, params STATUS[] statuses)
        {
            return this.getAllDrivers().Where(d => d.Surname.Contains(surname) && statuses.Any(s => d.StatusId == (int)s)).ToList();
        }

        public IList GetSummaryBySurname(string surname)
        {
            return this.GetSummaryBySurname(surname, STATUS.ACTIVE , STATUS.INACTIVE , STATUS.SUSPECTED);
        }
        public IList GetSummaryByPersal(string persalNumber, params STATUS[] statuses)
        {
            return this.getAllDrivers().Where(d => d.EmployeeNumber.Contains(persalNumber) && statuses.Any(s => d.StatusId == (int)s)).ToList();
        }

        public IList GetSummaryByPersal(string persalNumber)
        {
            return this.GetSummaryByPersal(persalNumber, STATUS.ACTIVE , STATUS.INACTIVE , STATUS.SUSPECTED);
        }

        public IList GetSummaryByIdNumber(string idNumber, params STATUS[] statuses)
        {
            return this.getAllDrivers().Where(d => d.DriverIdNumber.Contains(idNumber) && statuses.Any(s => d.StatusId == (int)s)).ToList();
        }

        public IList GetSummaryByIdNumber(string idNumber)
        {
            return this.GetSummaryByIdNumber(idNumber, STATUS.ACTIVE, STATUS.INACTIVE, STATUS.SUSPECTED);
        }
        public void AddDriver(Driver newDriver)
        {

            this.m_Context.Drivers.Add(newDriver);
            this.m_Context.SaveChanges();
        }

        public void UpdateDriver(Driver driver)
        {

            // var d = this.m_Context.Drivers.First(t => t.DriverIdNumber == driver.DriverIdNumber); // orginal
            var d = this.m_Context.Drivers.First(t => t.EmployeeNumber == driver.EmployeeNumber);
            
            if (d != null)
            {
                d.DriverIdNumber = driver.DriverIdNumber; // inserted so that Admin Head office can update
                d.Initials = driver.Initials;
                d.FirstName = driver.FirstName;
                d.Surname = driver.Surname;
                d.CellNumber = driver.CellNumber;
                d.EmergenceContactNo = driver.EmergenceContactNo;
                d.EmergenceName = driver.EmergenceName;
                d.PdpLicenseDate = driver.PdpLicenseDate;
                d.PdpLicenseNumber = driver.PdpLicenseNumber;
                d.LicenseIssueDate = driver.LicenseIssueDate;
                d.LicenseCode = driver.LicenseCode;
                d.LicenseNumber = driver.LicenseNumber;
                d.LicenseExpiryDate = driver.LicenseExpiryDate;
                d.StatusId = driver.StatusId;
            }

            this.m_Context.SaveChanges();
        }


        public bool DriversDeleteList(string idNo)
        {

            var driver = this.m_Context.Drivers.First(t => t.DriverIdNumber.Equals(idNo));

            if (driver != null)
            {
                driver.StatusId = (int)STATUS.INACTIVE;
                return this.m_Context.SaveChanges() > 0;

            }

            return false;
        }
    }
}
