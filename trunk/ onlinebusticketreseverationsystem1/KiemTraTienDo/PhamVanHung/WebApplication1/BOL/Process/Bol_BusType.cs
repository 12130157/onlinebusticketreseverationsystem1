using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BOL.Entity;
using BOL.Process;
using System.Data.SqlClient;
using System.Data;
using DAL;

namespace BOL.Process
{
    public class Bol_BusType
    {
        BusTypeAccessData btac;
        public Bol_BusType()
        {
            btac = new BusTypeAccessData();
        }
        #region Select
        
        public DataTable SelectAllBusType()
        {
            return btac.SelectAllBusType();
        }
        public DataTable SelectBusTypeByID(BusType bt)
        {
            return btac.SelectBusTypeByID(bt.BT_ID);
        }
        public DataTable SelectBusTypeByName(BusType bt)//-dc roi day=]] anh build di. Dung co chay. voi vi em chua lam cai present layer
        {
            return btac.SelectBusTypeByName(bt.Name);
        }
        public int CheckBusTypeExistByID(int id)
        {            
            return btac.CheckBusTypeExistByID(id);
                        
        }
        public int CheckBusTypeExistByName(string name)
        {
            return btac.CheckBusTypeExistByName(name);
        }
        #endregion
       
        #region Insert
        public int InsertBusType(BusType bt)
        {
            return btac.InsertBusType(bt.BT_ID,bt.Name, bt.Description, bt.Price, bt.Status);
        }
        #endregion

        #region UpdateBusType
        public int UpdateBusTypeByID(BusType bt)
        {
            return btac.UpdateBusTypeByID(bt.BT_ID, bt.Name, bt.Description, bt.Price, bt.Status);
        }
        public int UpdateBusTypeByName(BusType bt)
        {
            return btac.UpdateBusTypeByName(bt.Name, bt.Description, bt.Price, bt.Status);
        }
        #endregion

        #region DeleteBusType
        public SqlDataReader DeleteBusTypeByID(BusType bt)
        {
            return btac.DeleteBusTypeByID(bt.BT_ID);
        }
        public SqlDataReader DeleteBusTypeByName(BusType bt)
        {
            return btac.DeleteBusTypeByName(bt.Name);
        }
        #endregion

    }
}
