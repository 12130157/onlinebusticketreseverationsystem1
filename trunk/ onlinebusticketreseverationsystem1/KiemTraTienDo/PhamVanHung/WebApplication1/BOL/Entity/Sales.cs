using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BOL.Entity
{
    public class Sales
    {
        private int Sa_Id;

        public int Sa_ID
        {
            get { return Sa_Id; }
            set { Sa_Id = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private int minage;

        public int Minage
        {
            get { return minage; }
            set { minage = value; }
        }
        private int maxage;

        public int Maxage
        {
            get { return maxage; }
            set { maxage = value; }
        }
        private int rate;

        public int Rate
        {
            get { return rate; }
            set { rate = value; }
        }
        private bool status;

        public bool Status
        {
            get { return status; }
            set { status = value; }
        }
    }   
}
