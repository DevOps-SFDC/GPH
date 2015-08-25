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
    public partial class EveLeadView : System.Web.UI.Page
    {
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
                    displayMonthYear();
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
            ddlTeams.DataValueField = dt.Columns[4].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
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
        public static string displayLeaves(List<string> _arr)
        {
            SystemObjects.OPT _opt = new SystemObjects.OPT();

            _opt.TeamID = Convert.ToInt32(_arr[0].ToString());
            _opt.MonthYear = Convert.ToDateTime(_arr[1].ToString());

            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_opt.DisplayProcLeadView());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }
    }
}