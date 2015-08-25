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
using System.IO;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;

namespace MBPS_Central.TableF
{
    public partial class MyMetric : System.Web.UI.Page
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

            }
        }

        protected void btnATO_Click(object sender, EventArgs e)
        {
            ////Upload and save the file
            //string excelPath = Server.MapPath("~/Files/") + Path.GetFileName(fuATO.PostedFile.FileName);
            //fuATO.SaveAs(excelPath);

            //string conString = string.Empty;
            //string extension = Path.GetExtension(fuATO.PostedFile.FileName);
            //switch (extension)
            //{
            //    case ".xls": //Excel 97-03
            //        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
            //        break;
            //    case ".xlsx": //Excel 07 or higher
            //        conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
            //        break;

            //}
            //conString = string.Format(conString, excelPath);
            //using (OleDbConnection excel_con = new OleDbConnection(conString))
            //{
            //    excel_con.Open();
            //    string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
            //    DataTable dtExcelData = new DataTable();

            //    //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            //    //dtExcelData.Columns.AddRange(new DataColumn[10] { 
            //    //    new DataColumn("Team ID", typeof(Int32)),
            //    //    new DataColumn("Team Name", typeof(String)),
            //    //    new DataColumn("MonthYear", typeof(DateTime)),
            //    //    new DataColumn("Transaction Volume", typeof(String)),
            //    //    new DataColumn("1P Accuracy", typeof(String)),
            //    //    new DataColumn("2P Accuracy", typeof(String)),
            //    //    new DataColumn("TAT", typeof(String)),
            //    //    new DataColumn("Capacity", typeof(String)),
            //    //    new DataColumn("Productivity", typeof(String)),
            //    //    new DataColumn("Utilization",typeof(Decimal)) });

            //    using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
            //    {
            //        oda.Fill(dtExcelData);
            //    }
            //    excel_con.Close();

            //    string consString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //    using (SqlConnection con = new SqlConnection(consString))
            //    {
            //        using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
            //        {
            //            //Set the database table name
            //            sqlBulkCopy.DestinationTableName = "dbo.TDAto";

            //            //[OPTIONAL]: Map the Excel columns with that of the database table
            //            sqlBulkCopy.ColumnMappings.Add("Team ID", "Team ID");
            //            sqlBulkCopy.ColumnMappings.Add("Team Name", "Team Name");
            //            sqlBulkCopy.ColumnMappings.Add("MonthYear", "MonthYear");
            //            sqlBulkCopy.ColumnMappings.Add("Transaction Volume", "Transaction Volume");
            //            sqlBulkCopy.ColumnMappings.Add("1P Accuracy", "1P Accuracy");
            //            sqlBulkCopy.ColumnMappings.Add("2P Accuracy", "2P Accuracy");
            //            sqlBulkCopy.ColumnMappings.Add("TAT", "TAT");
            //            sqlBulkCopy.ColumnMappings.Add("Capacity", "Capacity");
            //            sqlBulkCopy.ColumnMappings.Add("Productivity", "Productivity");
            //            sqlBulkCopy.ColumnMappings.Add("Utilization", "Utilization");
            //            con.Open();
            //            sqlBulkCopy.WriteToServer(dtExcelData);
            //            con.Close();
            //        }
            //    }
            //}
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            //if (fuPT.HasFile)
            //{
            //    lblx.Text = "Meron";
            //}
            //else
            //{
            //    lblx.Text = "Wala";
            //}
        }

        private void dummyTable()
        {
            DataTable dummy1 = new DataTable();
            dummy1.Columns.Add("TeamMetricID", typeof(Int32));
            dummy1.Columns.Add("Metrics");
            dummy1.Columns.Add("Ratings");
            dummy1.Columns.Add("TeamMetrics");
            dummy1.Rows.Add();
            gridATO.DataSource = dummy1;
            gridATO.DataBind();

            //DataTable dummy2 = new DataTable();
            //dummy2.Columns.Add("TeamMetricID", typeof(Int32));
            //dummy2.Columns.Add("Metrics");
            //dummy2.Columns.Add("TeamTarget");
            //dummy2.Columns.Add("Ratings");
            //dummy2.Rows.Add();
            //gridPT.DataSource = dummy2;
            //gridPT.DataBind();

            DataTable dummy3 = new DataTable();
            dummy3.Columns.Add("TeamMetricID", typeof(Int32));
            dummy3.Columns.Add("Metrics");
            dummy3.Columns.Add("TeamTarget");
            dummy3.Columns.Add("Ratings");
            dummy3.Rows.Add();
            gridManual.DataSource = dummy3;
            gridManual.DataBind();

            DataTable dummy4 = new DataTable();
            dummy4.Columns.Add("TeamMetricID", typeof(Int32));
            dummy4.Columns.Add("Metrics");
            dummy4.Columns.Add("TeamTarget");
            dummy4.Columns.Add("Ratings");
            dummy4.Columns.Add("Remarks");
            dummy4.Columns.Add("Source");
            dummy4.Rows.Add();
            gridSummary.DataSource = dummy4;
            gridSummary.DataBind();

            //DataTable dummy5 = new DataTable();
            //dummy5.Columns.Add("TeamMetricID", typeof(Int32));
            //dummy5.Columns.Add("Metrics");
            //dummy5.Columns.Add("TeamTarget");
            //dummy5.Columns.Add("Ratings");
            //dummy5.Columns.Add("Remarks");
            //dummy5.Columns.Add("Source");
            //dummy5.Rows.Add();
            //gridCommit.DataSource = dummy5;
            //gridCommit.DataBind();
        }

        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
            ddlTeams.DataSource = dt;
            ddlTeams.DataValueField = dt.Columns[0].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
            //ddlTeams.Items.Insert(0, new ListItem("Please select a Team...", ""));
            _tablef.TeamID = Convert.ToInt32(ddlTeams.SelectedValue);
            Session["MyMetrics1"] = _tablef.displayTeamMetrics();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string MetricDisplay(Int32 teamid)
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("TeamMetricID", typeof(Int32));
            //dummy.Columns.Add("ExhibitID", typeof(Int32));
            dummy.Columns.Add("Metrics");
            dummy.Columns.Add("TeamTarget");
            //dummy.Rows.Add();

            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            TableF.MyMetric _mymetric = new TableF.MyMetric();
            _tablef.TeamID = teamid;
            DataSet ds = new DataSet();
            try
            {
                //dummy.Merge(_tablef.displayTeamMetrics());
                ds.Tables.Add((DataTable)_mymetric.Session["MyMetrics1"]);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string ATODisplay(List<string> _arr)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            TableF.MyMetric _mymetric = new TableF.MyMetric();
            _tablef.TeamID = Convert.ToInt32(_arr[0].ToString());
            _tablef.RateDate = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_tablef.displayATOMetrics());
                ds.Tables.Add(_tablef.displayTeamMetrics());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string PTDisplay()
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            TableF.MyMetric _mymetric = new TableF.MyMetric();
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_tablef.displayTeamMetrics());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string ManualDisplay(List<string> _arr)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            TableF.MyMetric _mymetric = new TableF.MyMetric();
            _tablef.TeamID = Convert.ToInt32(_arr[0].ToString());
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_tablef.displayTeamMetrics());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string RatingDisplay(List<string> _arr)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.TeamMetricID = Convert.ToInt32(_arr[0].ToString());
            _tablef.RateDate = Convert.ToDateTime(_arr[1].ToString());
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_tablef.displayRatings());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string InsertTeamRating(List<string> _arr)
        {
            SystemObjects.TableF _tablef = new SystemObjects.TableF();
            _tablef.TeamMetricID = Convert.ToInt32(_arr[0].ToString());
            _tablef.RateDate = Convert.ToDateTime(_arr[1].ToString());
            _tablef.Rating = Convert.ToDecimal(_arr[2].ToString());
            _tablef.Remarks = _arr[3].ToString();
            _tablef.WorkdayID = Convert.ToInt32(_arr[4].ToString());
            return _tablef.InsertTeamRating();
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
                dateend = DateTime.Now.AddMonths(-1);
                if (dt.Rows.Count.Equals(0))
                {
                    datestart = DateTime.Now.AddYears(-3);
                }
                else
                {
                    datestart = Convert.ToDateTime(dt.Rows[0]["RateDateMax"].ToString());
                }
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
        public static string UploadXLS(HttpPostedFile context)
        {
            String stat;
            return context.FileName;
            //if (_x.HasFile)
            //{
            //    stat = "Meron";   
            //}
            //else
            //{
            //    stat = "Wala";
            //}
            //return stat;
        }
    }
}