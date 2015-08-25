using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MBPS_Central.SystemObjects
{
    public class TableF : DbInterface
    {
        private int _workdayid, _exhibitid, _keyid, _itemid, _metricid, _teamid, _teammetricid;
        private string _targetdirect, _targetdescription, _sourcename, _remarks, _metrics, _metricdesc, _calculations, _considerations, _bestpractice, _frequency;
        private bool _isactive;
        private decimal _target, _rating;
        private DateTime? _ratedate;

        public Int32 WorkdayID
        { set { _workdayid = value; } }

        public Int32 ExhibitID
        { set { _exhibitid = value; } }

        public Int32 KeyID
        { set { _keyid = value; } }

        public Int32 ItemID
        { set { _itemid = value; } }

        public Int32 MetricID
        { set { _metricid = value; } }

        public Int32 TeamID
        { set { _teamid = value; } }

        public Decimal Target
        { set { _target = value; } }

        public Decimal Rating
        { set { _rating = value; } }

        public String TargetDirect
        { set { _targetdirect = value; } }

        public String TargetDescript
        { set { _targetdescription = value; } }

        public String SourceName
        { set { _sourcename = value; } }

        public String Remarks
        { set { _remarks = value; } }

        public String Metrics
        { set { _metrics = value; } }

        public String MetricDesc
        { set { _metricdesc = value; } }

        public String Calculations
        { set { _calculations = value; } }

        public String Considerations
        { set { _considerations = value; } }

        public String BestPractice
        { set { _bestpractice = value; } }

        public String Frequency
        { set { _frequency = value; } }

        public Boolean IsActive
        { set { _isactive = value; } }

        public DateTime RateDate
        { set { _ratedate = value; } }

        public Int32 TeamMetricID
        { set { _teammetricid = value; } }

        public DataTable displayRatingsDate()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@ratedate", _ratedate);
            return dt = this.FGetDataTable(@"TableFRatingsDateDisplay", oParam);
        }

        public DataSet displayRatingsTeam()
        {
            DataSet ds = new DataSet();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@ratedate", _ratedate);
            return ds = this.FGetDataSet(@"TableFRatingsTeamDisplay", oParam);
        }

        public DataTable displayRatings()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teammetricid", _teammetricid);
            oParam.AddWithValue("@ratedate", _ratedate);
            return dt = this.FGetDataTable(@"TableFTeamRatingsDisplay", oParam);
        }

        public DataTable displayExKeys()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@exhibitID", _exhibitid);
            return dt = this.FGetDataTable(@"TableFDisplayKeys", oParam);
        }

        public DataTable displayKeyMetrics()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@keyID", _keyid);
            oParam.AddWithValue("@teamID", _teamid);
            return dt = this.FGetDataTable(@"TableFDisplayMetrics", oParam);
        }

        public DataTable displayMetricSpecific()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@metricID", _metricid);
            return dt = this.FGetDataTable(@"TableFDisplayMetricsSpecific", oParam);
        }

        public DataTable displayItems()
        {
            DataTable dt = new DataTable();
            return dt = this.FGetDataTable(@"TableFDisplayItems");
        }

        public DataTable displayTeamMetrics()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            //oParam.AddWithValue("@keyid", _keyid);
            return dt = this.FGetDataTable(@"TableFTeamMetricsDisplay", oParam);
        }

        public DataTable displayATOMetrics()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@ratedate", _ratedate);
            return dt = this.FGetDataTable(@"TableFTeamRatingsATODisplay", oParam);
        }

        public DataTable displayTarget()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@metricsid", _metricid);
            return dt = this.FGetDataTable(@"TableFTargetDisplay", oParam);
        }

        public string InsertMetric()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@keyid", _keyid);
            oParam.AddWithValue("@itemid", _itemid);
            oParam.AddWithValue("@metrics", _metrics);
            oParam.AddWithValue("@metricdesc", _metricdesc);
            oParam.AddWithValue("@calculations", _calculations);
            oParam.AddWithValue("@considerations", _considerations);
            oParam.AddWithValue("@bestpractice", _bestpractice);
            oParam.AddWithValue("@frequency", _frequency);
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@wdid", _workdayid);
            try
            {
                this.ExecuteInsert(@"TableFMetricInsert", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public string InsertTeamMetric()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teamid", _teamid);
            oParam.AddWithValue("@metricsid", _metricid);
            oParam.AddWithValue("@targetdirection", _targetdirect);
            oParam.AddWithValue("@targetvalue", _target);
            oParam.AddWithValue("@targetdescription", _targetdescription);
            oParam.AddWithValue("@createdby", _workdayid);
            oParam.AddWithValue("@source", _sourcename);
            try
            {
                this.ExecuteInsert(@"TableFTeamMetricsInsert", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }
            
            return msg;
        }

        public string InsertTeamRating()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@teammetricid", _teammetricid);
            oParam.AddWithValue("@ratedate", _ratedate);
            oParam.AddWithValue("@rating", _rating);
            oParam.AddWithValue("@remarks", _remarks);
            oParam.AddWithValue("@wdid", _workdayid);
            try
            {
                this.ExecuteInsert(@"TableFTeamRatingsInsert", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }
    }
}