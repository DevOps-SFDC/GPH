using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MBPS_Central.SystemObjects;
using System.Web.Services;
using System.Web.Script.Services;

namespace MBPS_Central.OPT
{
    public partial class EveSettings : System.Web.UI.Page
    {
        MBPSObj _mbps = new MBPSObj();
        SystemObjects.OPT _opt = new SystemObjects.OPT();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["WDID"].ToString().Equals(string.Empty))
                {
                    Response.Redirect("~/Default.aspx");
                }
                DataTable teams = (DataTable)Session["MyTeams"];
                foreach (DataRow drow in teams.Rows)

                    if (!IsPostBack)
                    {
                        dummyTable();
                        displayTeams();
                        
                    }
            }
            catch (Exception)
            {
                Session["ErrMsg"] = "Session Expired!";
                Response.Redirect("~/Default.aspx");
                throw;
            }
            finally
            {
                dummyTable();

            }
        }

        private void dummyTable()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("Parent Worktype");
            dummy.Columns.Add("Status");
            dummy.Rows.Add();
            gridparent.DataSource = dummy;
            gridparent.DataBind();

            DataTable dummy1 = new DataTable();
            dummy1.Columns.Add("Parent Worktype");
            dummy1.Columns.Add("Worktype");
            dummy1.Columns.Add("Status");
            dummy1.Columns.Add("Volume");
            dummy1.Rows.Add();
            gridworktype.DataSource = dummy1;
            gridworktype.DataBind();

            //DataTable dummy2 = new DataTable();
            //dummy2.Columns.Add("Parent Worktype");
            //dummy2.Columns.Add("Worktype");
            //dummy2.Columns.Add("Jan");
            //dummy2.Columns.Add("Feb");
            //dummy2.Columns.Add("Mar");
            //dummy2.Columns.Add("Apr");
            //dummy2.Columns.Add("May");
            //dummy2.Columns.Add("Jun");
            //dummy2.Columns.Add("Jul");
            //dummy2.Columns.Add("Aug");
            //dummy2.Columns.Add("Sep");
            //dummy2.Columns.Add("Oct");
            //dummy2.Columns.Add("Nov");
            //dummy2.Columns.Add("Dec");
            //dummy2.Rows.Add();
            //gridspt.DataSource = dummy2;
            //gridspt.DataBind();

            DataTable dummy3 = new DataTable();
            dummy3.Columns.Add("Parent Worktype");
            dummy3.Columns.Add("Worktype");
            dummy3.Columns.Add("Business Unit");
            dummy3.Columns.Add("Target Unit");
            dummy3.Rows.Add();
            gridupdatespt.DataSource = dummy3;
            gridupdatespt.DataBind();

            DataTable dummy4 = new DataTable();
            dummy4.Columns.Add("Task Name");
            dummy4.Columns.Add("Status");
            dummy4.Rows.Add();
            gridnpt.DataSource = dummy4;
            gridnpt.DataBind();
        }
        protected void ddlTeams_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
            ddlTeams.DataSource = dt;
            //dt = _mbps.getLoginTeams();
            ddlTeams.Items.Add("Select Team...");
            ddlTeams.DataValueField = dt.Columns[4].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
        }

   
//Display Parent, Worktypes, NPT and Spt
        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayparentWT(List<string> _arr)
        {
            DataSet ds = new DataSet();
            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());

            try
            {
                ds.Tables.Add(_opt.DisplaySettingParentWorktypes());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayparentmodal(List<string> _arr)
        {
            DataSet ds = new DataSet();
            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());

            try
            {
                ds.Tables.Add(_opt.DisplaySettingParentWorktypes());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayParentWorktype(List<string> _arr)
        {

            DataTable dummy = new DataTable();
            dummy.Columns.Add("Worktype");
            dummy.Columns.Add("Status");

           
            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.DisplayParentWorktypes());
                if (dummy.Rows.Count < 1)
                {
                    dummy.Rows.Add();
                }
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayWorktype(List<string> _arr)
        {

            DataTable dummy = new DataTable();
            dummy.Columns.Add("Parent Worktype");
            dummy.Columns.Add("Worktype");
            dummy.Columns.Add("Status");
            dummy.Columns.Add("Volume");

            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.OPTSettingDisplayWorktypes());
                if (dummy.Rows.Count < 1)
                {
                    dummy.Rows.Add();
                }
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayNpt(List<string> _arr)
        {

            DataTable dummy = new DataTable();
            dummy.Columns.Add("Task Name");
            dummy.Columns.Add("Status");

            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.DisplayNptTask());
                if (dummy.Rows.Count < 1)
                {
                    dummy.Rows.Add();
                }
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayspt(List<string> _arr)
        {

            DataTable dummy = new DataTable();
            dummy.Columns.Add("Parent Worktype");
            dummy.Columns.Add("Worktype");
            dummy.Columns.Add("Business Unit");
            dummy.Columns.Add("Target Unit");
            
            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamWorktypeID = Convert.ToInt32(_arr[0].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.DisplaySPT());
                if (dummy.Rows.Count < 1)
                {
                    dummy.Rows.Add();
                }
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

//Insert Parent, Worktypes and NPT
        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveParentWorktype(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.ParentWorktypeName = _arr[0].ToString();
            _opt.TeamID = Convert.ToInt32(_arr[1].ToString());
          
            _opt.CreatedBy = _arr[2].ToString();

            return _opt.InsertParentWT();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveNpttask(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.TeamTaskName = _arr[0].ToString();
            _opt.TeamID = Convert.ToInt32(_arr[1].ToString());
            _opt.CreatedBy = _arr[2].ToString();

            return _opt.InsertNPT();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveWorktypes(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.ParentWorktypeID = Convert.ToInt32(_arr[0].ToString());
            _opt.TeamID = Convert.ToInt32(_arr[1].ToString());
            _opt.WorktypeName = _arr[2].ToString();
            _opt.CreatedBy = _arr[3].ToString();

            return _opt.InsertWorktypes();
        }

 //Update Parent, Worktype, NPT and SPT
        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateParentWorktype(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.TeamParentWorktypeID = Convert.ToInt32(_arr[0].ToString());
            _opt.ParentWorktypeName = _arr[1].ToString();
            _opt.IsActive = Convert.ToInt32(_arr[2].ToString());

            return _opt.UpdateParentWT();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateNPT(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.TeamTaskID = Convert.ToInt32(_arr[0].ToString());
            _opt.TeamTaskName = _arr[1].ToString();
            _opt.IsActive = Convert.ToInt32(_arr[2].ToString());

            return _opt.UpdateNPT();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateWorktype(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.TeamWorktypeID = Convert.ToInt32(_arr[0].ToString());
            _opt.ParentWorktypeID = Convert.ToInt32(_arr[1].ToString());
            _opt.WorktypeName = _arr[2].ToString();
            _opt.IsActive = Convert.ToInt32(_arr[3].ToString());
            _opt.IsTransactionVolume = Convert.ToInt32(_arr[4].ToString());

            return _opt.UpdateWorktype();
        }
    }

}
