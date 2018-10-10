using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Extensions
{
    public static class ActionCodeToName
    {
        public static string ConvertActionCodeToName(this string action)
        {
            if (action.Equals("I"))
            {
                return "added";
            }
            else if (action.Equals("U"))
            {
                return "changed";
            }
            else if (action.Equals("D"))
            {
                return "deleted";
            }
            
            return string.Empty;
        }

    }
}