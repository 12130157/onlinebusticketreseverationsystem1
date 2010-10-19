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
    public partial class FormInsertBusType : System.Web.UI.Page
    {
        Bol_BusType bolbt;
        BusType bt;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bolbt = new Bol_BusType();
                bt = new BusType();
                GridView1.DataSource = bolbt.SelectAllBusType();
                GridView1.DataBind();
            }                    
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            bt.Name = TextBox1.Text;
            bt.Price = Convert.ToDouble(TextBox2.Text);
            bt.Description = TextBox3.Text;
            if (RadioButton1.Checked)
            {
                bt.Status = true;
            }
            else
            {
                bt.Status = false;
            }
            bolbt.InsertBusType(bt);
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bt = new BusType();
            bolbt = new Bol_BusType();
            if (DropDownList1.SelectedValue.ToString() == "ByID")
            {
                bt.BT_ID = Convert.ToInt32(txtSearch.Text);
                GridView1.DataSource = bolbt.SelectBusTypeByID(bt);
                GridView1.DataBind();
            }
            else if(DropDownList1.SelectedValue.ToString() == "ByName")
            {
                bt.Name = txtSearch.Text;
                GridView1.DataSource = bolbt.SelectBusTypeByName(bt);
                GridView1.DataBind();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bt = new BusType();
            bolbt = new Bol_BusType();
            if (DropDownList2.SelectedValue.ToString() == "ByID")
            {
                bt.BT_ID = Convert.ToInt32(txtID.Text);
                bt.Name = txtName.Text;
                bt.Description = txtDescription.Text;
                bt.Price = Convert.ToDouble(txtPrice.Text);
                if (RadioButton3.Checked)
                {
                    bt.Status = true;
                }
                else if(RadioButton4.Checked)
                {
                    bt.Status = false;
                }
                try
                {
                    GridView1.DataSource = bolbt.UpdateBusTypeByID(bt);
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message+"SAO LAI THE NHI !!!");
                }
            }
            else if (DropDownList2.SelectedValue.ToString() == "ByName")
            {
                bt.Name = txtName.Text;
                bt.Description = txtDescription.Text;
                bt.Price = Convert.ToDouble(txtPrice.Text);
                if (RadioButton3.Checked)
                {
                    bt.Status = true;
                }
                else if (RadioButton4.Checked)
                {
                    bt.Status = false;
                }
                try
                {
                    GridView1.DataSource = bolbt.UpdateBusTypeByName(bt);
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message +"CHAN CHUA KIA !!!");
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bolbt = new Bol_BusType();
            bt = new BusType();
            if (DropDownList3.SelectedValue.ToString() == "ByID")
            {
                bt.BT_ID = Convert.ToInt32(txtDelete.Text);
                GridView1.DataSource = bolbt.DeleteBusTypeByID(bt);
                GridView1.DataBind();
            }
            else if (DropDownList3.SelectedValue.ToString() == "ByName")
            {
                bt.Name = txtDelete.Text;
                GridView1.DataSource = bolbt.DeleteBusTypeByName(bt);
                GridView1.DataBind();
            }

        }



    }
}
