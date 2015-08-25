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

namespace MBPS_Central.Reports
{
    public partial class KhronosLogs : System.Web.UI.Page
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
                }
            }
            catch (Exception ex)
            {
                Session["ErrMsg"] = "Session Expired!";
                Response.Redirect("~/Default.aspx");
                throw;
            }
            finally
            {
                
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
            ddlStaff.Items.Add("All Staff");
            ddlStaff.DataSource = dt;
            ddlStaff.DataValueField = dt.Columns[1].ColumnName;
            ddlStaff.DataTextField = dt.Columns[2].ColumnName;
            ddlStaff.DataBind();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string GetLogs(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            Khronos _khr = new Khronos();
            //_khr.TeamID = Convert.ToInt32(_arr[0].ToString());
            _khr.EmployeeID = Convert.ToInt32(_arr[0].ToString());
            //_khr.Month = Convert.ToInt32(_arr[2].ToString());
            //_khr.Year = Convert.ToInt32(_arr[3].ToString());
            _khr.MonthYear = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_khr.displayKhronosLogs(0));
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
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
    }
}