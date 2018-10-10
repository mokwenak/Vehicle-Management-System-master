using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Metadata.Edm;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace BMTemplate
{
    partial class Vehicle_ManagementEntities
    {
        private List<AuditTrail> auditTrailList;
        private List<DbEntityEntry> changes;
         
        public enum AuditAction
        {
            I,
            U,
            D
        }

        public override int SaveChanges()
        {
            int changeCount = 0;
            auditTrailList = new List<AuditTrail>();
            changes = ChangeTracker.Entries()
                .Where(p => p.State == EntityState.Added
                || p.State == EntityState.Deleted || p.State == EntityState.Modified).ToList();

            GenerateAuditTrailList();

            UpdateCurrentValues();

            changeCount = base.SaveChanges();

            AttachAuditTrailEntities();
            
            changeCount += base.SaveChanges();

            return changeCount;
        }

        private void GenerateAuditTrailList()
        {
            var timestamp = DateTime.Now;

            foreach (var change in changes)
            {
                AuditTrail auditTrail = new AuditTrail();
                auditTrail.RevisionStamp = timestamp;
                auditTrail.UserName = CurrentUser.GetUserName();
                auditTrail.EntityName = ObjectContext.GetObjectType(change.Entity.GetType()).Name;

                var keys = this.GetKeyNames(ObjectContext.GetObjectType(change.Entity.GetType()));

                if (change.State == EntityState.Added)
                {
                    auditTrail.Action = AuditAction.I.ToString();
                }
                else //entity state is not Added
                {
                    var values = GetOriginalValues(change);

                    if (values.Count > 0)
                    {
                        auditTrail.OldData = JsonConvert.SerializeObject(values);
                    }

                    if (change.State == EntityState.Deleted)
                    {
                        auditTrail.Action = AuditAction.D.ToString();
                    }

                    if (change.State == EntityState.Modified)
                    {
                        auditTrail.Action = AuditAction.U.ToString();
                    }
                }

                auditTrailList.Add(auditTrail);
            }
        }

        private Dictionary<string, object> GetOriginalValues(DbEntityEntry change)
        {
            var obj = new Dictionary<string, object>();

            foreach (var prop in change.OriginalValues.PropertyNames)
            {
                if (change.State == EntityState.Deleted)
                {
                    obj.Add(prop, change.OriginalValues[prop]);
                }
                else if (change.CurrentValues[prop] == null && change.OriginalValues[prop] == null)
                {
                    continue;
                }
                else if (change.CurrentValues[prop] != null && change.OriginalValues[prop] == null)
                {
                    obj.Add(prop, change.OriginalValues[prop]);
                }
                else if (change.CurrentValues[prop] == null && change.OriginalValues[prop] != null)
                {
                    obj.Add(prop, change.OriginalValues[prop]);
                }
                else if (change.CurrentValues[prop].Equals( change.OriginalValues[prop]) == false)
                {
                    obj.Add(prop, change.OriginalValues[prop]);
                }
            }

            return obj;
        }

        private Dictionary<string, object> GetCurrentValues(DbEntityEntry change)
        {
            var obj = new Dictionary<string, object>();

            foreach (var prop in change.CurrentValues.PropertyNames)
            {
                if(change.State == EntityState.Added)
                {
                    obj.Add(prop, change.CurrentValues[prop]);
                }
                else if (change.CurrentValues[prop] == null && change.OriginalValues[prop] == null)
                {
                    continue;
                }
                else if (change.CurrentValues[prop] != null && change.OriginalValues[prop] == null)
                {
                    obj.Add(prop, change.CurrentValues[prop]);
                }
                else if (change.CurrentValues[prop] == null && change.OriginalValues[prop] != null)
                {
                    obj.Add(prop, change.CurrentValues[prop]);
                }
                else if (change.CurrentValues[prop].Equals(change.OriginalValues[prop]) == false)
                {
                    obj.Add(prop, change.CurrentValues[prop]);
                }
            }

            return obj;
        }

        private void UpdateCurrentValues()
        {
            for (int i = 0; i < changes.Count; i++)
            {
                if (changes[i].State != EntityState.Detached && changes[i].State != EntityState.Deleted)
                {
                    var values = GetCurrentValues((changes[i]));

                    if (values.Count > 0)
                    {
                        auditTrailList[i].NewData = JsonConvert.SerializeObject(values);
                    }
                }
            }
        }

        private void AttachAuditTrailEntities()
        {
            for (int i = 0; i < changes.Count; i++)
            {
                var change = changes[i];
                var auditTrail = auditTrailList[i];
                var keys = this.GetKeyNames(ObjectContext.GetObjectType(change.Entity.GetType()));

                if (change.CurrentValues != null)
                {
                    auditTrail.EntityKey = Convert.ToInt64(change.CurrentValues[keys[0]]);
                }
                else if (change.OriginalValues != null)
                {
                    auditTrail.EntityKey = Convert.ToInt64(change.OriginalValues[keys[0]]);
                }

                if (auditTrail.NewData != null || auditTrail.OldData != null)
                {
                    this.AuditTrails.Add(auditTrailList[i]);
                }
            }
        }

        public string[] GetKeyNames(Type entityType)
        {
            var metadata = ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace;

            // Get the mapping between CLR types and metadata OSpace
            var objectItemCollection = ((ObjectItemCollection)metadata.GetItemCollection(DataSpace.OSpace));

            // Get metadata for given CLR type
            var entityMetadata = metadata
                    .GetItems<EntityType>(DataSpace.OSpace)
                    .Single(e => objectItemCollection.GetClrType(e) == entityType);

            return entityMetadata.KeyProperties.Select(p => p.Name).ToArray();
        }

    }
}