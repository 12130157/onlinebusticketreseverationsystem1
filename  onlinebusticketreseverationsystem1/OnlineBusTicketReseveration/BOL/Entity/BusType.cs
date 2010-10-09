using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BOL.Entity
{
    class BusType
    {
        private int bt_id;

        public int Bt_Id
        {
            get { return bt_id; }
            set { bt_id = value; }
        }
        private String  name;

        public String  Name
        {
            get { return name; }
            set { name = value; }
        }
        private String description;

        public String Description
        {
            get { return description; }
            set { description = value; }
        }
        
    }
}
