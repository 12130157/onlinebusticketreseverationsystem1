using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL.Process;
using BOL.Entity;
namespace OnlineBusTicketReseveration
{
    public partial class _Default : System.Web.UI.Page
    {
        Bol_Packing_Place pp;
        protected void Page_Load(object sender, EventArgs e)
        {
            pp = new Bol_Packing_Place();
            GridView2.DataSource = pp.SelectAllPacking_Place();
            GridView2.DataBind();
        }
    }
}