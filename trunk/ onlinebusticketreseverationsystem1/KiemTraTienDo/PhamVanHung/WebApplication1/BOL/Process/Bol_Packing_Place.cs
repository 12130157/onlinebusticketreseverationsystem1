using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using BOL.Entity;
using BOL.Process;
using System.Data;

namespace BOL.Process
{
    public class Bol_Packing_Place
    {
        Packing_PlaceAccessLayer btac;
        public Bol_Packing_Place()
        {
            btac = new Packing_PlaceAccessLayer();
        }

        #region Select

        public DataTable SelectAllPacking_Place()
        {
            return btac.GetAllPacking_Place();
        }
        public DataTable SelectPacking_PlaceByID(Packing_Place pl)
        {
            return btac.GetPacking_PlaceByID(pl.PP_ID);
        }
        public DataTable SelectPacking_PlaceByName(Packing_Place pl)
        {
            return btac.GetPacking_PlaceByName(pl.Name);
        }
        #endregion
        #region Insert
        public int InsertPacking_Place(Packing_Place pl)
        {
            return btac.InsertPacking_Place(pl.PP_ID, pl.Name, pl.Ci_ID, pl.Status);
        }
        #endregion
        #region Update
        public int UpdatePacking_PlaceByID(Packing_Place pl)
        {
            return btac.UpdatePacking_PlaceByID(pl.PP_ID, pl.Name, pl.Ci_ID, pl.Status);
        }
        public int UpdatePacking_PlaceByName(Packing_Place pl)
        {
            return btac.UpdatePacking_PlaceByName(pl.Name, pl.Ci_ID, pl.Status);
        }
        #endregion
        #region Delete
        public int DeletePacking_PlaceByID(Packing_Place pl)
        {
            return btac.DeletePacking_PlaceByID(pl.PP_ID);
        }
        public int DeletePacking_PlaceByName(Packing_Place pl)
        {
            return btac.DeletePacking_PlaceByName(pl.Name);
        }
        #endregion


    }
}
