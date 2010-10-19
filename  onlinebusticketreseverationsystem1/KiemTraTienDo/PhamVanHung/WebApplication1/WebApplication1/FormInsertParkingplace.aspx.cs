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
using BOL.Entity;
using BOL.Process;
namespace WebApplication1
{
    public partial class FormInsertParkingplace : System.Web.UI.Page
    {
        Bol_Packing_Place bpp;
        Bol_City ci;        
        Packing_Place pl;
        protected void Page_Load(object sender, EventArgs e)
        {
            ci = new Bol_City();
            DropDownList1.DataSource = ci.SelectAllCity();
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "Ci_id";
            DropDownList1.DataBind();

            bpp = new Bol_Packing_Place();
            GridView1.DataSource = bpp.SelectAllPacking_Place();
            GridView1.DataBind();         

         }
        private void loadlist()
        {          
        
        }     
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = Convert.ToString(DropDownList1.Text);
            Packing_Place pp = new Packing_Place();
            pp.Name = TextBox1.Text;
            pp.Ci_ID = Convert.ToInt32(DropDownList1.SelectedValue);//cai nay la value ne`
            Label1.Text = Convert.ToString(pp.Ci_ID);
            pp.Status = true;
            bpp.InsertPacking_Place(pp).ToString();
            ////day la form insert paking place ah de xem luon

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //bpp = new Bol_Packing_Place();
            //GridView1.DataSource = bpp.SelectPacking_PlaceByID(DropDownList1.SelectedItem.Value.ToString());
            //GridView1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            pl = new Packing_Place();
            bpp = new Bol_Packing_Place();
            if (DropDownList2.SelectedValue.ToString() == "ByID")
            {
                pl.PP_ID = Convert.ToInt32(txtSearch.Text);                
                GridView1.DataSource = bpp.SelectPacking_PlaceByID(pl);
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue.ToString() == "ByName")
            {
                pl.Name = txtSearch.Text;
                GridView1.DataSource = bpp.SelectPacking_PlaceByName(pl);
                GridView1.DataBind();
            }
        }
    }
}
