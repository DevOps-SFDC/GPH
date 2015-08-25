using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MBPS_Central.SystemObjects
{
    public class OPT : DbInterface
    {
     #region Declaration
        private int _teamid, _parentworktypeid, _employeeid, _teamparentid, _workdayid, _teamworktypeid, _teamtaskid, _isactve, _transactionvolume;
        private Int64 _worktypemetricsid, _nptmetricid;
        private String _parentworktypename, _createdby, _reference, _remarks, _disposition, _teamtaskname, _worktypename ;
        private decimal _count;
        private DateTime _createddate;
        private DateTime _monthyear;
     #endregion

     #region Properties
        public DateTime CreatedDate
        { set { _createddate = value; } }

        public String ParentWorktypeName
        { set { _parentworktypename = value; } }

        public String WorktypeName
        { set { _worktypename = value; } }

        public String TeamTaskName
        { set { _teamtaskname = value; } }

        public String CreatedBy
        { set { _createdby = value; } }

        public String Reference
        { set { _reference = value; } }

        public String Remarks
        { set { _remarks = value; } }

        public String Disposition
        { set { _disposition = value; } }

        public Int64 WorktypeMetricsID
        { set { _worktypemetricsid = value; } }

        public Int64 NonProcessMetricsID
        { set { _nptmetricid = value; } }

        public Int32 ParentWorktypeID
        { set { _parentworktypeid = value; } }

        public Int32 TeamWorktypeID
        { set { _teamworktypeid = value; } }

        public Int32 IsActive
        { set { _isactve = value; } }

        public Int32 IsTransactionVolume
        { set { _transactionvolume = value; } }

        public Int32 TeamID
        { set { _teamid = value; } }

        public Int32 TeamParentWorktypeID
        { set { _teamparentid = value; } }

        public Int32 EmployeeID
        { set { _teamtaskid = value; } }

        public Int32 WorkdayID
        { set { _workdayid = value; } }

        public Int32 TeamTaskID
        { set { _teamtaskid = value; } }

        public Decimal Count
        { set { _count = value; } }

        public DateTime MonthYear
        { set { _monthyear = value; } }
     #endregion

     #region "Public Methods"
//DISPLAY
        public DataTable DisplaySPT()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamworktypeid", _teamworktypeid);
            return dt = this.FGetDataTable(@"OPTSettingDisplaySPT", oParam);
        }

        public DataTable DisplayParentWorktypes()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable(@"OPTDisplayParentWorktypes", oParam);

        }

        public DataTable DisplaySettingParentWorktypes()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable(@"OPTSettingDisplayParentWorktypes", oParam);

        }

        public DataTable OPTSettingDisplayWorktypes()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable(@"OPTSettingDisplayWorktypes", oParam);

        }

        public DataTable DisplayWorktypes()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamparentworktypeid", _parentworktypeid);
            return dt = this.FGetDataTable(@"OPTDisplayWorktypes", oParam);

        }

        public DataTable DisplayNptTask()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable(@"OPTDisplayNptTask", oParam);
        }

        public DataTable DisplayWorktypesMetrics(bool x)
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@workdayid", _workdayid);
            if (x)
            {
                return dt = this.FGetDataTable(@"OPTDisplayWorktypesMetricsX", oParam);    
            }
            else
            {
                return dt = this.FGetDataTable(@"OPTDisplayWorktypesMetrics", oParam);    
            }
            
        }

        public DataTable DisplayNPTMetrics()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue(@"workdayid", _workdayid);
            return dt = this.FGetDataTable(@"OPTDisplayNPTMetrics", oParam);
             
        }
        public DataTable DisplayNPTMetricsX()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue(@"workdayid", _workdayid);
            return dt = this.FGetDataTable(@"OPTDisplayNPTMetricsX", oParam);
          
        }
//INSERT
        public string InsertParentWT()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@parentworktypename", _parentworktypename);
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@createdby", _createdby);
            try
            {
                this.ExecuteInsert(@"OPTSettingInsertParentWT", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public string InsertWorktypeMetrics()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamworktypeid", _teamworktypeid);
            oParam.AddWithValue("@employeeid", _workdayid);
            oParam.AddWithValue("@count", _count);
            oParam.AddWithValue("@reference", _reference);
            oParam.AddWithValue("@remarks", _remarks);
            oParam.AddWithValue("@disposition", _disposition);
            try
            {
                this.ExecuteInsert(@"OPTInsertWorktypeMetrics", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string pauseWorktypeMetrics()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@worktypemetricid", _worktypemetricsid);
            try
            {
                this.FExecuteQuery(@"OPTWorktypeMetricPause", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string resumeWorktypeMetrics()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@worktypemetricid", _worktypemetricsid);
            oParam.AddWithValue("@employeeid", _workdayid);
            try
            {
                this.FExecuteQuery(@"OPTWorktypeMetricResume", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string stopWorktypeMetrics()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@worktypemetricid", _worktypemetricsid);
            oParam.AddWithValue("@employeeid", _workdayid);
            try
            {
                this.FExecuteQuery(@"OPTWorktypeMetricStop", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string stopNptMetrics()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@nptmetricid", _nptmetricid);
            oParam.AddWithValue("@employeeid", _workdayid);
            try
            {
                this.FExecuteQuery(@"OPTNptMetricsStop", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string InsertNPTMetrics()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamtaskid", _teamtaskid);
            oParam.AddWithValue("@employeeid", _workdayid);
            oParam.AddWithValue("@remarks", _remarks);
            try
            {
                this.ExecuteInsert(@"OPTInsertNptMetrics", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string InsertNPT()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamtaskname", _teamtaskname);
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@createdby", _createdby);
            try
            {
                this.ExecuteInsert(@"OPTSettingInsertNPT", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string InsertWorktypes()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamparentworktypeid", _parentworktypeid);
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@worktypename", _worktypename);
            oParam.AddWithValue("@createdby", _createdby);
            try
            {
                this.ExecuteInsert(@"OPTSettingsInsertWorktypes", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }
//UPDATE
        public string UpdateParentWT()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamparentid", _teamparentid);
            oParam.AddWithValue("@parentworktypename", _parentworktypename);
            
            oParam.AddWithValue("@isactive", _isactve);
            try
            {
                this.ExecuteInsert(@"OPTSettingUpdateParentWT", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string UpdateNPT()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
           
            oParam.AddWithValue("@teamtaskid", _teamtaskid);
            oParam.AddWithValue("@teamtaskname", _teamtaskname);
            oParam.AddWithValue("@isactive", _isactve);
           
            try
            {
                this.ExecuteInsert(@"OPTSettingUpdateNPT", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public string UpdateWorktype()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;

            oParam.AddWithValue("@teamworktypeid", _teamworktypeid);
            oParam.AddWithValue("@parentworktypeid", _parentworktypeid);
            oParam.AddWithValue("@worktypename", _worktypename);
            oParam.AddWithValue("@isactive", _isactve);
            oParam.AddWithValue("@transactionvolume", _transactionvolume);

            try
            {
                this.ExecuteInsert(@"OPTSettingUpdateWorktype", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            return msg;
        }

        public DataTable DisplayProcLeadView()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@monthyear", _monthyear);
            return dt = this.FGetDataTable(@"OPTDisplayProcessingLeadView", oParam);
        }


        public DataTable displayEntryDetails()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@wtypemetricid", _worktypemetricsid);
            return dt = this.FGetDataTable(@"OPTWorktypeEntryDetails", oParam);
        }

        public string saveRunStopMetric(bool runstop)
        {
            string msg;
            var oParam = new SqlCommand().Parameters;

            oParam.AddWithValue("@worktypemetricsid", _worktypemetricsid);
            oParam.AddWithValue("@teamworktypeid", _teamworktypeid);
            oParam.AddWithValue("@reference", _reference);
            oParam.AddWithValue("@count", _count);
            oParam.AddWithValue("@dispo", _disposition);
            oParam.AddWithValue("@remarks", _remarks);
            oParam.AddWithValue("@run", runstop);

            try
            {
                this.ExecuteInsert(@"OPTWorktypeMetricSaveRun", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString() + " Please contact your system administrator";
            }
            return msg;
        }

     #endregion
    }
}