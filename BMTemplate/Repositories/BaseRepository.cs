using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories
{
    public class BaseRepository
    {
        protected Vehicle_ManagementEntities m_Context = new Vehicle_ManagementEntities();
      
    }
}