using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MBPS_Central
{
    public class DbInterface
    {
		#region "Objects/Variables"
			public SqlConnection oConn = new SqlConnection();
			private string sErrMessage = string.Empty;
		#endregion
		
        #region "Properties"
			public string ErrMessage
			{
				get { return sErrMessage; }
			}
        #endregion

        #region "Private Methods"
			private string FGetConnString()
			{
				string sConnString = string.Empty;

				string sDbUserName = string.Empty;
				string sDbPwd = string.Empty;
				string sServer = string.Empty;
				string sInitialCatalog = string.Empty;

				sServer = ConfigurationManager.AppSettings["Server"].ToString();
                sInitialCatalog = ConfigurationManager.AppSettings["Initial Catalog"].ToString();
                sDbUserName = ConfigurationManager.AppSettings["dbUser"].ToString();
                sDbPwd = ConfigurationManager.AppSettings["dbPwd"].ToString();

				sConnString = "Server=" + sServer + ";Initial Catalog=" + sInitialCatalog + ";uid=" + sDbUserName + ";pwd=" + sDbPwd + ";Max Pool Size=500";
				return sConnString;
			}

			private bool CheckDBConnStatus()
			{
				try
				{
					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = this.FGetConnString();
						oConn.Open();
					}
					return true;
				}
				catch (Exception err)
				{
					sErrMessage = " Runtime Error: " + err.Message;
					return false;
				}
			}
        #endregion

        #region "Public Methods"
			public int FExecuteQuery(string sProc)
			{
				int iRecordsAffected = 0;
				if (CheckDBConnStatus() == true)
				{
					SqlTransaction oTrans;
					oTrans = oConn.BeginTransaction();

					try
					{
						SqlCommand oCmd = new SqlCommand(sProc, oConn, oTrans);
						oCmd.CommandType = CommandType.StoredProcedure;

						iRecordsAffected = oCmd.ExecuteNonQuery();
						oTrans.Commit();

						oTrans.Dispose();
						oTrans = null;

						oCmd.Dispose();
						oCmd = null;

						oConn.Close();
						return iRecordsAffected;
					}

					catch (SqlException sqlerr)
					{
						oTrans.Rollback();
						sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
						return iRecordsAffected;
					}

					catch (Exception err)
					{
						oTrans.Rollback();
						sErrMessage = " Runtime Error: " + err.Message;
						return iRecordsAffected;
					}
				}
				else
				{
					return iRecordsAffected;
				}
			}

			public int FExecuteQuery(string sProc, SqlParameterCollection oArrParam)
			{
				int iRecordsAffected = 0;
				if (CheckDBConnStatus() == true)
				{
					SqlTransaction oTrans;
					oTrans = oConn.BeginTransaction();

					try
					{
						SqlCommand oCmd = new SqlCommand(sProc, oConn, oTrans);
						oCmd.CommandType = CommandType.StoredProcedure;

						foreach (SqlParameter oParam in oArrParam)
						{
							oCmd.Parameters.Add(oParam.ParameterName, oParam.SqlDbType).Value = oParam.Value;
						}

						iRecordsAffected = oCmd.ExecuteNonQuery();
						oTrans.Commit();

						oTrans.Dispose();
						oTrans = null;

						oCmd.Dispose();
						oCmd = null;

						oConn.Close();
						return iRecordsAffected;
					}

					catch (SqlException sqlerr)
					{
						oTrans.Rollback();
						sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
						return iRecordsAffected;
					}

					catch (Exception err)
					{
						oTrans.Rollback();
						sErrMessage = " Runtime Error: " + err.Message;
						return iRecordsAffected;
					}
				}
				else
				{
					return iRecordsAffected;
				}
			}

			public int ExecuteInsert(string sProc, SqlParameterCollection oArrParam)
			{
				int iRecordsAffected = 0;
				if (CheckDBConnStatus() == true)
				{
					SqlTransaction oTrans;
					oTrans = oConn.BeginTransaction();

					try
					{

						SqlCommand oCmd = new SqlCommand(sProc, oConn, oTrans);
						oCmd.CommandType = CommandType.StoredProcedure;

						foreach (SqlParameter oParam in oArrParam)
						{
							oCmd.Parameters.Add(oParam.ParameterName, oParam.SqlDbType).Value = oParam.Value;
						}

						iRecordsAffected = oCmd.ExecuteNonQuery();
						oTrans.Commit();

						oTrans.Dispose();
						oTrans = null;
						oCmd.Dispose();
						oCmd = null;

						oConn.Close();
						return iRecordsAffected;

					}
					catch (SqlException sqlerr)
					{
						oTrans.Rollback();
						sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
						return iRecordsAffected;

					}

					catch (Exception err)
					{
						oTrans.Rollback();
						sErrMessage = " Runtime Error: " + err.Message;
						return iRecordsAffected;
					}
				}
				else
				{
					return iRecordsAffected;
				}
			}

            public int ExecuteScalar(string sProc, SqlParameterCollection oArrParam)
            {
                int iRecordsAffected = 0;
                if (CheckDBConnStatus() == true)
                {
                    SqlTransaction oTrans;
                    oTrans = oConn.BeginTransaction();

                    try
                    {

                        SqlCommand oCmd = new SqlCommand(sProc, oConn, oTrans);
                        oCmd.CommandType = CommandType.StoredProcedure;

                        foreach (SqlParameter oParam in oArrParam)
                        {
                            oCmd.Parameters.Add(oParam.ParameterName, oParam.SqlDbType).Value = oParam.Value;
                        }

                        iRecordsAffected = Convert.ToInt32(oCmd.ExecuteScalar());
                        oTrans.Commit();

                        oTrans.Dispose();
                        oTrans = null;
                        oCmd.Dispose();
                        oCmd = null;

                        oConn.Close();
                        return iRecordsAffected;

                    }
                    catch (SqlException sqlerr)
                    {
                        oTrans.Rollback();
                        sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
                        return iRecordsAffected;

                    }

                    catch (Exception err)
                    {
                        oTrans.Rollback();
                        sErrMessage = " Runtime Error: " + err.Message;
                        return iRecordsAffected;
                    }
                }
                else
                {
                    return iRecordsAffected;
                }
            }

			public SqlDataReader ExecuteInsertWithIdentity(string sProc, SqlParameterCollection oArrParam)
			{
				SqlDataReader oRd = null;
				if (CheckDBConnStatus() == true)
				{
					try
					{
						SqlCommand oCmd = new SqlCommand(sProc, oConn);
						oCmd.CommandType = CommandType.StoredProcedure;

						foreach (SqlParameter oParam in oArrParam)
						{
							oCmd.Parameters.Add(oParam.ParameterName, oParam.SqlDbType).Value = oParam.Value;
						}

						if (oConn.State == ConnectionState.Closed)
						{
							oConn.ConnectionString = this.FGetConnString();
							oConn.Open();
						}

						oRd = oCmd.ExecuteReader();
						return oRd;
					}
					catch (SqlException sqlerr)
					{
						sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
						return oRd;

					}

					catch (Exception err)
					{
						sErrMessage = " Runtime Error: " + err.Message;
						return oRd;
					}
				}
				else
				{
					return oRd;
				}
			}

			public SqlDataReader FReadData(string sProc, SqlParameterCollection oArrParam)
			{
				SqlDataReader oRd = null;
				try
				{

					SqlCommand oCmd = new SqlCommand(sProc, oConn);
					oCmd.CommandType = CommandType.StoredProcedure;

					foreach (SqlParameter oParam in oArrParam)
					{
						oCmd.Parameters.Add(oParam.ParameterName, oParam.SqlDbType).Value = oParam.Value;
					}

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = this.FGetConnString();
						oConn.Open();
					}

					oRd = oCmd.ExecuteReader();
					return oRd;

				}
				catch (SqlException sqlerr)
				{
					sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
					return oRd;
				}

				catch (Exception err)
				{
					sErrMessage = " Runtime Error: " + err.Message;
					return oRd;
				}
			}

			public DataSet FGetDataSet(string sProc, SqlParameterCollection oArrParam)
			{
				DataSet oDs = null;
				try
				{
					SqlCommand oCmd = new SqlCommand(sProc, oConn);
					oCmd.CommandType = CommandType.StoredProcedure;

					foreach (SqlParameter oParam in oArrParam)
					{
						oCmd.Parameters.Add(oParam.ParameterName, oParam.SqlDbType).Value = oParam.Value;
					}

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = this.FGetConnString();
						oConn.Open();
					}

					SqlDataAdapter da = new SqlDataAdapter(oCmd);
					oDs = new DataSet();

					da.Fill(oDs);
					da.Dispose();

					da = null;
					oCmd.Dispose();
					oCmd = null;
					oConn.Close();

					return oDs;
				}

				catch (SqlException sqlerr)
				{
					sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
					return oDs;
				}

				catch (Exception err)
				{
					sErrMessage = " Runtime Error: " + err.Message;
					return oDs;
				}
			}

			public DataSet FGetDataSet(string sProc)
			{
				DataSet oDs = null;
				try
				{
					SqlCommand oCmd = new SqlCommand(sProc, oConn);
					oCmd.CommandType = CommandType.StoredProcedure;

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = this.FGetConnString();
						oConn.Open();
					}

					SqlDataAdapter da = new SqlDataAdapter(oCmd);
					oDs = new DataSet();

					da.Fill(oDs);
					da.Dispose();

					da = null;
					oCmd.Dispose();
					oCmd = null;
					oConn.Close();

					return oDs;
				}

				catch (SqlException sqlerr)
				{
					sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
					return oDs;
				}

				catch (Exception err)
				{
					sErrMessage = " Runtime Error: " + err.Message;
					return oDs;
				}
			}

			public DataTable FGetDataTable(string sProc, SqlParameterCollection oArrParam)
			{
				DataTable oDt = null;

				try
				{
					SqlCommand oCmd = new SqlCommand(sProc, oConn);
					oCmd.CommandType = CommandType.StoredProcedure;

					foreach (SqlParameter oParam in oArrParam)
					{
						oCmd.Parameters.Add(oParam.ParameterName, oParam.SqlDbType).Value = oParam.Value;
					}

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = this.FGetConnString();
						oConn.Open();
					}

					SqlDataAdapter da = new SqlDataAdapter(oCmd);
					oDt = new DataTable();

					da.Fill(oDt);
					da.Dispose();

					da = null;
					oCmd.Dispose();
					oCmd = null;
					oConn.Close();

					return oDt;
				}
				catch (SqlException sqlerr)
				{
					sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
					return oDt;
				}

				catch (Exception err)
				{
					sErrMessage = " Runtime Error: " + err.Message;
					return oDt;
				}
			}

			public DataTable FGetDataTable(string sProc)
			{
				DataTable oDt = null;

				try
				{
					SqlCommand oCmd = new SqlCommand(sProc, oConn);
					oCmd.CommandType = CommandType.StoredProcedure;

					if (oConn.State == ConnectionState.Closed)
					{
						oConn.ConnectionString = this.FGetConnString();
						oConn.Open();
					}

					SqlDataAdapter da = new SqlDataAdapter(oCmd);
					oDt = new DataTable();

					da.Fill(oDt);
					da.Dispose();

					da = null;
					oCmd.Dispose();
					oCmd = null;
					oConn.Close();

					return oDt;
				}
				catch (SqlException sqlerr)
				{
					sErrMessage = "SQL Error: Number - " + sqlerr.Number + ", " + sqlerr.Message;
					return oDt;
				}

				catch (Exception err)
				{
					sErrMessage = " Runtime Error: " + err.Message;
					return oDt;
				}
			}

        #endregion
    }
}
