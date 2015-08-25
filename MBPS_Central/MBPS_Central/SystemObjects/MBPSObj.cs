using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace MBPS_Central
{
    public class MBPSObj : DbInterface
    {
        #region Declarations
            DbInterface _dbi = new DbInterface();
            Int32 _workdayid;
            String _phbdomain;
            private int _teamid;
            
        #endregion

        #region Properties
            public Int32 WDID
            { set { _workdayid = value; } get { return _workdayid; } }

            public String PhbDomain
            { set { _phbdomain = value; } get { return _phbdomain; } }

            public Int32 TeamID
            { set { _teamid = value; } }
        #endregion

        #region "Public Methods"
            public bool validateLogin(string lanid)
            {
                return lanid.Equals(string.Empty);
            }

            public DataSet getLoginDetails(string lanid)
            {
                DataSet ds = new DataSet();
                lanid = lanid.Remove(0, lanid.IndexOf('\\') + 1);
                var oParam = new SqlCommand().Parameters;
                oParam.AddWithValue("@lanid", lanid);
                return ds = _dbi.FGetDataSet(@"EmployeeDetailsDisplay", oParam);
            }

            public DataTable getLoginTeams()
            {
                DataTable dt = new DataTable();
                var oParam = new SqlCommand().Parameters;
                oParam.AddWithValue("@workdayid", _workdayid);
                return dt = _dbi.FGetDataTable(@"EmployeeGetTeams", oParam);
            }
            //public DataTable DisplayParentWorktypes()
            //{
            //    DataTable ds = new DataTable();
            //    var oParam = new SqlCommand().Parameters;
            //    oParam.AddWithValue("@teamid", _teamid);
            //    return ds = this.FGetDataTable(@"DisplayParentWorktypes");

            //}
         #endregion

    }
}