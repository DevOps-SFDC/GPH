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
    public partial class ShiftMgt : System.Web.UI.Page
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

                DataTable teams = (DataTable)Session["MyTeams"];
                foreach (DataRow drow in teams.Rows)
                {
                    
                }

                if (!IsPostBack)
                {
                    displayTeams();
                    displayStaff();
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
                dummyTable();
            }
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
            dt = _team.displayTeamStaff().Tables[0];
            //gridStaff.DataSource = dt;
            //gridStaff.DataBind();
            //gridStaffSched.DataSource = dt;
            //gridStaffSched.DataBind();
        }

        private void dummyTable()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("StartDate", typeof(DateTime));
            dummy.Columns.Add("EndDate", typeof(DateTime));
            dummy.Columns.Add("DayShift");
            dummy.Columns.Add("Shift");
            dummy.Rows.Add();
            //gridEmpShift.DataSource = dummy;
            //gridEmpShift.DataBind();
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

            ddlTimeShiftT.Items.Add("Please Select Time Shift");
            ddlTimeShiftT.DataSource = ds.Tables[0];
            ddlTimeShiftT.DataValueField = ds.Tables[0].Columns[0].ColumnName;
            ddlTimeShiftT.DataTextField = ds.Tables[0].Columns[1].ColumnName;
            ddlTimeShiftT.DataBind();

            ddlDayShiftT.Items.Add("Please Select Day Shift");
            ddlDayShiftT.DataSource = ds.Tables[1];
            ddlDayShiftT.DataValueField = ds.Tables[1].Columns[0].ColumnName;
            ddlDayShiftT.DataTextField = ds.Tables[1].Columns[1].ColumnName;
            ddlDayShiftT.DataBind();
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
        public static string test1(Int32 teamempid)
        {
            DataTable dummy = new DataTable();

            TeamMgt _team = new TeamMgt();
            _team.TeamEmpID = teamempid;
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.displayEmployeeShift());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveNewShift(List<string> _arr)
        {
            TeamMgt _team = new TeamMgt();
            _team.TeamEmpID = Convert.ToInt32(_arr[0].ToString());
            
            int n;
            if (int.TryParse(_arr[1].ToString(), out n)) { _team.ShiftID = Convert.ToInt32(_arr[1].ToString()); }
            
            _team.DayShiftID = Convert.ToInt32(_arr[2].ToString());
            _team.ShiftStartDate = Convert.ToDateTime(_arr[3].ToString());
            if (!_arr[4].ToString().Equals(string.Empty) || !_arr[4].ToString().Equals(""))
            {
                _team.ShiftEndDate = Convert.ToDateTime(_arr[4].ToString());
            }
            _team.EmployeeID = Convert.ToInt32(_arr[5].ToString());
            if (!string.IsNullOrEmpty(_arr[6].ToString()) || !_arr[6].ToString().Equals(string.Empty) || !_arr[6].ToString().Equals(""))
            {
                _team.CustomStart = Convert.ToDateTime(_arr[6].ToString());
            }
            if (!string.IsNullOrEmpty(_arr[7].ToString()) || !_arr[7].ToString().Equals(string.Empty) || !_arr[7].ToString().Equals(""))
            {
                _team.CustomEnd = Convert.ToDateTime(_arr[7].ToString());
            }
            return _team.insertNewShift();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string getEmployeeShift(List<string> _arr)
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("StartDate", typeof(DateTime));
            dummy.Columns.Add("EndDate", typeof(DateTime));
            dummy.Columns.Add("DayShift");
            dummy.Columns.Add("Shift");
            //dummy.Rows.Add();

            TeamMgt _team = new TeamMgt();
            _team.TeamEmpID = Convert.ToInt32(_arr[0].ToString());
            _team.ShiftStartDate = Convert.ToDateTime(_arr[1].ToString());
            if (!_arr[2].ToString().Equals(string.Empty) || !_arr[2].ToString().Equals(""))
            {
                _team.ShiftEndDate = Convert.ToDateTime(_arr[2].ToString());
            }
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_team.getEmployeeShift());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            //return ds.GetXml();
            if (ds.Tables[0].Rows.Count < 1)
            {
                return "0";
            }
            else
            {
                return "1";
            }
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string cancelShift(List<string> _arr)
        {
            TeamMgt _team = new TeamMgt();
            _team.ShiftEmpdID = Convert.ToInt32(_arr[0].ToString());

            return _team.cancelShift();
        }
    }
}