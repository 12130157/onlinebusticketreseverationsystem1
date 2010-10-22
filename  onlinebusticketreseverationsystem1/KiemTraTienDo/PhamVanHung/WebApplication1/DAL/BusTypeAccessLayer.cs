using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
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
        public int DeleteBusTypeByID(int id)
        {
            return ExecuteNonQuery("DeleteBusTypeByID", createParameter("@BT_Id", id));
        }
        public int DeleteBusTypeByName(String name)
        {
            return ExecuteNonQuery("DeleteBusTypeByName", createParameter("@Name", name));
        }
        #endregion

        public string CheckExistSearchBusTypeName(String name)
        {
            string str = null;
            dt = ExecuteDataTable("SelectBusTypeByName", createParameter("@Name", name));
            if (dt.Rows.Count == 0)
            {
                str = "Ten Nay Khong Ton Tai";
            }
            return str;
        }  
    
        public string CheckExistSearchBusTypeID(int id)
        {
            string str = null;
            dt = ExecuteDataTable("SelectBusTypeByID", createParameter("@BT_Id",id));
            if (dt.Rows.Count == 0)
            {
                str = "ID Nay Khong Ton Tai";
            }
            return str;
        }
        public string CheckExistUpdateBusType(int id)
        {
            string str = null;
            dt = ExecuteDataTable("SelectBusTypeByID", createParameter("@BT_Id", id));
            if (dt.Rows.Count == 0)
            {
                str = "ID Nay Khong Ton Tai";
            }
            return str;
        }
        
        public string CheckExistInsertBusTypeName(String name)
        {
            string str = null;
            dt = ExecuteDataTable("SelectBusTypeByName", createParameter("@Name", name));
            if (dt.Rows.Count == 0)
            {
               str = "Ten chua su dung.Ban co the dung";
            }
            else
            {
               str = "Ten nay da ton tai. Xin nhap ten khac";
            }
            return str;
        }
    }
}

