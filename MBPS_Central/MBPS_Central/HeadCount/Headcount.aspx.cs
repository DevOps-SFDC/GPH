using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace MBPS_Central
{
    public partial class Headcount : System.Web.UI.Page
    {
        //MBPSObj _mbps = new MBPSObj();
        SystemObjects.HeadCount _hc = new SystemObjects.HeadCount();
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
                    displayDummy();
                    displayTeams();
                   // displayYear();
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
            dummy.Columns.Add("WorkdayID");
            dummy.Columns.Add("Name");
            dummy.Rows.Add();
            GridView1.DataSource = dummy;
            GridView1.DataBind();
        }

        private void displayTeams()
        {
            DataTable dt = (DataTable)Session["MyTeams"];
           
            ddlTeams.DataSource = dt;
            ddlTeams.DataValueField = dt.Columns[0].ColumnName;
            ddlTeams.DataTextField = dt.Columns[1].ColumnName;
            ddlTeams.DataBind();
        }
        //private void displayYear()
        //{
        //    DataTable dt = new DataTable();
        //    _hc.TeamID = Convert.ToInt32(ddlTeams.SelectedValue);
        //    dt = _hc.DisplayYear(); 
           
        //    ddlyear.DataSource = dt;
        //    ddlyear.Items.Add("Select Year...");
        //    ddlyear.DataValueField = dt.Columns[0].ColumnName.ToString();
        //    ddlyear.DataTextField = dt.Columns[0].ColumnName.ToString();
        //    ddlyear.DataBind();
        //}

      
        //protected void btnUpload_Click(object sender, EventArgs e)
        //{

        //    if (FileUpload1.HasFile)
        //    {
        //        string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //        string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
        //        string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
        //        string FilePath = Server.MapPath(FolderPath + FileName);
        //        FileUpload1.SaveAs(FilePath);
        //        GetExcelSheets(FilePath, Extension, "Yes");

        //    }
        //}
        //private void GetExcelSheets(string FilePath, string Extension, string isHDR)
        //{
        //    string conString = string.Empty;
        //    switch (Extension)
        //    {
        //        case ".xls": //Excel 97-03
        //            conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
        //            break;
        //        case ".xlsx": //Excel 07
        //            conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
        //            break;
        //    }
        //    //Get the Sheets in Excel
        //    conString = String.Format(conString, FilePath, isHDR);
        //    OleDbConnection excel_con = new OleDbConnection(conString);
        //    OleDbCommand cmdExcel = new OleDbCommand();
        //    OleDbDataAdapter oda = new OleDbDataAdapter();
        //    cmdExcel.Connection = excel_con;
        //    excel_con.Open();
        //    //Bind the Sheets to DropDownList
        //    ddlSheets.Items.Clear();
        //    ddlSheets.Items.Add(new ListItem("--Select Sheet--", ""));
        //    ddlSheets.DataSource = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        //    ddlSheets.DataTextField = "TABLE_NAME";
        //    ddlSheets.DataValueField = "TABLE_NAME";
        //    ddlSheets.DataBind();
        //    excel_con.Close();
        //    txtTable.Text = "";
        //    lblFileName.Text = Path.GetFileName(FilePath);
        //    Panel2.Visible = true;
        //    Panel1.Visible = false;

        //}

        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    string FileName = lblFileName.Text;
        //    string Extension = Path.GetExtension(FileName);
        //    string FolderPath = Server.MapPath(ConfigurationManager.AppSettings["FolderPath"]);
        //    string CommandText = "";
        //    switch (Extension)
        //    {
        //        case ".xls": //Excel 97-03
        //            CommandText = "spx_ImportFromExcel03";
        //            break;
        //        case ".xlsx": //Excel 07
        //            CommandText = "spx_ImportFromExcel07";
        //            break;
        //    }
        //    ////Read Excel Sheet using Stored Procedure
        //    ////And import the data into Database Table
        //    String constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //    SqlConnection con = new SqlConnection(constr);
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.CommandText = CommandText;
        //    cmd.Parameters.Add("@SheetName", SqlDbType.VarChar).Value = ddlSheets.SelectedItem.Text;
        //    cmd.Parameters.Add("@FilePath", SqlDbType.VarChar).Value = FolderPath + FileName;
        //    cmd.Parameters.Add("@HDR", SqlDbType.VarChar).Value = rbHDR.SelectedItem.Text;
        //    cmd.Parameters.Add("@TableName", SqlDbType.VarChar).Value = txtTable.Text;

        //    cmd.Connection = con;
        //    try
        //    {
        //        con.Open();
        //        object count = cmd.ExecuteNonQuery();
        //        lblMessage.ForeColor = System.Drawing.Color.Green;
        //        lblMessage.Text = count.ToString() + " records inserted.";
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMessage.ForeColor = System.Drawing.Color.Red;
        //        lblMessage.Text = ex.Message;
        //    }

        //    finally
        //    {
        //        con.Close();
        //        con.Dispose();
        //        Panel2.Visible = false;

        //    }

        //}

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayHC(List<string> _arr)
        {
            DataTable dummy = new DataTable();
          
            SystemObjects.HeadCount _hc = new SystemObjects.HeadCount();
            _hc.TeamID = Convert.ToInt32(_arr[0]);
            _hc.Year = Convert.ToInt32(_arr[1]);
            //_hc.Forecast = _arr[2].ToString();

            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_hc.DisplayHeadcount());
                ds.Tables.Add(dummy);
                
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

       
        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayemployee(List<string> _arr)
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("No");
            dummy.Columns.Add("WorkdayID");
            dummy.Columns.Add("Name");
            

            SystemObjects.HeadCount _hc = new SystemObjects.HeadCount();
            _hc.TeamID = Convert.ToInt32(_arr[0]);
            _hc.Date =  Convert.ToInt32(_arr[1]);
            _hc.Year = Convert.ToInt32(_arr[2]);
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_hc.DisplayEmployee());
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
        public static string displayYear(List<string> _arr)
        {
            DataSet ds = new DataSet();
            SystemObjects.HeadCount _hc = new SystemObjects.HeadCount();

            _hc.TeamID = Convert.ToInt32(_arr[0].ToString());

            try
            {
                ds.Tables.Add(_hc.DisplayYear());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string addForecast(List<string> _arr)
        {
            SystemObjects.HeadCount _hc = new SystemObjects.HeadCount();
            _hc.TeamID = Convert.ToInt32(_arr[0]);
            _hc.Position = _arr[1];
            _hc.Year = Convert.ToInt32(_arr[2]);
            _hc.Month = Convert.ToInt32(_arr[3]);
            _hc.TeamName = _arr[4];
            //_hc.Count = Convert.ToInt32(_arr[5]);
            return _hc.InsertForecast();
        }
    }
}