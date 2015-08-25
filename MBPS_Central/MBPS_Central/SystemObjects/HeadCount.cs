using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MBPS_Central.SystemObjects
{
    public class HeadCount : DbInterface
    {
        #region Declaration
        private int _teamid,  _employeeid , _date, _year, _month, _count;
        private string _lastname, _firstname, _teamname, _preferred, _actual, _forecast, _position;
        #endregion

        #region Properties
        public Int32 Year
        { set { _year = value; } }

        public Int32 Month
        { set { _month = value; } }

        public Int32 TeamID
        { set { _teamid = value; } }

        public Int32 EmployeeID
        { set { _employeeid = value; } }

        public Int32 Date
        { set { _date = value; } }

        public Int32 Count
        { set { _count = value; } }

          public String LastName
        { set { _lastname = value; } }

          public String FirstName
        { set { _firstname = value; } }

        public String TeamName
        { set { _teamname = value; } }

        public String Prefered
        { set { _preferred = value; } }

        public String Actual
        { set { _actual = value; } }

        public String Forecast
        { set { _forecast = value; } }

        public String Position
        { set { _position = value; } }
        #endregion

        #region Method
        public DataTable DisplayHeadcount()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@year", _year);
            return dt = this.FGetDataTable(@"HCDisplayHeadcount", oParam);
        }

        public DataTable DisplayEmployee()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@date", _date);
            oParam.AddWithValue("@year", _year);
            return dt = this.FGetDataTable(@"HCDisplayEmployee", oParam);
        }

        public DataTable DisplayYear()
        {

            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            return dt = this.FGetDataTable(@"HCDisplayYear", oParam);
        }

        public string InsertForecast()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@position", _position);
            oParam.AddWithValue("@year", _year);
            oParam.AddWithValue("@month", _month);
            oParam.AddWithValue("@teamname", _teamname);
            //oParam.AddWithValue("@count", _count);
            try
            {
                this.ExecuteInsert(@"HCInsertForecast", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        #endregion
    }

}
