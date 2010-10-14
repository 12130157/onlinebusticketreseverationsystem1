using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BOL.Entity
{
    public class Packing_Place
    {
        private int PP_Id;

        public int PP_ID
        {
            get { return PP_Id; }
            set { PP_Id = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private int Ci_Id;

        public int Ci_ID
        {
            get { return Ci_Id; }
            set { Ci_Id = value; }
        }
        private bool status;

        public bool Status
        {
            get { return status; }
            set { status = value; }
        }
    }
 
}
