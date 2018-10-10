using BMTemplate.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories
{
    public class OfficeRepository: BaseRepository
    {
        public List<Office> GetOffices()
        {
            return this.m_Context.Offices.ToList();
        }
        public List<Office> GetOfficesByProv(int provId)
        {
            return this.m_Context.Offices.Where(o => o.ProvinceId == provId && o.OfficeTypeId != (int)OfficeTypes.HEADOFFICE).ToList();
        }

        public Office GetOffice(int officeId)
        {
            return this.m_Context.Offices.Where(o => o.OfficeId == officeId).SingleOrDefault();
        }

    }
}