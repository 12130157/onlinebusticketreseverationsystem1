using System;
using System.Collections.Generic;
using System.Linq;
using BOL.Process;
using BOL.Entity;
using System.Text;
using System.Data;
using DAL;

namespace BOL.Process
{
    public class Bol_Sales
    {
        SalesAccessLayer btac;
        public Bol_Sales()
        {
            btac = new SalesAccessLayer();
        }
        #region Select

        public DataTable SelectAllSales()
        {
            return btac.GetAllSales();
        }
        public DataTable SelectSalesByID(Sales sl)
        {
            return btac.GetSalesByID(sl.Sa_ID);
        }
        public DataTable SelectSalesByName(Sales sl)
        {
            return btac.GetSalesByName(sl.Name);
        }
        public int CheckSalesExistByID(int id)
        {
            return btac.CheckSalesExistByID(id);
        }
        public int CheckSalesExistByName(string name)
        {
            return btac.CheckSalesExistByName(name);
        }
        #endregion
        #region Insert
        public int InsertSales(Sales sl)
        {
            return btac.InsertSales(sl.Sa_ID,sl.Name, sl.Minage, sl.Maxage, sl.Rate, sl.Status);
        }
        #endregion
        #region UpdateSales
        public int UpdateSalesByID(Sales sl)
        {
            return btac.UpdateSalesByID(sl.Sa_ID, sl.Name, sl.Minage, sl.Maxage, sl.Rate, sl.Status);
        }
        public int UpdateSalesByName(Sales sl)
        {
            return btac.UpdateSalesByName(sl.Name, sl.Minage, sl.Maxage, sl.Rate, sl.Status);
        }
        #endregion

        #region DeleteSales
        public int DeleteSalesByID(Sales sl)
        {
            return btac.DeleteSalesByID(sl.Sa_ID);
        }
        public int DeleteSalesByName(Sales sl)
        {
            return btac.DeleteSalesByName(sl.Name);
        }
        #endregion
    }
}
