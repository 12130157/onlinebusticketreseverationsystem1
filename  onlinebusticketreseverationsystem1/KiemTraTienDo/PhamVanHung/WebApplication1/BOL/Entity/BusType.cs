using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BOL.Entity
{
  public  class BusType
    {
        public BusType()
        { 

        }
        private int BT_Id;

        public int BT_ID
        {
            get { return BT_Id; }
            set { BT_Id = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        private double price;

        public double Price
        {
            get { return price; }
            set { price = value; }
        }
        private bool status;

        public bool Status
        {
            get { return status; }
            set { status = value; }
        }
    }
    
}