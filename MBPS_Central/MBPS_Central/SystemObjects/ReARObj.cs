using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace MBPS_Central.SystemObjects
{
    public class ReARObj : DbInterface
    {
        #region Declaration
        private String _contype, _requestdesc, _requeststatus, _filepath, _summary, _mbpsmail;
            private int _scopeid, _requestid, _teamid, _workdayid, _ticketno, _mbpsext;
            private DateTime? _requestdate;
        #endregion

        #region Properties
            public String ConcernType
            { set { _contype = value; } }

            public String RequestDesc
            { set { _requestdesc = value; } }

            public String RequestStatus
            { set { _requeststatus = value; } }

            public String FilePath
            { set { _filepath = value; } }

            public String MBPSMail
            { set { _mbpsmail = value; } }

            public String Summary
            { set { _summary = value; } }

            public Int32 ScopeID
            { set { _scopeid = value; } }

            public Int32 RequestID
            { set { _requestid = value; } }

            public Int32 TeamID
            { set { _teamid = value; } }

            public Int32 WorkdayID
            { set { _workdayid = value; } }

            public Int32 TicketNo
            { set { _ticketno = value; } }

            public Int32 MBPSExt
            { set { _mbpsext = value; } }

            public DateTime RequestDate
            { set { _requestdate = value; } }

        #endregion

        #region Public Methods
            public DataTable displayAction()
            {
                DataTable dt = new DataTable();
                var oParam = new SqlCommand().Parameters;
                oParam.AddWithValue("@scopeid", _scopeid);
                return dt = this.FGetDataTable(@"ReARConcernTypesDisplay", oParam);
            }    

            public DataTable displayType()
            {
                DataTable dt = new DataTable();
                return dt = this.FGetDataTable(@"ReARTypeDisplay");
            }

            public DataTable displayApplication()
            {
                DataTable dt = new DataTable();
                var oParam = new SqlCommand().Parameters;
                oParam.AddWithValue("@contype", _contype);
                return dt = this.FGetDataTable(@"ReARRequestTypesDisplay", oParam);
            }

            public string InsertReAR() 
            {
                string msg;
                var oParam = new SqlCommand().Parameters;
                oParam.AddWithValue("@requestid", _requestid);
                oParam.AddWithValue("@requestdesc", _requestdesc);
                oParam.AddWithValue("@teamid", _teamid);
                oParam.AddWithValue("@workdayid", _workdayid);
                oParam.AddWithValue("@summary",_summary);
                oParam.AddWithValue("@mbpsext",_mbpsext);
                oParam.AddWithValue("@mbpsmail",_mbpsmail);
                try
                {
                    this.ExecuteInsert(@"ReARInsert", oParam);
                    msg = "Saved!";
                }
                catch (Exception ex)
                {
                    msg = ex.ToString();
                }

                return msg;
            }

            public DataTable displayReAR(bool _five)
            {
                DataTable dtTickets = new DataTable();
                var oParam = new SqlCommand().Parameters;
                oParam.AddWithValue("@workdayid", _workdayid);
                oParam.AddWithValue("@five", _five);
                return dtTickets = this.FGetDataTable(@"ReARDisplay", oParam);
            }

            public DataTable displayTicketDetailsV2()
            {
                DataTable dt = new DataTable();
                var oParam = new SqlCommand().Parameters;
                oParam.AddWithValue("@ticketNo", _ticketno);
                return dt = this.FGetDataTable(@"ReARDetailsDisplayV2", oParam);
            }

        #endregion
    }
}