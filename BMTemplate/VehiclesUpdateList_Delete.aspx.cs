using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BMTemplate.Repositories;

namespace BMTemplate
{
    public partial class CodeListMaintanace : BasePage
    {
        
        private VehicleRepository m_Repository = new VehicleRepository();
        private OperationMode? Mode
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
       
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
         
            string strPreviousPage = "";
            if (Request.UrlReferrer != null)
            {
                strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
            }
            if (strPreviousPage == "")
            {
                Response.Redirect("~/LoginScreen.aspx");
            }
        
            if(!IsPostBack)
            {
             LoadVehicleMakeModel();
            }
               
        }

        
        private void LoadVehicleMakeModel()
        {

            cboVehMake.DataSource = new VehicleRepository().GetVehicleMake();
            cboVehMake.DataBind();

            cboVehMake.Items.Insert(0,"");

        }
  
        private void ClearFields()
        {
            txtVehModel.Text = string.Empty;
            txtVehMake.Text = string.Empty;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
        
            
        }

        protected void savebtn_Click(object sender, EventArgs e)
        {
           // string selected_vehmake = cboVehMake.SelectedItem.Text.ToString();
            string txtmodel = txtVehMake.Text.ToString();
            int makeId = Convert.ToInt32(cboVehMake.SelectedValue); // MakeID
            int maximodelId = this.m_Repository.countmaxmodel();
            this.m_Repository.insertrecordmodel(makeId, maximodelId, txtmodel); 
        }

        protected void addmakebtn_Click(object sender, EventArgs e)
        {
          // Get the max unique ID 
          int maxid = this.m_Repository.countmaxmake(); 
          // Insert the record 
          this.m_Repository.insertrecord(maxid,txtVehModel.Text);       
          this.ShowMessage(Messages.RECORD_INSERTED_SUCESSFULLY);
          this.ClearFields();
        }

        protected void cboVehMake_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}