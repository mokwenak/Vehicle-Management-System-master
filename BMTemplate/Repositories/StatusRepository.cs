using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories
{
    public class StatusRepository : BaseRepository
    {
        public object GetAll()
        {
            return  m_Context.Statuses.ToList();
        }
    }
}