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

namespace MBPS_Central.TableF
{
    public partial class TeamLeader : System.Web.UI.Page
    {
        MBPSObj _mbps = new MBPSObj();
        SystemObjects.TableF _tablef = new SystemObjects.TableF();

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
                    //dummyTable();
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

            }
        }

        private void dummyTable()
        {
            //DataTable dummy1 = new DataTable();
            //dummy1.Columns.Add("ItemID", typeof(Int32));
            //dummy1.Columns.Add("Name");
            //dummy1.Columns.Add("Meeting");
            //dummy1.Columns.Add("NotMeeting");
            //dummy1.Columns.Add("MeetingImproving");
            //dummy1.Columns.Add("Total");
            //dummy1.Columns.Add("MeetingPer");
            //dummy1.Columns.Add("MeetingImprovingPer");
            //dummy1.Rows.Add();
            //gridTeam.DataSource = dummy1;
            //gridTeam.DataBind();

            //DataTable dummy2 = new DataTable();
            //dummy2.Columns.Add("MetricID", typeof(Int32));
            //dummy2.Columns.Add("Metrics");
            //dummy2.Columns.Add("AchievingTarget");
            //dummy2.Columns.Add("WithData");
            //dummy2.Columns.Add("ThreeForth");
            //dummy2.Columns.Add("PerfExpected");
            //dummy2.Columns.Add("PerfImproved");
            //dummy2.Columns.Add("Complaint");
            //dummy2.Rows.Add();
            //gridMetric.DataSource = dummy2;
            //gridMetric.DataBind();
        }

        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
            ddlTeams.DataSource = dt;
            ddlTeams.DataValueField = dt.Columns[0].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
            ddlTeams.Items.Add("All Teams...");
            //ddlTeams.Items.Insert(0, new ListItem("All Team...", ""));
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string DateDisplay(Int32 teamid)
        {
            DateTime datestart, dateend;
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.TeamID = teamid;
            DataSet ds = new DataSet();
            try
            {
                DataTable dt = new DataTable();
                dt = _tablef.displayRatingsDate();
                DataTable dtdate = new DataTable();
                dtdate.Columns.Add("Dates");
                dtdate.Rows.Add("Please select Month - Year...");
                datestart = Convert.ToDateTime(dt.Rows[0]["RateDateMin"].ToString());
                dateend = Convert.ToDateTime(dt.Rows[0]["RateDateMax"].ToString());
                while (datestart <= dateend)
                {
                    DateTime datestart_ = Convert.ToDateTime(datestart.Month.ToString() + "/01/" + datestart.Year.ToString());
                    dtdate.Rows.Add(String.Format("{0:MMMM - yyyy}", datestart_));
                    datestart = datestart.AddMonths(1);
                }
                ds.Tables.Add(dtdate);
            }
            catch (Exception ex)
            {

            }

            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string SummaryDisplay(List<string> _arr)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.TeamID = Convert.ToInt32(_arr[0].ToString());
            _tablef.RateDate = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                ds = _tablef.displayRatingsTeam();
            }
            catch (Exception ex)
            {

            }

            return ds.GetXml();
        }
    }
}