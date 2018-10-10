using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BMTemplate
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.SYSTEM_ADMIN) == true)
            {
                lnkUserMenu.Visible = true;
                //Response.Redirect("UsersUpdateList.aspx", false);

            }


            /* 
             * var user = new UserRepository().GetUser(CurrentUser.GetUserName());
            var OfficeTypeId = user.Office.OfficeTypeId;

             * if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.SYSTEM_ADMIN) && (OfficeTypeId == (int)Enums.OfficeTypes.HEADOFFICE) == true)
              {
                 lnkUserMenu.Visible = true;
                 //Response.Redirect("UsersUpdateList.aspx", false);

             }
            else if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.SYSTEM_ADMIN) == true)
             {
                 lnkUserMenu.Visible = true;
                 A2.Visible = false;
                 A5.Visible = false;
                 A9.Visible = false;
             }
             else if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.OFFICER) == true)
             {
                 A2.Visible = false;
                 A5.Visible = false;
                 A9.Visible = false;
             }
             else if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.FLEET_MANAGER) == true)
             {
                 A2.Visible = false;
                 A5.Visible = false;
                 A9.Visible = false;
             }*/

        }
    }
}
