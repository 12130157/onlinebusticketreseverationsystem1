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
            bolbt = new Bol_BusType();
            bt = new BusType();
            GridView1.DataSource = bolbt.SelectAllBusType();
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Response.Write("Ban dang de trong ten !!!");
                TextBox1.Focus();
            }
            else if (TextBox2.Text == "")
            {
                Response.Write("Ban dang de trong gia !!!");
                TextBox2.Focus();
            }
            else if (TextBox3.Text == "")
            {
                Response.Write("Ban dang de trong description !!!");
                TextBox3.Focus();
            }
            else
            {
                if (bolbt.CheckBusTypeExistByName(TextBox1.Text) == 0)
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
                else
                {
                    Response.Write("Ten ban nhap da~ ton tai. Vui long nhap ten khac !!!");
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bt = new BusType();
            bolbt = new Bol_BusType();
            if (txtSearch.Text == "")
            {
                Response.Write("Vui long nhap tu khoa muon tim !!!");
                txtSearch.Focus();
            }
            else
            {
                if (DropDownList1.SelectedValue.ToString() == "ByID")
                {
                    if (bolbt.CheckBusTypeExistByID(Convert.ToInt32(txtSearch.Text)) == 1)
                    {
                        bt.BT_ID = Convert.ToInt32(txtSearch.Text);
                        GridView1.DataSource = bolbt.SelectBusTypeByID(bt);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("ID nay khong ton tai !!!");
                        txtSearch.Focus();
                    }
                }
                else if (DropDownList1.SelectedValue.ToString() == "ByName")
                {
                    if (bolbt.CheckBusTypeExistByName(txtSearch.Text) == 1)
                    {
                        bt.Name = txtSearch.Text;
                        GridView1.DataSource = bolbt.SelectBusTypeByName(bt);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("Name nay khong ton tai !!!");
                        txtSearch.Focus();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bt = new BusType();
            bolbt = new Bol_BusType();
            if (txtID.Text == "")
            {
                Response.Write("Vui long nhap ten !!!");
                txtID.Focus();
            }            
            else
            {
                if (DropDownList2.SelectedValue.ToString() == "ByID")
                {
                    if (bolbt.CheckBusTypeExistByID(Convert.ToInt32(txtID.Text)) == 1)
                    {
                        if (txtName.Text == "")
                        {
                            Response.Write("Vui long nhap thong tin update !!!");
                            txtName.Focus();
                        }
                        else if (txtDescription.Text == "")
                        {
                            Response.Write("Vui long nhap thong tin update !!!");
                            txtDescription.Focus();
                        }
                        else if (txtPrice.Text == "")
                        {
                            Response.Write("Vui long nhap thong tin update !!!");
                            txtPrice.Focus();
                        }
                        else if (txtID.Text == "")
                        {
                            Response.Write("Vui long nhap thong tin update !!!");
                            txtID.Focus();
                        }
                        else
                        {
                            bt.BT_ID = Convert.ToInt32(txtID.Text);
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
                                GridView1.DataSource = bolbt.UpdateBusTypeByID(bt);
                                GridView1.DataBind();
                            }
                            catch (Exception ex)
                            {
                                Response.Write(ex.Message + "SAO LAI THE NHI !!!");
                            }
                        }
                    }
                    else
                    {
                        Response.Write("ID nay khong ton tai !!!");
                        txtID.Focus();
                    }

                }
                else if (DropDownList2.SelectedValue.ToString() == "ByName")
                {
                    if (bolbt.CheckBusTypeExistByName(txtID.Text) == 1)
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
                            Response.Write(ex.Message + "CHAN CHUA KIA !!!");
                        }
                    }
                    else
                    {
                        Response.Write("Name nay khong ton tai !!!");
                        txtName.Focus();
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bolbt = new Bol_BusType();
            bt = new BusType();
            if (txtDelete.Text == "")
            {
                Response.Write("Nhap ten hay id can xoa !!!");
                txtDelete.Focus();
            }
            else
            {
                if (DropDownList3.SelectedValue.ToString() == "ByID")
                {
                    if (bolbt.CheckBusTypeExistByID(Convert.ToInt32(txtDelete.Text)) == 1)
                    {
                        bt.BT_ID = Convert.ToInt32(txtDelete.Text);
                        GridView1.DataSource = bolbt.DeleteBusTypeByID(bt);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("ID nay khong ton tai !!!");
                        txtName.Focus();
                    }
                }

                else if (DropDownList3.SelectedValue.ToString() == "ByName")
                {
                    if (bolbt.CheckBusTypeExistByID(Convert.ToInt32(txtDelete.Text)) == 1)
                    {
                        bt.Name = txtDelete.Text;
                        GridView1.DataSource = bolbt.DeleteBusTypeByName(bt);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("Name nay khong ton tai !!!");
                        txtName.Focus();
                    }
                }
            }
        }
    }
}
