using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace DataAccessLayer
{
    public   class BusTypeAccessData:ExecuteDataBase
    {
        public BusTypeAccessData()
        {

        }
        public DataTable GetAllBusType()
        {
            return ExecuteDataTable("SelectAllBusType",null);
        }
        public int AddBusType(String Name,String Description)
        {
            IDataParameter[] idp=new IDataParameter[2];
            idp[0] = createParameter("@Name", Name);
            idp[1] = createParameter("@Description", Description);
            return ExecuteNonQuery("InsertBusTpye");
        }
    }
}
