using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BOL.Entity
{
    
    public class City
    {
        private int Ci_Id;

        public int Ci_ID
        {
            get { return Ci_Id; }
            set { Ci_Id = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
    }

}
