using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MBPS_Central.SystemObjects
{
    public class TeamMgt : DbInterface
    {
        #region Declarations
        private int _employeeid;

        private int _teamid, _teamempid;

        private int? _shiftid, _dayshiftid;

        private DateTime? _shiftstartdate, _shiftenddate, _customstart, _customend;

        private string _leavetype;
        private DateTime _leavedate;
        private int _leaveid;
        private decimal _leavevolume;
        private string _leavereason;

        private DateTime _monthyear;

        private int _shiftempid;
        #endregion

        #region Properties
        public Int32 EmployeeID
        { set { _employeeid = value; } }

        public Int32 TeamID
        { set { _teamid = value; } }

        public Int32 TeamEmpID
        { set { _teamempid = value; } }

        public Int32? ShiftID
        { set { _shiftid = value; } }

        public Int32 DayShiftID
        { set { _dayshiftid = value; } }

        public DateTime? ShiftStartDate
        { set { _shiftstartdate = value; } }

        public DateTime? ShiftEndDate
        { set { _shiftenddate = value; } }

        public DateTime? CustomStart
        { set { _customstart = value; } }

        public DateTime? CustomEnd
        { set { _customend = value; } }

        public String LeaveType
        { set { _leavetype = value; } }

        public DateTime LeaveDate
        { set { _leavedate = value; } }

        public Int32 LeaveID
        { set { _leaveid = value; } }

        public Decimal LeaveVolume
        { set { _leavevolume = value; } }

        public String LeaveReason
        { set { _leavereason = value; } }

        public DateTime MonthYear
        { set { _monthyear = value; } }

        public Int32 ShiftEmpdID
        { set { _shiftempid = value; } }

        #endregion

        #region Methods
        public DataSet displayTeamStaff()
        {
            DataSet ds = new DataSet();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            return ds = this.FGetDataSet("TeamStaffDisplay", oParam);
        }

        public DataSet displayShiftTemplate()
        {
            DataSet ds = new DataSet();
            return ds = this.FGetDataSet("ShiftsDisplay");
        }

        public DataTable displayEmployeeShift()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamempid", _teamempid);
            return dt = this.FGetDataTable("EmployeeShiftGetShift", oParam);
        }

        public DataTable displayTemp()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable("TmpQryChippy", oParam);
        }

        public string insertNewShift()
        {
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamempid", _teamempid);
            oParam.AddWithValue("@shiftid", _shiftid);
            oParam.AddWithValue("@dayshiftid", _dayshiftid);
            oParam.AddWithValue("@shiftstartdate", _shiftstartdate);
            oParam.AddWithValue("@shiftenddate", _shiftenddate);
            oParam.AddWithValue("@employeeid", _employeeid);
            oParam.AddWithValue("@customstart", _customstart);
            oParam.AddWithValue("@customend", _customend);
            this.ExecuteInsert(@"EmployeeShiftInsert3", oParam);
            return "done";
        }

        public string cancelShift()
        {
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@shiftempid", _shiftempid);
            this.FExecuteQuery("EmployeeShiftCancel", oParam);
            return "done";
        }

        public DataTable getEmployeeShift()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamempid", _teamempid);
            oParam.AddWithValue("@shiftstartdate", _shiftstartdate);
            oParam.AddWithValue("@shiftenddate", _shiftenddate);
            return dt = this.FGetDataTable(@"EmployeeShiftGet", oParam);
        }

        public string insertLeaves()
        {
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamempid", _teamempid);
            oParam.AddWithValue("@leavetype", _leavetype);
            oParam.AddWithValue("@leavedate", _leavedate);
            oParam.AddWithValue("@leavevolume", _leavevolume);
            oParam.AddWithValue("@leavereason", _leavereason);
            oParam.AddWithValue("@workdayid", _employeeid);
            this.ExecuteInsert(@"KhronosEmployeeLeavesInsert", oParam);
            return "done";
        }

        public string cancelLeaves()
        {
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@leaveid", _leaveid);
            oParam.AddWithValue("@workdayid", _employeeid);
            this.FExecuteQuery(@"KhronosEmployeeLeaveCancel", oParam);
            return "done";
        }

        public DataTable getEmployeeLeaves()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@leavedate", _leavedate);
            return dt = this.FGetDataTable(@"KhronosEmployeeLeavesDisplay", oParam);
        }

        public DataTable getEmployeeAttendance()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@workdayid", _employeeid);
            oParam.AddWithValue("@monthyear", _monthyear);
            return dt = this.FGetDataTable(@"KhronosEmployeeAttendance", oParam);
        }

        public DataTable getEmployeeTardiness()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@workdayid", _employeeid);
            oParam.AddWithValue("@monthyear", _monthyear);
            return dt = this.FGetDataTable(@"KhronosEmployeeTardiness", oParam);
        }

        public DataTable getEmployeeComplex()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@workdayid", _employeeid);
            oParam.AddWithValue("@monthyear", _monthyear);
            return dt = this.FGetDataTable(@"KhronosEmployeeAttendanceComplex", oParam);
        }

        public DataTable getEmployeeAIQualify()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@wdid", _employeeid);
            oParam.AddWithValue("@monthyear1", _monthyear);
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable(@"KhronosTeamAIQualification", oParam);
        }

        public DataTable getAIExport()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@monthyear1", _monthyear);
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable(@"ExportAIQualify", oParam);
        }
        #endregion
    }
}