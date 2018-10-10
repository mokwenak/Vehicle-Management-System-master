using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;
namespace BMTemplate
{
	public partial class TripsAvailableVehicles : BasePage
	{

        private VehicleRepository m_Repository = new VehicleRepository();
        protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                LoadAvailableVehicles();
            }
		}
       
        protected void grdVehicles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                LoadAvailableVehicles();
                grdVehicles.PageIndex = e.NewPageIndex;
                grdVehicles.DataBind();
            }
            catch(Exception ex)
            {
                this.HandleException(ex);
            }

        }
        private void LoadAvailableVehicles()
        {
            this.grdVehicles.DataSource = m_Repository.AvailableVehicles().OrderBy(v => v.RegistrationNumber).ToList();
            this.grdVehicles.DataBind();
        }
	}
}
 