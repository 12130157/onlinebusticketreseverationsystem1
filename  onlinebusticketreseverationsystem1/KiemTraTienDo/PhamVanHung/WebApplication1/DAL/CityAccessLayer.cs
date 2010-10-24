using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
   public class CityAccessLayer:ExecuteDataBase
    {
        #region SelectCity
        public DataTable SelectAllCity()
        { 
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectAllCity", null);
            return dt;
        }
        public DataTable SelectCityByID(int id)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectCityByID",createParameter("@Ci_Id",id));
            return dt;
        }
        public DataTable SelectCityByName(string name)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectCityByName",createParameter("@Name",name));
            return dt;
        }

        public int CheckCityExistByName(string name)
        {
            int i =0;
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectCityByName", createParameter("@Name", name));
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
        public int CheckCityExistByID(int id)
        {
            int i = 0;
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectCityByID", createParameter("@Ci_Id", id));
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

        #region InsertCity
        public int InsertCity(String Name)
        {
            return ExecuteNonQuery("InsertCity", createParameter("@Name", Name));
        }
        #endregion

        #region UpdateCity
        public int UpdateCityByID(int id,String name)
        {
            IDbDataParameter[] idb = new IDbDataParameter[2];
            idb[0] = createParameter("@Ci_Id", id);
            idb[1] = createParameter("@Name", name);
            return ExecuteNonQuery("UpdateCityByID",idb);
        }
        public int UpdateCityByName(string name)
        {
            return ExecuteNonQuery("UpdateCityByName", createParameter("@Name", name));
        }
        #endregion
        #region DeleteCity
        public int DeleteCityByID(int id)
        {
            return ExecuteNonQuery("DeleteCityByID", createParameter("@Ci_Id", id));
        }
        public int DeleteCityByName(String name)
        {
            return ExecuteNonQuery("DeleteCityByName", createParameter("@Name", name));
        }
        #endregion
    }
}
