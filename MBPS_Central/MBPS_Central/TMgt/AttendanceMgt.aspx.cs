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

namespace MBPS_Central.TMgt
{
    public partial class AttendanceMgt : System.Web.UI.Page
    {
        MBPSObj _mbps = new MBPSObj();
        TeamMgt _team = new TeamMgt();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["WDID"].ToString().Equals(string.Empty))
                {
                    Response.Redirect("~/Default.aspx");
                }

                if (!IsPostBack)
                {
                    displayTeams();
                    displayStaff();
                    dummyTable();
                    displayMonthYear();
                    displayShiftTemplate();
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

            }
        }

        private void dummyTable()
        {
            //DataTable dummy = new DataTable();
            //dummy.Columns.Add("Employee", typeof(String));
            //dummy.Columns.Add("Leave", typeof(String));
            //dummy.Columns.Add("Date", typeof(DateTime));
            //dummy.Columns.Add("Count", typeof(Decimal));
            //dummy.Columns.Add("Reason", typeof(String));
            //dummy.Rows.Add();
            //gridLeaves.DataSource = dummy;
            //gridLeaves.DataBind();

            DataTable dummy1 = new DataTable();
            dummy1.Columns.Add("WorkdayID", typeof(Int64));
            dummy1.Columns.Add("Last Name", typeof(String));
            dummy1.Columns.Add("First Name", typeof(String));
            dummy1.Columns.Add("Position", typeof(String));
            dummy1.Columns.Add("Department", typeof(String));
            dummy1.Columns.Add("Date Hired", typeof(DateTime));
            dummy1.Columns.Add("AI (%)", typeof(Int32));
            dummy1.Rows.Add();
            gridAI.DataSource = dummy1;
            gridAI.DataBind();

            DataTable dummy2 = new DataTable();
            dummy2.Columns.Add("Date", typeof(DateTime));
            dummy2.Columns.Add("Day", typeof(String));
            dummy2.Columns.Add("Present", typeof(Decimal));
            dummy2.Columns.Add("SL", typeof(Decimal));
            dummy2.Columns.Add("EL", typeof(Decimal));
            dummy2.Rows.Add();
            //gridAttendance.DataSource = dummy2;
            //gridAttendance.DataBind();
        }

        private void displayShiftTemplate()
        {
            DataSet ds = new DataSet();
            ds = _team.displayShiftTemplate();
            ddlTimeShift.Items.Add("Please Select Time Shift");
            ddlTimeShift.DataSource = ds.Tables[0];
            ddlTimeShift.DataValueField = ds.Tables[0].Columns[0].ColumnName;
            ddlTimeShift.DataTextField = ds.Tables[0].Columns[1].ColumnName;
            ddlTimeShift.DataBind();

            ddlDayShift.Items.Add("Please Select Day Shift");
            ddlDayShift.DataSource = ds.Tables[1];
            ddlDayShift.DataValueField = ds.Tables[1].Columns[0].ColumnName;
            ddlDayShift.DataTextField = ds.Tables[1].Columns[1].ColumnName;
            ddlDayShift.DataBind();
        }

        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
            ddlTeams.DataSource = dt;
            ddlTeams.DataValueField = dt.Columns[0].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
        }

        private void displayStaff()
        {
            DataTable dt = new DataTable();
            _team.TeamID = Convert.ToInt32(ddlTeams.SelectedValue);
            dt = _team.displayTeamStaff().Tables[0]; ;
            ddlStaff.DataSource = dt;
            ddlStaff.Items.Add("Select Staff...");
            ddlStaff.DataTextField = dt.Columns[2].ColumnName;
            ddlStaff.DataValueField = dt.Columns[0].ColumnName;
            ddlStaff.DataBind();
            //gridStaff.DataSource = dt;
            //gridStaff.DataBind();
        }

        private void displayMonthYear()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("Date", typeof(DateTime));
            dummy.Columns.Add("DateText", typeof(String));

            DateTime datestart, dateend;
            dateend = DateTime.Now.AddMonths(2);
            datestart = DateTime.Now.AddMonths(-2);
            ddlMonthYear.Items.Clear();
            while (datestart <= dateend)
            {
                DateTime datestart_ = Convert.ToDateTime(datestart.Month.ToString() + "/01/" + datestart.Year.ToString());
                dummy.Rows.Add(datestart_.ToShortDateString(), String.Format("{0:MMMM - yyyy}", datestart_));
                datestart = datestart.AddMonths(1);
                //ddlMonthYear.Items.Add(String.Format("{0:MMMM-yyyy}", datestart_));
            }
            ddlMonthYear.DataSource = dummy;
            ddlMonthYear.DataValueField = "Date";
            ddlMonthYear.DataTextField = "DateText";
            ddlMonthYear.DataBind();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string getTeamStaff(List<string> _arr)
        {

            DataTable dummy = new DataTable();

            TeamMgt _team = new TeamMgt();
            _team.TeamID = Convert.ToInt32(_arr[0].ToString());

            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.displayTeamStaff().Tables[0]);
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveLeaves(List<string> _arr)
        {
            TeamMgt _team = new TeamMgt();
            _team.TeamEmpID = Convert.ToInt32(_arr[0].ToString());
            _team.LeaveType = _arr[1].ToString();
            _team.LeaveDate = Convert.ToDateTime(_arr[2].ToString());
            _team.LeaveVolume = Convert.ToDecimal(_arr[3].ToString());
            _team.LeaveReason = _arr[4].ToString();
            _team.EmployeeID = Convert.ToInt32(_arr[5].ToString());

            return _team.insertLeaves();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string cancelLeaves(List<string> _arr)
        {
            TeamMgt _team = new TeamMgt();
            _team.LeaveID = Convert.ToInt32(_arr[0].ToString());
            _team.EmployeeID = Convert.ToInt32(_arr[1].ToString());

            return _team.cancelLeaves();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayLeaves(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            TeamMgt _team = new TeamMgt();
            _team.TeamID = Convert.ToInt32(_arr[0].ToString());
            _team.LeaveDate = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.getEmployeeLeaves());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayAttendance(List<string> _arr)
        {
            DataTable dummy = new DataTable();
            //dummy.Columns.Add("Date", typeof(DateTime));
            //dummy.Columns.Add("Day", typeof(String));
            //dummy.Columns.Add("Present", typeof(Decimal));
            //dummy.Columns.Add("SL", typeof(Decimal));
            //dummy.Columns.Add("EL", typeof(Decimal));

            TeamMgt _team = new TeamMgt();
            _team.EmployeeID = Convert.ToInt32(_arr[0].ToString());
            _team.MonthYear = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.getEmployeeAttendance());
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
        public static string displayTardiness(List<string> _arr)
        {
            DataTable dummy = new DataTable();
            //dummy.Columns.Add("Date", typeof(DateTime));
            //dummy.Columns.Add("Day", typeof(String));
            //dummy.Columns.Add("Present", typeof(Decimal));
            //dummy.Columns.Add("SL", typeof(Decimal));
            //dummy.Columns.Add("EL", typeof(Decimal));

            TeamMgt _team = new TeamMgt();
            _team.EmployeeID = Convert.ToInt32(_arr[0].ToString());
            _team.MonthYear = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.getEmployeeTardiness());
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
        public static string displayComplex(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            TeamMgt _team = new TeamMgt();
            _team.EmployeeID = Convert.ToInt32(_arr[0].ToString());
            _team.MonthYear = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.getEmployeeComplex());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayAIQualify(List<string> _arr)
        {
            DataTable dummy = new DataTable();
            
            TeamMgt _team = new TeamMgt();
            _team.EmployeeID = Convert.ToInt32(_arr[0].ToString());
            _team.MonthYear = Convert.ToDateTime(_arr[1].ToString());
            _team.TeamID = Convert.ToInt32(_arr[2].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.getEmployeeAIQualify());
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
        public static string displayAIXport(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            TeamMgt _team = new TeamMgt();
            _team.MonthYear = Convert.ToDateTime(_arr[0].ToString());
            _team.TeamID = Convert.ToInt32(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                AttendanceMgt _atmgt = new AttendanceMgt();
                _atmgt.Session["xport"] = _team.getAIExport();
                string x = string.Concat("Attendance-Incentive-", _arr[2].Replace(" ", ""));
                _atmgt.Session["xportfilename"] = x;
            }
            catch (Exception ex)
            {

            }
            return "RAWR";
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string timeCorrection(List<string> _arr)
        {
            Khronos _khronos = new Khronos();
            _khronos.LogType = Convert.ToBoolean(_arr[0].ToString());
            _khronos.LogDate= Convert.ToDateTime(_arr[1].ToString());
            _khronos.CorrTime = Convert.ToDateTime(_arr[2].ToString());
            _khronos.EmployeeID = Convert.ToInt32(_arr[3].ToString());
            _khronos.CorrReason = _arr[4].ToString();
            _khronos.CorrEmpID = Convert.ToInt32(_arr[5].ToString());

            return _khronos.insertTimeCorrection();
        }
    }
}