using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Extensions
{
    public static class OfficesToIds
    {
        public static List<int> ToIds(this List<Office> offices)
        {
            return offices.Select<Office, int>(new Func<Office, int>(o => o.OfficeId)).ToList(); 
        }
    }
}