using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL.Process;
namespace OnlineBusTicketReseveration
{
    public partial class _Default : System.Web.UI.Page
    {
        Bol_BusType bt;
        protected void Page_Load(object sender, EventArgs e)
        {
            bt = new Bol_BusType();
            GridView1.DataSource = bt.GetAll();
            GridView1.DataBind();
        }
    }
}