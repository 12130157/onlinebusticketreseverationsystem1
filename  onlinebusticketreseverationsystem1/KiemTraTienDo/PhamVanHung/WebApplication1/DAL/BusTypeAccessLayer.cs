using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    public class BusTypeAccessData : ExecuteDataBase
    {
        DataTable dt;
        public BusTypeAccessData()
        {

        }
        #region SelectBusType
        public DataTable SelectAllBusType()
        {
            return ExecuteDataTable("SelectAllBusType", null);
        }
        public DataTable SelectBusTypeByID(int ID)
        {
            return ExecuteDataTable("SelectBusTypeByID", createParameter("@BT_ID", ID));
        }
        public DataTable SelectBusTypeByName(String name)
        {
            return ExecuteDataTable("SelectBusTypeByName", createParameter("@Name",name));
        }
        public int CheckBusTypeExistByID(int id)
        {
            int i = 0;
            dt = new DataTable();
            dt = ExecuteDataTable("SelectBusTypeByID", createParameter("@BT_Id", id));
            if (dt.Rows.Count == 0)
            {
                i = 1;
            }
            else
            {
                i = 0;
            }
            return i;
        }
        public int CheckBusTypeExistByName(String name)
        {
            int i = 0;
            dt = new DataTable();
            dt = ExecuteDataTable("SelectBusTypeByName", createParameter("@Name", name));
            if (dt.Rows.Count == 0)
            {
                i = 1;
            }
            else
            {
                i = 0;
            }
            return i;
        }
        #endregion

        #region InsertBusType
        public int InsertBusType(int id,String Name, String Description, Double Price, Boolean Status)
        {
            IDataParameter[] idp = new IDataParameter[4];
            idp[0] = createParameter("@Name", Name);
            idp[1] = createParameter("@Description", Description);
            idp[2] = createParameter("@Price", Price);
            idp[3] = createParameter("@Status", Status);
            return ExecuteNonQuery("InsertBusType",idp);
        }
        #endregion

        #region UpdateBusType  
        public int UpdateBusTypeByID(int BT_Id,String Name, String Description,Double Price,Boolean Status)
        {
            IDataParameter[] idp = new IDataParameter[5];
            idp[0] = createParameter("@BT_Id", BT_Id);
            idp[1] = createParameter("@Name", Name);
            idp[2] = createParameter("@Description", Description);
            idp[3] = createParameter("@Price", Price);
            idp[4] = createParameter("@Status",Status);
            return ExecuteNonQuery("UpdateBusTypeByID",idp);
        }

        public int UpdateBusTypeByName(String Name, String Description, Double Price, Boolean Status)
        {
            IDataParameter[] idp = new IDataParameter[4];            
            idp[0] = createParameter("@Name", Name);
            idp[1] = createParameter("@Description", Description);
            idp[2] = createParameter("@Price", Price);
            idp[3] = createParameter("@Status", Status);
            return ExecuteNonQuery("UpdateBusTypeByName",idp);
        }
        #endregion

        #region DeleteBusType
        public SqlDataReader DeleteBusTypeByID(int id)
        {
            return ExecuteReader("DeleteBusTypeByID", createParameter("@BT_Id", id));
        }
        public SqlDataReader DeleteBusTypeByName(String name)
        {
            return ExecuteReader("DeleteBusTypeByName", createParameter("@Name", name));
        }
        #endregion
       

    }
}

