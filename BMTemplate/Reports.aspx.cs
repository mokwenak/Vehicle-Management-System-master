using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
using BMTemplate.Enums;

namespace BMTemplate
{
    public partial class Reports : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.LoadReports();
            }
        }

        private void LoadReports()
        {

            List<object> reports = new List<object>();
            int? prevCat = 0;

            foreach (var report in new ReportRepository().GetReports())
            {

                if (prevCat != report.CategoryId)
                {
                    reports.Add(new { CategoryName = report.Category.CategoryDescripion, ReportDesc = string.Empty, ReportPath = string.Empty });
                    prevCat = report.CategoryId ;
                }
                reports.Add(new { CategoryName = string.Empty, ReportDesc = report.ReportDescription, ReportPath = report.ReportPath});

            }

            this.grdReports.DataSource = reports;
            this.grdReports.DataBind();
        }

        protected void grdReports_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.RedirectPage(Pages.REPORT_VIEW, grdReports.SelectedValue.ToString());
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }
        }
    }
}