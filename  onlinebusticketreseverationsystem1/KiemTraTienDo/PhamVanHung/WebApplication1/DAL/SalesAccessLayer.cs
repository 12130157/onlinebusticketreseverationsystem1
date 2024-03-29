﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class SalesAccessLayer : ExecuteDataBase
    {
        DataTable dt;
        #region SelectSales
        public DataTable GetAllSales()
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectAllSales", null);
            return dt;
        }
        public DataTable GetSalesByID(int id)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectSalesByID", createParameter("@Sa_Id", id));
            return dt;
        }
        public DataTable GetSalesByName(string name)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectSalesByName", createParameter("@Name", name));
            return dt;
        }
        public int CheckSalesExistByID(int id)
        {
            int i=0;
            dt = new DataTable();
            dt = ExecuteDataTable("SelectSalesByID",createParameter("@Sa_Id",id));
            if(dt.Rows.Count ==0)
            {
                i = 1;
            }
            else
            {
                i = 0;
            }
            return i;
        }
        public int CheckSalesExistByName(String name)
        {
            int i = 0;
            dt = new DataTable();
            dt = ExecuteDataTable("SelectSalesByName", createParameter("@Name",name));
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
        #region InsertSales
        public int InsertSales(int id, String name, int minage, int maxage, int rate, Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[5];
            idp[0] = createParameter("@Name", name);
            idp[1] = createParameter("@MinAge", minage);
            idp[2] = createParameter("@MaxAge", maxage);
            idp[3] = createParameter("@Rate", rate);
            idp[4] = createParameter("@Status", status);
            return ExecuteNonQuery("InsertSales",idp);
        }
        #endregion

        #region UpdateSales
        public int UpdateSalesByID(int id,String name, int minage, int maxage, int rate, Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[6];
            idp[0] = createParameter("@Sa_Id", id);
            idp[1] = createParameter("@Name", name);
            idp[2] = createParameter("@MinAge", minage);
            idp[3] = createParameter("@MaxAge", maxage);
            idp[4] = createParameter("@Rate", rate);
            idp[5] = createParameter("@Status", status);
            return ExecuteNonQuery("UpdateSalesByID",idp);
        }

        public int UpdateSalesByName(String name, int minage, int maxage, int rate, Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[5];            
            idp[0] = createParameter("@Name", name);
            idp[1] = createParameter("@MinAge", minage);
            idp[2] = createParameter("@MaxAge", maxage);
            idp[3] = createParameter("@Rate", rate);
            idp[4] = createParameter("@Status", status);
            return ExecuteNonQuery("UpdateSalesByName",idp);
        }
        #endregion

        #region DeleteSales
        public int DeleteSalesByID(int id)
        {
            return ExecuteNonQuery("DeleteSalesByID", createParameter("@Sa_Id",id));
        }

        public int DeleteSalesByName(String name)
        {
            return ExecuteNonQuery("DeleteSalesByName", createParameter("@Name", name));
        }
        #endregion

    }
}
