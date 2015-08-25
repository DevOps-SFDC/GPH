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

namespace MBPS_Central.Tools
{
    public partial class ReAR : System.Web.UI.Page
    {
        MBPSObj _mbps = new MBPSObj();
        ReARObj _rear = new ReARObj();

        
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
                    displayType();
                    displayDummy();
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
        private void displayDummy()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("TicketNo", typeof(Int64));
            dummy.Columns.Add("ConcernAction", typeof(String));
            dummy.Columns.Add("TicketDescription", typeof(String));
            dummy.Columns.Add("TicketDate", typeof(DateTime));
            dummy.Columns.Add("TicketStatus", typeof(String));
            dummy.Columns.Add("SummaryOfConcern", typeof(String));
            dummy.Rows.Add();
            gridTickets.DataSource = dummy;
            gridTickets.DataBind();
        }

        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
            ddlTeams.DataSource = dt;
            ddlTeams.DataValueField = dt.Columns[0].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
        }

        private void displayType()
        {
            DataTable dt = new DataTable();
            dt = _rear.displayType();
            ddlTypes.Items.Clear();
            ddlTypes.DataSource = dt;
            ddlTypes.Items.Add("Select Types...");
            ddlTypes.DataValueField = dt.Columns[0].ColumnName.ToString();
            ddlTypes.DataTextField = dt.Columns[0].ColumnName.ToString();
            ddlTypes.DataBind();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayApps(String concern)
        {
            DataSet ds = new DataSet();
            ReARObj _rear = new ReARObj();
            _rear.ConcernType = concern;
            
            try
            {
                ds.Tables.Add(_rear.displayApplication());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayAction(Int32 scopeid)
        {
            DataSet ds = new DataSet();
            ReARObj _rear = new ReARObj();
            _rear.ScopeID = scopeid;

            try
            {
                ds.Tables.Add(_rear.displayAction());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string saveReAR(List<string> _arr)
        {
            SystemObjects.ReARObj _rearobj = new SystemObjects.ReARObj();
            _rearobj.RequestID = Convert.ToInt32(_arr[0].ToString());
            _rearobj.RequestDesc = _arr[1].ToString();
            _rearobj.TeamID = Convert.ToInt32(_arr[2].ToString());
            _rearobj.WorkdayID = Convert.ToInt32(_arr[3].ToString());
            _rearobj.Summary = _arr[4].ToString();
            _rearobj.MBPSExt = Convert.ToInt32(_arr[5].ToString());
            _rearobj.MBPSMail = _arr[6].ToString();
            return _rearobj.InsertReAR();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayReARTickets(List<string> _arr)
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("TicketNo", typeof(Int64));
            dummy.Columns.Add("ConcernAction", typeof(String));
            dummy.Columns.Add("TicketDescription", typeof(String));
            dummy.Columns.Add("TicketDate", typeof(DateTime));
            dummy.Columns.Add("TicketStatus", typeof(String));
            dummy.Columns.Add("SummaryOfConcern", typeof(String));

            SystemObjects.ReARObj _rearobj = new SystemObjects.ReARObj();
            _rearobj.WorkdayID = Convert.ToInt32(_arr[0].ToString());

            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_rearobj.displayReAR(Convert.ToBoolean(_arr[1].ToString())));
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
        public static string viewDetails(Int32 ticketno)
        {
            SystemObjects.ReARObj _rearobj = new SystemObjects.ReARObj();
            _rearobj.TicketNo = ticketno;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_rearobj.displayTicketDetailsV2());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }
    }
}