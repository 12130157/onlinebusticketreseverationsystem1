using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{

    public class ExecuteDataBase
    {
        private    SqlConnection Conn;
        public ExecuteDataBase()
        {
            Conn = new SqlConnection(GetConnectionString("ConnectString"));
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ConnectionName"></param>
        /// <returns></returns>
        private String GetConnectionString(String ConnectionName)
        {
            return ConfigurationManager.ConnectionStrings[ConnectionName].ConnectionString;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ProceName"></param>
        /// <param name="ProcParams"></param>
        /// <returns></returns>
        private SqlCommand CreateSqlCommand(string ProceName, params IDataParameter[] ProcParams)
        {
            SqlCommand sqlComm = new SqlCommand();
            sqlComm.Connection = Conn;
            sqlComm.CommandText = ProceName;
            sqlComm.CommandType = CommandType.StoredProcedure;
            if (ProcParams != null)
            {
                sqlComm.Parameters.AddRange(ProcParams);
            }
            return sqlComm;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ProceName"></param>
        /// <param name="ProcParams"></param>
        /// <returns></returns>
        protected SqlDataReader ExecuteReader(string ProceName, params IDataParameter[] ProcParams)
        {
            SqlDataReader SqlReader= null;
            Conn.Open();
            try
            {
                SqlReader = CreateSqlCommand(ProceName, ProcParams).ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception)
            {

                throw;
            }
           
            return SqlReader;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="paramName"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        protected SqlParameter createParameter(string paramName, object value)
        {
            SqlParameter param = new SqlParameter(paramName, value);
            return param;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ProceName"></param>
        /// <param name="ProcParams"></param>
        /// <returns></returns>
        protected DataSet ExecuteDataset(string ProceName, params IDataParameter[] ProcParams)
        {
            DataSet Dt = new DataSet();
            SqlDataAdapter da = null;
            try
            {
                da = new SqlDataAdapter(CreateSqlCommand(ProceName, ProcParams));
                da.AcceptChangesDuringFill = true;
                da.Fill(Dt);
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
            }
            return Dt;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ProceName"></param>
        /// <param name="ProcParams"></param>
        /// <returns></returns>
        protected DataTable ExecuteDataTable(string ProceName, params IDataParameter[] ProcParams)
        {
            DataTable Dt = new DataTable();
            SqlDataAdapter da = null;
            try
            {
                da = new SqlDataAdapter(CreateSqlCommand(ProceName, ProcParams));
                da.AcceptChangesDuringFill = true;
                da.Fill(Dt);
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
            }
            return Dt;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ProceName"></param>
        /// <param name="ProcParams"></param>
        /// <returns></returns>
        protected int ExecuteNonQuery(string ProceName, params IDataParameter[] ProcParams)
        {
            int count;
            try
            {
                Conn.Open();
                count = CreateSqlCommand(ProceName, ProcParams).ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if(Conn.State==ConnectionState.Open)
                Conn.Close();
            }
            return count;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ProceName"></param>
        /// <param name="ProcParams"></param>
        /// <returns></returns>
        protected object ExecuteScalar(string ProceName, params IDataParameter[] ProcParams)
        {
            object count;
            try
            {
                Conn.Open();
                count = CreateSqlCommand(ProceName, ProcParams).ExecuteScalar();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
            }
            return count;
        }
    }
}
