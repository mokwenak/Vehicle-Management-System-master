using BMTemplate.Enums;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BMTemplate.Extensions;
using System.Configuration;
using Newtonsoft.Json.Linq;
using System.Reflection;
using BMTemplate.Repositories;

namespace BMTemplate.Repositories
{
    public class VehicleRepository : BaseRepository
    {

        private IQueryable<Vehicle> getAllVehicles()
        {
            var user = new UserRepository().GetUser(CurrentUser.GetUserName());

            if (user == null)
            {
                return null;
            }

           var userId = user.UserId;
           var OfficeTypeId = user.Office.OfficeTypeId;
           var usersofficeid = user.OfficeId;
           //var offices = new OfficeRepository().GetOfficesByProv(user.Office.ProvinceId).ToIds();

           //if (OfficeTypeId == (int)OfficeTypes.HEADOFFICE)
           // {
           //     return (from v in this.m_Context.Vehicles
           //             orderby v.RegistrationNumber
           //             select v);
           // }
           //if (OfficeTypeId == (int)OfficeTypes.DISTRICT)
           // {
           //     return (from v in this.m_Context.Vehicles
           //             where  v.OfficeId== usersofficeid && (OfficeTypeId == (int)OfficeTypes.DISTRICT)
           //             orderby v.RegistrationNumber
           //             select v);
           // }
           // else
           // {
                return (from v in this.m_Context.Vehicles
                        orderby v.RegistrationNumber
                        select v);
            //}
        }


        public System.Collections.IList GetVehicles()
        {
            return getAllVehicles().ToList();
        }

        public List<Responsibility> GetAllResponsibilies()
        {
            var _List = (from rc in this.m_Context.Responsibilities.ToList()
                         orderby rc.ResponsibilityCode
                         select rc).ToList();

            return _List;
        }

        public System.Collections.IList GetVehicleModels(int vehicleMakeId)
        {
            return this.m_Context.VehicleModels.Where(m => m.VehicleMakeId == vehicleMakeId).ToList();
        }

        public System.Collections.IList GetActiveVehicles()
        {
            return this.getAllVehicles().Where(v => v.StatusId == (int)STATUS.ACTIVE).ToList();
        }

        public System.Collections.IList GetSeriveType()
        {
            return this.m_Context.ServiceTypes.ToList();
        }

        public System.Collections.IList GetVehiclesByVehRegNo(string vehRegNo, params STATUS[] statuses)
        {
            return this.getAllVehicles().Where(v => v.RegistrationNumber.Contains(vehRegNo) && statuses.Any(s => v.StatusId == (int)s)).ToList();
        }

        public System.Collections.IList GetVehiclesByVehRegNo(string vinNo)
        {
            return this.GetVehiclesByVehRegNo(vinNo, STATUS.ACTIVE, STATUS.INACTIVE, STATUS.SUSPECTED);
        }

        public bool DeleteVehicle(long vehicleId)
        {
            var vehicle = this.m_Context.Vehicles.Find(vehicleId);

            if (vehicle != null)
            {
                vehicle.StatusId = (int)STATUS.INACTIVE;
            }

            return this.m_Context.SaveChanges() > 0;
        }

        public string GetVehicleHistory(Vehicle vehicle)
        {
            List<AuditTrail> historyList = new List<AuditTrail>();
            List<object> jsonList = new List<object>();

            var vehicleEntityName = typeof(Vehicle).Name;
            var vehicleHis = this.m_Context.AuditTrails.Where(a => a.EntityName.Equals(vehicleEntityName) && a.EntityKey == vehicle.VehicleId).ToArray();

            historyList.AddRange(vehicleHis);

            var vehicleMaintEntityName = typeof(VehicleMaintenance).Name;
            var vehicleMaints = from m in this.m_Context.VehicleMaintenances
                                join a in this.m_Context.AuditTrails
                                    on m.VehicleMaintenanceId equals a.EntityKey
                                where a.EntityName.Equals(vehicleMaintEntityName)
                                && m.VehicleId == vehicle.VehicleId
                                select a;

            historyList.AddRange(vehicleMaints);

            var tripEntityName = typeof(Trip).Name;
            var trips = from t in this.m_Context.Trips
                        join a in this.m_Context.AuditTrails
                            on t.TripId equals a.EntityKey
                        where a.EntityName.Equals(tripEntityName)
                        && t.VehicleId == vehicle.VehicleId
                        select a;

            historyList.AddRange(trips);

            var cardEntityName = typeof(GarageCard).Name;
            var cards = from c in this.m_Context.GarageCards
                        join a in this.m_Context.AuditTrails
                            on c.GarageCardId equals a.EntityKey
                        where a.EntityName.Equals(cardEntityName)
                        && c.VehicleId == vehicle.VehicleId
                        select a;

            historyList.AddRange(cards);

            foreach (var v in historyList.OrderByDescending(h => h.Id))
            {
                object jsonObject = prepareJsonObject(v);

                if (jsonObject != null)
                {
                    jsonList.Add(jsonObject);
                }
            }

            return JsonConvert.SerializeObject(jsonList);
        }

        private object prepareJsonObject(AuditTrail v)
        {
            Dictionary<string, object> newData = null;
            Dictionary<string, object> oldData = null;

            if (v.NewData != null)
            {
                newData = JsonConvert.DeserializeObject<Dictionary<string, object>>(v.NewData);
            }

            if (v.OldData != null)
            {
                oldData = JsonConvert.DeserializeObject<Dictionary<string, object>>(v.OldData);
            }

            var filteredNew = sanitizerData(v.EntityName, newData);
            var filteredOld = sanitizerData(v.EntityName, oldData);

            if ((filteredNew != null && filteredNew.Count > 0) || (filteredOld != null && filteredOld.Count > 0))
            {
                var summary = string.Format("On {0} {1}, {2} was {3} by {4}", v.RevisionStamp.ToLongDateString(), v.RevisionStamp.ToLongTimeString(), v.EntityName, v.Action.ConvertActionCodeToName(), v.UserName);

                return new { summary, newData = filteredNew, oldData = filteredOld };
            }

            return null;
        }

        private Dictionary<string, object> sanitizerData(string entityName, Dictionary<string, object> data)
        {
            if (data == null || data.Count == 0)
            {
                return null;
            }

            Dictionary<string, object> pureData = null;

            var rawMetadata = this.getAuditMetadata();

            if (string.IsNullOrEmpty(rawMetadata))
            {
                return data;
            }

            var auditMetadata = JsonConvert.DeserializeObject<JObject>(rawMetadata);

            var entities = auditMetadata["entities"];

            if(entities == null)
            {
                return data;
            }

            var entity = entities[entityName];

            if (entity != null)
            {
                var properties = entity.ToList();

                if (properties.Count > 0)
                {
                    pureData = new Dictionary<string, object>();

                    foreach (var prop in properties)
                    {
                        var propertyName = prop["PropertyName"].Value<string>();
                        var propertyType = prop["PropertyType"].Value<string>();
                        var propertyTitle = prop["PropertyTitle"].Value<string>();

                        if (data.ContainsKey(propertyName))
                        {
                            object value = null;

                            if (propertyType.Equals("date"))
                            {
                                value = Convert.ToDateTime(data[propertyName]).ToString("dd/MM/yyyy");
                            }
                            else if (propertyType.StartsWith("complex:"))
                            {
                                var complexCols = propertyType.Split(':');

                                var type = Type.GetType(complexCols[1]);
                                var set = m_Context.Set(type);
                                var id = Convert.ToInt64(data[propertyName]);

                                var item = set.Find(id);

                                var propertInfo = type.GetProperty(complexCols[2]);
                                value = propertInfo.GetValue(item);
                            }
                            else
                            {
                                value = data[propertyName];
                            }
                            pureData.Add(propertyTitle, value);
                        }
                    }
                    return pureData;
                }
            }

            return data;
        }

        private string getAuditMetadata()
        {
            var setting = m_Context.ApplicationSettings.Where(s => s.Key.Equals("AuditTrailMetadata")).SingleOrDefault();

            if(setting != null)
            {
                return setting.Value;
            }

            return null;
        }



        public System.Collections.IList GetVehiclesByVinNo(string vinNo, params STATUS[] statuses)
        {
            return this.getAllVehicles().Where(v => v.VINNumber.Contains(vinNo) && statuses.Any(s => v.StatusId == (int)s)).ToList();
        }

        public System.Collections.IList GetVehiclesByVinNo(string vinNo)
        {
            return this.GetVehiclesByVinNo(vinNo, STATUS.ACTIVE, STATUS.INACTIVE, STATUS.SUSPECTED);
        }

        public System.Collections.IList GetVehiclesAvailableForTrip()
        {
            var _list_open_trip = (from opv in this.m_Context.Trips

                                   where (opv.PostInspectionComments == null || opv.PostInspector == null)
                                   select new { opv.VehicleId });

            return this.getAllVehicles().Where(v => !_list_open_trip.Any(t => t.VehicleId == v.VehicleId)).ToList();
        }
        public System.Collections.IList GetVehiclesAvailableForTrip(long trip, DateTime startDate, DateTime endDate)
        {
            var _list_open_trip = (from t in this.m_Context.Trips

                                   where (t.PostInspectionComments == null || t.PostInspector == null)
                                   && t.TripId != trip
                                   select new { t.VehicleId });

            return this.getAllVehicles().Where(v => !_list_open_trip.Any(t => t.VehicleId == v.VehicleId)).ToList();
        }

        public bool VehicleExits(Vehicle vehicle)
        {
            var items = this.m_Context.Vehicles.Where(vt => vt.RegistrationNumber == vehicle.RegistrationNumber).ToList();

            return items.Count > 0;
        }

        public Vehicle GetVehicle(string vehNo)
        {
            return this.m_Context.Vehicles.Where(v => v.RegistrationNumber.Equals(vehNo)).SingleOrDefault();
        }

        public Vehicle GetVehicle(long? vehicleId)
        {
            return this.m_Context.Vehicles.Where(v => v.VehicleId.Equals(vehicleId)).SingleOrDefault();
           
        }

        public System.Collections.IList GetVehicleMake()
        {
            return (from p in this.m_Context.VehicleMakes
                    orderby p.VehicleMakeName
                    select new {p.VehicleMakeName, p.VehicleMakeId}).ToList();        
        }

        public void AddVehicle(Vehicle vehicle)
        {
            this.m_Context.Vehicles.Add(vehicle);
            this.m_Context.SaveChanges();
        }

        public System.Collections.IList GetVehicleTypes()
        {


            return (from p in this.m_Context.VehicleTypes
                    orderby p.VehicleTypeName
                    select new { VehicleTypeName = p.VehicleTypeName, VehicleTypeId = p.VehicleTypeId }).ToList();
        }
       
        public bool UpdateVehicle(Vehicle veh)
        {
          
            
            var updatedVeh = (from v in this.m_Context.Vehicles
                                where v.RegistrationNumber == veh.RegistrationNumber  // orginal
                             // where v.VehicleId == veh.VehicleId//Edited so that Admin Head ofiice can edit Registration nuumber
                              select v).SingleOrDefault();


            if (updatedVeh != null)
            {
                updatedVeh.RegistrationNumber = veh.RegistrationNumber;
                updatedVeh.VehicleModelId = veh.VehicleModelId;
                updatedVeh.VINNumber = veh.VINNumber;
                updatedVeh.VehicleYear = veh.VehicleYear;
                updatedVeh.EngineCapacityId = veh.EngineCapacityId;
                updatedVeh.DiscRenewalDate = veh.DiscRenewalDate;
                updatedVeh.ServiceInterval = veh.ServiceInterval;
                updatedVeh.StatusId = veh.StatusId;
                updatedVeh.VehicleCondition = veh.VehicleCondition;
                updatedVeh.SupplyTypeId = veh.SupplyTypeId;
                updatedVeh.FuelTypeId = veh.FuelTypeId;
                updatedVeh.VehicleTypeId = veh.VehicleTypeId;
                updatedVeh.LastServiceOdoMeter = veh.LastServiceOdoMeter;

                return this.m_Context.SaveChanges() > 0;

            }

            return false;
        }
        
        public System.Collections.IList GetSupplyTypes()
        {
            return (from p in this.m_Context.SupplyTypes
                    orderby p.SupplyTypeName
                    select new { p.SupplyTypeName, p.SupplyTypeId}).ToList();
        }
        
        public System.Collections.IList GetVehicleFuelTypes()
        {
            return (from p in this.m_Context.FuelTypes
                    orderby p.FuelTypeName
                    select new { p.FuelTypeName, p.FuelTypeId}).ToList();
        }

        public System.Collections.IList GetVehicleEngineCapacity()
        {
            return (from p in this.m_Context.EngineCapicities
                    orderby p.EngineCapicityName
                    select new { p.EngineCapicityName, p.EngineCapicityId}).ToList();
        }
        
        public List<Vehicle> AvailableVehicles()
        {
            var activeVehs = (from Trip t in m_Context.Trips
                              where t.PostInspectionComments == null && t.EndOdoMeter == null
                              select t.Vehicle);

            return  this.getAllVehicles().Except(activeVehs).ToList();
        }
    }
}