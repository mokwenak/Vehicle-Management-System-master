using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class ReportView : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (!string.IsNullOrEmpty(this.RedirectId))
                    {
                        var reportServerURL = ConfigurationManager.AppSettings["ReportServerURL"];


                        if (string.IsNullOrEmpty(reportServerURL))
                        {
                            this.ShowAlertAndNavigate(Messages.REPORT_SERVER_PATH_NOT_FOUND, Pages.REPORTS);
                            return;
                        }

                        var user = new UserRepository().GetUser(this.UserName);

                        this.Reportviewver.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
                        this.Reportviewver.ServerReport.ReportServerUrl = new Uri(reportServerURL);
                        this.Reportviewver.ServerReport.ReportPath = this.RedirectId;
                        this.Reportviewver.KeepSessionAlive = false;
                        this.Reportviewver.AsyncRendering = false;

                        var queryOffice = from p in this.Reportviewver.ServerReport.GetParameters()
                                          where p.Name.Equals("OFFICE_ID")
                                          select p.Name;
                        if (queryOffice.Any())
                        {
                            this.Reportviewver.ServerReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("OFFICE_ID", Convert.ToString(user?.OfficeId ?? 0)));
                        }

                        var queryUser = from p in this.Reportviewver.ServerReport.GetParameters()
                                        where p.Name.Equals("USER_ID")
                                        select p.Name;
                        if (queryUser.Any())
                        {
                            this.Reportviewver.ServerReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("USER_ID", Convert.ToString(user?.UserId ?? 0)));
                        }

                        this.Reportviewver.ServerReport.Refresh();

                    }
                    else
                    {
                        this.ShowAlertAndNavigate(Messages.REPORT_NAME_NOT_FOUND, Pages.REPORTS);
                    }
                }
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}