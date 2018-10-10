using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public class BasePage : Page
    {
        protected OperationMode? Mode
        {
            get
            {
                if (ViewState["ModeFlag"] != null)
                {
                    return (OperationMode)Convert.ToInt16(ViewState["ModeFlag"]);
                }

                return null;
            }
            set
            {
                ViewState["ModeFlag"] = value;
            }
        }
        
        protected string UserName
        {
            get
            {
                return this.Context.User.Identity.Name;
            }
        }

        protected string ManagerAddress
        {
            get
            {
                return "mokwenakgwete@gmail.com";
            }
        }

        protected string ManagerName
        {
            get
            {
                return "Mokwena Kgwete";
            }
        }

        public DateTime Today
        {
            get
            {
                return DateTime.UtcNow;
            }
        }

        public string DateFormat
        {
            get
            {
                return "dd/MM/yyyy";
            }
        }

        protected void ShowMessage(string message)
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


        // Test if is going to work 
        public void ShowAlertAndNavigate(string msg, string loc)
        {
            string alert_redirect_Script = string.Format(@"<script type=""text/javascript"">alert('{0}'); window.location='" + loc.Replace("'", "").Replace("~/", "") + "';</script>", msg);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alertredirectscript", alert_redirect_Script, false);
        }

        protected string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

        protected string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        protected void HandleException(Exception ex)
        {
           ShowMessage(Messages.UNEXPECTED_ERROR_OCCURRED);
        }

        protected void ServiceWarning(long? vehicleId)
        {
            var vehicle = new VehicleRepository().GetVehicle(vehicleId);

            if (vehicle != null)
            {
                if (vehicle.CurrentOdoMeter >= vehicle.LastServiceOdoMeter + vehicle.ServiceInterval )
                {
                    ShowMessage(string.Format("The selected vehicle, {0}, is due for service.", vehicle.RegistrationNumber.Trim()));
                }
            }

        }

        protected void RedirectToLogin()
        {
            Response.Redirect(Pages.LOGIN_SCREEN, false);
        }

        protected void RedirectPage(string pageUrl)
        {
            Response.Redirect(String.Format("{0}", pageUrl), false);
        }

        protected void RedirectPage(string pageUrl, string id)
        {
            Response.Redirect(String.Format("{0}?id={1}", pageUrl, HttpUtility.UrlEncode(this.Encrypt(id))), false);
        }

        protected override void OnLoad(EventArgs e)
        {
            try
            {
                if (!this.Page.AppRelativeVirtualPath.Equals(Pages.LOGIN_SCREEN))
                {
                    string strPreviousPage = "";
                    if (Request.UrlReferrer != null)
                    {
                        strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
                    }
                    if (string.IsNullOrEmpty(strPreviousPage) || string.IsNullOrEmpty(this.UserName))
                    {
                        this.RedirectToLogin();
                        return;
                    }
                }

                if (Request.QueryString["id"] != null)
                {
                    RedirectId = HttpUtility.UrlDecode(Decrypt(Request.QueryString["id"]));
                }
                else
                {
                    this.RedirectId = string.Empty;
                }

                base.OnLoad(e);

            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }

        public string RedirectId { get; set; }

    }
}