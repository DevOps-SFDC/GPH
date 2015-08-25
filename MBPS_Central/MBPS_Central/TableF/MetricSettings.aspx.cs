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
    public partial class MetricSettings : System.Web.UI.Page
    {
        MBPSObj _mbps = new MBPSObj();
        TeamMgt _team = new TeamMgt();
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
                    dummyTable();
                    displayTeams();
                    displayItems();
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

        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
            ddlTeams.DataSource = dt;
            ddlTeams.DataValueField = dt.Columns[0].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
        }

        private void displayItems()
        {
            DataTable dt = new DataTable();
            dt = _tablef.displayItems();
            ddlmetricitem.DataSource = dt;
            ddlmetricitem.DataValueField = dt.Columns[0].ColumnName;
            ddlmetricitem.DataTextField = dt.Columns[1].ColumnName;
            ddlmetricitem.DataBind();
            ddlmetricitem.Items.Insert(0, new ListItem("Please select an Item...", ""));
        }

        private void dummyTable()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("KeyID", typeof(Int32));
            dummy.Columns.Add("KeyName");
            dummy.Rows.Add();
            gridKeys.DataSource = dummy;
            gridKeys.DataBind();

            DataTable dummy2 = new DataTable();
            dummy2.Columns.Add("MetricsID", typeof(Int32));
            dummy2.Columns.Add("Metrics");
            dummy2.Columns.Add("MetricsDesc");
            dummy2.Columns.Add("ItemName");
            dummy2.Rows.Add();
            gridMetrics.DataSource = dummy2;
            gridMetrics.DataBind();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string test1(Int32 exid)
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("KeyID", typeof(Int32));
            dummy.Columns.Add("KeyName");
            //dummy.Rows.Add();

            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.ExhibitID = exid;
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_tablef.displayExKeys());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string MetricDisplay(Int32 keyid, Int32 teamid)
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("MetricsID", typeof(Int32));
            dummy.Columns.Add("Metrics");
            dummy.Columns.Add("MetricsDesc");
            dummy.Columns.Add("ItemName");
            //dummy.Rows.Add();

            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.KeyID = keyid;
            _tablef.TeamID = teamid;
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_tablef.displayKeyMetrics());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string MetricSpecificDisplay(Int32 metricid)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.MetricID = metricid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_tablef.displayMetricSpecific());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveTableFTeamMetric(List<string> _arr)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.TeamID = Convert.ToInt32(_arr[0].ToString());
            _tablef.MetricID = Convert.ToInt32(_arr[1].ToString());
            _tablef.TargetDirect = _arr[2].ToString();
            _tablef.Target = Convert.ToDecimal(_arr[3].ToString());
            _tablef.TargetDescript = _arr[4].ToString();
            _tablef.WorkdayID = Convert.ToInt32(_arr[5].ToString());
            _tablef.SourceName = _arr[6].ToString();
            return _tablef.InsertTeamMetric();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveMetric(List<string> _arr)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.KeyID = Convert.ToInt32(_arr[0].ToString());
            _tablef.ItemID = Convert.ToInt32(_arr[1].ToString());
            _tablef.Metrics = _arr[2].ToString();
            _tablef.MetricDesc = _arr[3].ToString();
            _tablef.Calculations = _arr[4].ToString();
            _tablef.Considerations = _arr[5].ToString();
            _tablef.BestPractice = _arr[6].ToString();
            _tablef.Frequency = _arr[7].ToString();
            _tablef.TeamID = Convert.ToInt32(_arr[8].ToString());
            _tablef.WorkdayID = Convert.ToInt32(_arr[9].ToString());
            return _tablef.InsertMetric();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string TargetDisplay(Int32 metricid, Int32 teamid)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.MetricID = metricid;
            _tablef.TeamID = teamid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_tablef.displayTarget());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }
    }
}