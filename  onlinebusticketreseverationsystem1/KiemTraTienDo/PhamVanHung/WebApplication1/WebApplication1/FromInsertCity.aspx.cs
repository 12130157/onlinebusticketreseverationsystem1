using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using BOL.Process;
using BOL.Entity;

namespace WebApplication1
{
    public partial class FromInsertCity : System.Web.UI.Page
    {
        Bol_City bc;
        City ct;
        protected void Page_Load(object sender, EventArgs e)
        {
            bc = new Bol_City();
            ct = new City();
            GridView1.DataSource = bc.SelectAllCity();
            GridView1.DataBind();            

        }
        protected void Check()
        {
            if (txtName.Text == "")
            {
                Response.Write("KO DUOC DE TRONG");
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
                 Check();
                 ct.Name = txtName.Text;
                 bc.InsertCity(ct);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bc = new Bol_City();
            ct = new City();
            if (DropDownList1.SelectedValue.ToString() == "ByID")
            {
                ct.Ci_ID = Convert.ToInt32(txtSearch.Text);
                GridView1.DataSource = bc.SelectCityByID(ct);
                GridView1.DataBind();
            }
            else if (DropDownList1.SelectedValue.ToString() == "ByName")
            {
                ct.Name = txtSearch.Text;
                GridView1.DataSource = bc.SelectCityByName(ct);
                GridView1.DataBind();
            }
        }
    }
}
