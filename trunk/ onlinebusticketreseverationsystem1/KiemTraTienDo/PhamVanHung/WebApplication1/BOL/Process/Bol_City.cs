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
   public class Bol_City
    {
       CityAccessLayer btac;
        public Bol_City()
        {
            btac = new CityAccessLayer();
        }
        #region Select

        public DataTable SelectAllCity()
        {
            return btac.SelectAllCity();
        }
        public DataTable SelectCityByID(City ct)
        {
            return btac.SelectCityByID(ct.Ci_ID);
        }
        public DataTable SelectCityByName(City ct)
        {
            return btac.SelectCityByName(ct.Name);
        }
        #endregion
        #region Insert
        public int InsertCity(City ct)
        {
            return btac.InsertCity(ct.Name);
        }
        #endregion
        #region UpdateCity
        public int UpdateCityByID(City ct)
        {
            return btac.UpdateCityByID(ct.Ci_ID,ct.Name);
        }
        public int UpdateCityByName(City ct)
        {
            return btac.UpdateCityByName(ct.Name);
        }
        #endregion
        #region Delete
        public int DeleteCityByID(City ct)
        {
            return btac.DeleteCityByID(ct.Ci_ID);
        }
        public int DeleteCityByName(City ct)
        {
            return btac.DeleteCityByName(ct.Name);
        }
        #endregion
    }
}
