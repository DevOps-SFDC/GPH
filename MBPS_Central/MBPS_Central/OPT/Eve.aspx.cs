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
    public partial class Eve : System.Web.UI.Page
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
            //DataTable dummy = new DataTable();
            //dummy.Columns.Add("Worktype");
            //dummy.Columns.Add("Reference");
            //dummy.Columns.Add("Count / Volume");
            //dummy.Columns.Add("Start");
            //dummy.Columns.Add("End");
            //dummy.Columns.Add("Elapsed");
            //dummy.Rows.Add();
            //gridProcess.DataSource = dummy;
            //gridProcess.DataBind();
            //gridProcess.UseAccessibleHeader = true;
            //gridProcess.HeaderRow.TableSection = TableRowSection.TableHeader;

            //DataTable dummy1 = new DataTable();
            //dummy1.Columns.Add("Worktype");
            //dummy1.Columns.Add("Reference");
            //dummy1.Columns.Add("Count / Volume");
            //dummy1.Columns.Add("Start");
            //dummy1.Columns.Add("End");
            //dummy1.Columns.Add("Elapsed");
            //dummy1.Rows.Add();
            //gridPrevious.DataSource = dummy1;
            //gridPrevious.DataBind();
            //gridPrevious.UseAccessibleHeader = true;
            //gridPrevious.HeaderRow.TableSection = TableRowSection.TableHeader;
            //gridPrevious.HeaderRow.Visible = false;
           
            //DataTable dummy2 = new DataTable();
            //dummy2.Columns.Add("TaskName");
            //dummy2.Columns.Add("Start");
            //dummy2.Columns.Add("End");
            //dummy2.Columns.Add("Elapsed");
            //dummy2.Rows.Add();
            //gridnpttask.DataSource = dummy2;
            //gridnpttask.DataBind();

            //DataTable dummy3 = new DataTable();
            //dummy3.Columns.Add("TaskName");
            //dummy3.Columns.Add("Start");
            //dummy3.Columns.Add("End");
            //dummy3.Columns.Add("Elapsed");
            //dummy3.Rows.Add();
            //grdnpt.DataSource = dummy3;
            //grdnpt.DataBind();
        }
   //DISPLAY    
        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
            ddlTeams.DataSource = dt;
            ddlTeams.Items.Add("Select Types...");
            ddlTeams.DataValueField = dt.Columns[4].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayNPTtask(List<string> _arr)
        {
            DataSet ds = new DataSet();
            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());

            try
             {
                ds.Tables.Add(_opt.DisplayNptTask());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayParentWT(List<string> _arr)
        {
            DataSet ds = new DataSet();
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            
            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());
            
            try
            {
                ds.Tables.Add(_opt.DisplayParentWorktypes());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayWorktype(List<string> _arr)
        {
            DataSet ds = new DataSet();
            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.ParentWorktypeID = Convert.ToInt32(_arr[0]);

            try
            {
                ds.Tables.Add(_opt.DisplayWorktypes());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }



        

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayNPTMetricsX(List<string> _arr)
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("TaskName");
            dummy.Columns.Add("Start");
            dummy.Columns.Add("End");
            dummy.Columns.Add("Elapsed");

            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorkdayID = Convert.ToInt32(_arr[0]);
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.DisplayNPTMetricsX());
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
    //ADD
        

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveNPTMetrics(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.TeamTaskID = Convert.ToInt32(_arr[0].ToString());
            _opt.WorkdayID = Convert.ToInt32(_arr[1].ToString());
            _opt.Remarks = _arr[2].ToString();

            return _opt.InsertNPTMetrics();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string pauseWtypeMetric(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorktypeMetricsID = Convert.ToInt64(_arr[0].ToString());

            return _opt.pauseWorktypeMetrics();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string resumeWtypeMetric(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorktypeMetricsID = Convert.ToInt64(_arr[0].ToString());
            _opt.WorkdayID = Convert.ToInt32(_arr[1].ToString());

            return _opt.resumeWorktypeMetrics();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string stopWtypeMetric(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorktypeMetricsID = Convert.ToInt64(_arr[0].ToString());
            _opt.WorkdayID = Convert.ToInt32(_arr[1].ToString());

            return _opt.stopWorktypeMetrics();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string stopNptMetric(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.NonProcessMetricsID = Convert.ToInt64(_arr[0].ToString());
            _opt.WorkdayID = Convert.ToInt32(_arr[1].ToString());

            return _opt.stopNptMetrics();
        }


        #region "PROCESSING SERVICES"
        // PROCESSING SERVICES //

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveWorktypeMetrics(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.TeamWorktypeID = Convert.ToInt32(_arr[0].ToString());
            _opt.WorkdayID = Convert.ToInt32(_arr[1].ToString());
            _opt.Count = Convert.ToDecimal(_arr[2].ToString());
            _opt.Reference = _arr[3].ToString();
            _opt.Remarks = _arr[4].ToString();
            _opt.Disposition = _arr[5].ToString();

            return _opt.InsertWorktypeMetrics();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayWorktypeMetrics(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorkdayID = Convert.ToInt32(_arr[0]);
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.DisplayWorktypesMetrics(false));
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayWorktypeMetricsX(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorkdayID = Convert.ToInt32(_arr[0]);
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.DisplayWorktypesMetrics(true));
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveRunStopMetric(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorktypeMetricsID = Convert.ToInt64(_arr[0].ToString());
            _opt.TeamWorktypeID = Convert.ToInt32(_arr[1].ToString());
            _opt.Reference = _arr[2].ToString();
            _opt.Count = Convert.ToDecimal(_arr[3].ToString());
            _opt.Disposition = _arr[4].ToString();
            _opt.Remarks = _arr[5].ToString();

            return _opt.saveRunStopMetric(Convert.ToBoolean(_arr[6].ToString()));
        }

        // END OF PROCESSING SERVICES //
        #endregion

        #region "NON PROCESSING SERVICES"
        // NON PROCESSING SERVICES //

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayNPTMetrics(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorkdayID = Convert.ToInt32(_arr[0]);
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.DisplayNPTMetrics());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        #endregion

        #region "PROCESSING OTHERS"
        // OTHER SERVICES //

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayEntryDetails(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.OPT _opt = new SystemObjects.OPT();
            _opt.WorktypeMetricsID = Convert.ToInt64(_arr[0]);
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_opt.displayEntryDetails());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        // END OF OTHER SERVICES //
        #endregion

        
    }
}