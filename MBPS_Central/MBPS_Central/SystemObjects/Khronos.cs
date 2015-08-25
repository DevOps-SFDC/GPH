using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MBPS_Central.SystemObjects
{
    public class Khronos : DbInterface
    {
        private int _teamid, _employeeid, _month, _year;

        //khornos properties
        private bool _logtype;
        private DateTime _logdate, _corrTime, _monthYear;
        private string _corrReason;
        private int _corrempid;

        public Int32 TeamID
        { set { _teamid = value; } }

        public Int32 EmployeeID
        { set { _employeeid = value; } }

        public Int32 Month
        { set { _month = value; } }

        public Int32 Year
        { set { _year = value; } }

        public Boolean LogType
        { set { _logtype = value; } }
        public DateTime LogDate
        { set { _logdate = value; } }
        public DateTime CorrTime
        { set { _corrTime = value; } }
        public String CorrReason
        { set { _corrReason = value; } }
        public Int32 CorrEmpID
        { set { _corrempid = value; } }

        public DateTime MonthYear
        { set { _monthYear = value; } }

        public DataTable displayKhronosLogs(int x)
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            //oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@workdayid", _employeeid);
            //oParam.AddWithValue("@month", _month);
            oParam.AddWithValue("@monthyear", _monthYear);
            //oParam.AddWithValue("@year", _year);
            if (x == 1)
            {
                //return dt = this.FGetDataTable(@"KhronosTeamLogsBMDisplay", oParam);
                return dt = this.FGetDataTable(@"GetEmployeeLogs", oParam);
            }
            else
            {
                return dt = this.FGetDataTable(@"KhronosEmployeeTardiness", oParam);
                //return dt = this.FGetDataTable(@"KhronosTeamLogsDLDisplay", oParam);
            }
        }

        public string insertTimeCorrection()
        {
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@logtype", _logtype);
            oParam.AddWithValue("@logdate", _logdate);
            oParam.AddWithValue("@logcorrtime", _corrTime);
            oParam.AddWithValue("@logcorrby", _employeeid);
            oParam.AddWithValue("@logcorrreason", _corrReason);
            oParam.AddWithValue("@workdayid", _corrempid);
            this.ExecuteInsert(@"KhronosTimeCorrection", oParam);
            return "done";
        }
    }
}