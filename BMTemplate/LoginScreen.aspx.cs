using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.DirectoryServices;
using System.DirectoryServices.ActiveDirectory;
using System.DirectoryServices.AccountManagement;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FormsAuth;
using BMTemplate.Repositories;


namespace BMTemplate
{
    public partial class LoginScreen : Page
    {

        Global oGlobal = new Global();

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void LoginButton_Click(object sender, ImageClickEventArgs e)
        {
            MembershipUser u;

            string username = Login1.UserName.ToString().ToLower();

            Session["username"] = username;

            try
            {   ////////////////ASPNET default authentication

                u = Membership.GetUser(username);

                if (Membership.ValidateUser(username, Login1.Password.ToString()))
                {
                    FormsAuthentication.SetAuthCookie(username, false);
                    // if the User is Admin direct the user to the Admin Page or Direct the User to the Fleet Official User.
                    // Select role and Office and Province  

                    Response.Redirect("Default.aspx", false);

                }
                else
                {
                    Login1.InstructionText = "Authentication did not succeed. Check user name and password.";
                    ShowMessage(Messages.CREDENTIALS);
                }

            }
            catch (Exception ex)
            {


                ShowMessage(Messages.CREDENTIALS);
                Login1.InstructionText = "Error authenticating. " + ex.Message;
            }

        }

        private void ShowMessage(string message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
}