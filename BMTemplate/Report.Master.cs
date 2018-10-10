using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BMTemplate
{
    public partial class ReportMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity != null && HttpContext.Current.User != null && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, Enums.RoleNames.SYSTEM_ADMIN) == true)
            {
                lnkUserMenu.Visible = true;
                //Response.Redirect("UsersUpdateList.aspx", false);
            }
        }
    }
}
