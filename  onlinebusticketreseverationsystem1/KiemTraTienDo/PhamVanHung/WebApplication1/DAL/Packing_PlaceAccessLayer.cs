using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class Packing_PlaceAccessLayer: ExecuteDataBase
    {
        #region SelectPacking_Place
        public DataTable GetAllPacking_Place()
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectAllPacking_Place", null);
            return dt;
        }
        public DataTable GetPacking_PlaceByID(int id)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectPacking_PlaceByID", createParameter("@PP_Id", id));
            return dt;
        }
        public DataTable GetPacking_PlaceByName(string name)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectPacking_PlaceByName", createParameter("@Name", name));
            return dt;
        }
        #endregion
        #region UpdatePacking_Place  
      
        public int UpdatePacking_PlaceByID(int id, String name, int c_id, Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[4];
            idp[0] = createParameter("@PP_Id", id);
            idp[1] = createParameter("@Name", name);
            idp[2] = createParameter("@Ci_Id", c_id);
            idp[3] = createParameter("@Status", status);
            return ExecuteNonQuery("UpdateCityByID");
        }
        public int UpdatePacking_PlaceByName(String name, int c_id, Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[3];            
            idp[0] = createParameter("@Name", name);
            idp[1] = createParameter("@Ci_Id", c_id);
            idp[2] = createParameter("@Status", status);
            return ExecuteNonQuery("UpdateCityByName");
        }
        #endregion

        #region InsertPacking_Place
        public int InsertPacking_Place(int id,String name,int c_id,Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[4];
            idp[0] = createParameter("@PP_Id",id);
            idp[1] = createParameter("@Name", name);
            idp[2] = createParameter("@Ci_Id", c_id);
            idp[3] = createParameter("@Status", status);
            return ExecuteNonQuery("InsertPacking_Place");
        }
        #endregion
        
        #region DeletePacking_Place
        public int DeletePacking_PlaceByID(int id)
        {
            return ExecuteNonQuery("DeleteCityByID", createParameter("@Ci_Id", id));
        }
        public int DeletePacking_PlaceByName(string name)
        {
            return ExecuteNonQuery("DeleteCityByName", createParameter("@Name", name));
        }
        
        #endregion
    }
}
