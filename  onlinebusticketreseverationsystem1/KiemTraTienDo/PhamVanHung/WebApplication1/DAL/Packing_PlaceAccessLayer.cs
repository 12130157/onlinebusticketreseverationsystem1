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
            dt = ExecuteDataTable("SelectAllParking_Place", null);
            return dt;
        }
        public DataTable GetPacking_PlaceByID(int id)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectParking_PlaceByID", createParameter("@PP_Id", id));
            return dt;
        }
        public DataTable GetPacking_PlaceByName(string name)
        {
            DataTable dt = new DataTable();
            dt = ExecuteDataTable("SelectParking_PlaceByName", createParameter("@Name", name));
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
            return ExecuteNonQuery("UpdatePacking_PlaceByID",idp);//loi zend code=))/ 
        }
        public int UpdatePacking_PlaceByName(String name, int c_id, Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[3];            
            idp[0] = createParameter("@Name", name);
            idp[1] = createParameter("@Ci_Id", c_id);
            idp[2] = createParameter("@Status", status);
            return ExecuteNonQuery("UpdateCityByName",idp);
        }
        #endregion

        #region InsertPacking_Place
        public int InsertPacking_Place(int id,String name,int c_id,Boolean status)
        {
            IDataParameter[] idp = new IDataParameter[3];
            idp[0] = createParameter("@Name", name);
            idp[1] = createParameter("@Ci_Id", c_id);
            idp[2] = createParameter("@Status", status);
            return ExecuteNonQuery("InsertParking_Place",idp);
        }
        #endregion
        
        #region DeletePacking_Place
        public int DeletePacking_PlaceByID(int id)
        {//loi~ do zen code day anh a =]]
            return ExecuteNonQuery("DeleteCityByID", createParameter("@Ci_Id", id));
        }
        public int DeletePacking_PlaceByName(string name)
        {
            return ExecuteNonQuery("DeleteCityByName", createParameter("@Name", name));
        }
        
        #endregion
    }
}
