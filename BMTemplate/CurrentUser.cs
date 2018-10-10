using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate
{
    public static class CurrentUser
    {
        public static string GetUserName()
        {
            return HttpContext.Current.User.Identity.Name;
        }
    }
}