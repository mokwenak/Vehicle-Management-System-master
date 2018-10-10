using BMTemplate.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories

{
    public class MaintananceRepository : BaseRepository
    {

        public VehicleMaintenance GetVehicleMaintanance(string Regno)
        {
            return this.m_Context.VehicleMaintenances.Where(b => b.Vehicle.RegistrationNumber.Equals(Regno)).SingleOrDefault();
        }

        public VehicleMaintenance GetVehicleMaintananceID(long id)
        {
            return this.m_Context.VehicleMaintenances.Where(b => b.VehicleMaintenanceId.Equals(id)).SingleOrDefault();
        }

        public List<VehicleMaintenance> SearchRegno(string regno)
        {
            return (from g in this.m_Context.VehicleMaintenances
                    where g.Vehicle.RegistrationNumber.Contains(regno)
                    orderby g.ServiceDate
                    select g).ToList();
        }

        public List<VehicleMaintenance> SearchMaintId(string maintype)
        {
            return (from g in this.m_Context.VehicleMaintenances
                    where g.ServiceType.ServiceTypeName.Contains(maintype)
                    orderby g.ServiceDate
                    select g).ToList();
        }

        public bool AddMaintanance(long vehicleId, int serviceTypeId, DateTime serviceDate, int Oddo, string Comments)
        {

            VehicleMaintenance newMaintanance = new VehicleMaintenance()
            {
                VehicleId = vehicleId,
                Comments = Comments,
                ServiceTypeId = serviceTypeId,
                ServiceDate = serviceDate,
                OdoMeter = Oddo
            };

            if (serviceTypeId == (int)ServiceTypes.BOTH || serviceTypeId == (int)ServiceTypes.NORMAL_SERVICE)
            {
                Vehicle veh = new VehicleRepository().GetVehicle(vehicleId);
                veh.CurrentOdoMeter = Oddo;
            }


            this.m_Context.VehicleMaintenances.Add(newMaintanance);

            return this.m_Context.SaveChanges() > 0;
        }

        public bool UpdateVehicleMaintanance(long maintid, long vehicleId, int serviceTypeId, DateTime ServiceDate, int Oddo,  string comments)
        {

            VehicleMaintenance maintanance = this.GetVehicleMaintananceID(maintid);

            if (maintanance != null)
            {
                maintanance.VehicleId = vehicleId;
                maintanance.ServiceTypeId = serviceTypeId;
                maintanance.ServiceDate = ServiceDate;
                maintanance.Comments = comments;
                maintanance.OdoMeter = Oddo;

                return this.m_Context.SaveChanges() > 0;
            }

            return false;
        }
    }

}