using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using Microsoft.Reporting.WebForms;
using Microsoft.SqlServer.Server;
using Microsoft.ReportingServices;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class TripAuthoritySlip : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!this.IsPostBack)
                {
                    if (string.IsNullOrEmpty(this.RedirectId))
                    {
                        return;
                    }

                    long tripId;

                    if (!long.TryParse(this.RedirectId, out tripId))
                    {
                        return;
                    }

                    var reportServerURL = ConfigurationManager.AppSettings["ReportServerURL"];

                    if (string.IsNullOrEmpty(reportServerURL))
                    {
                        this.ShowMessage(Messages.REPORT_SERVER_PATH_NOT_FOUND);
                        return;
                    }

                    var tripAuthorityReport = ConfigurationManager.AppSettings["TripAuthorityReportURL"];

                    if (string.IsNullOrEmpty(tripAuthorityReport))
                    {
                        this.ShowMessage(Messages.TRIP_AUTHORITY_REPORT_PATH_NOT_FOUND);
                        return;
                    }


                    this.PrntViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
                    this.PrntViewer.ServerReport.ReportServerUrl = new Uri(reportServerURL);
                    this.PrntViewer.ServerReport.ReportPath = tripAuthorityReport;
                    this.PrntViewer.KeepSessionAlive = false;
                    this.PrntViewer.AsyncRendering = false;

                    var param = (from p in this.PrntViewer.ServerReport.GetParameters()
                                 where p.Name.Equals("TripId")
                                 select p).SingleOrDefault();

                    if (param != null)
                    {
                        this.PrntViewer.ServerReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("TripId", tripId.ToString()));

                        string mimeType, encoding, extension, deviceInfo;

                        string[] streamids;

                        Microsoft.Reporting.WebForms.Warning[] warnings;

                        string format = "PDF";

                        deviceInfo = "<DeviceInfo>" + "<SimplePageHeaders>True</SimplePageHeaders>" + "</DeviceInfo>";

                        byte[] bytes = PrntViewer.ServerReport.Render(format, deviceInfo, out mimeType, out encoding, out extension, out streamids, out warnings);

                        Response.Clear();

                        Response.ContentType = "application/pdf";
                        Response.AddHeader("Content-disposition", "filename= PrintAuthority.pdf");
                        Response.OutputStream.Write(bytes, 0, bytes.Length);
                        Response.OutputStream.Flush();
                        Response.OutputStream.Close();
                        Response.Flush();
                        Response.Close();
                    }
                }
                else
                {
                    this.ShowMessage(Messages.TRIP_AUTHORITY_REPORT_PATH_NOT_FOUND);
                    return;
                }
            }
            catch (Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}