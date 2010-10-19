using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BOL.Entity;
using BOL.Process;
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
        public int DeleteBusTypeByID(BusType bt)
        {
            return btac.DeleteBusTypeByID(bt.BT_ID);
        }
        public int DeleteBusTypeByName(BusType bt)
        {
            return btac.DeleteBusTypeByName(bt.Name);
        }
        #endregion

    }
}
