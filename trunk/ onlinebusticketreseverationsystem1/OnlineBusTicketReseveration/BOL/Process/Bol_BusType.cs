using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BOL.Entity;
using System.Data;
using DataAccessLayer;
namespace BOL.Process
{
    public class Bol_BusType
    {
        BusTypeAccessData bt;
        public Bol_BusType()
        {
            bt = new BusTypeAccessData();
        }
        #region Select
            #region SelectAll
                public DataTable GetAll()
                {
                    return bt.GetAllBusType();
                }
            #endregion
        #endregion
    }
}
