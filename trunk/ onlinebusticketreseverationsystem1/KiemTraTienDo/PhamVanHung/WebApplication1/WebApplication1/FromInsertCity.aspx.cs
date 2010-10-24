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
     
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "")
            {
                Response.Write("KO DUOC DE TRONG");
            }
            else
            {
                if (bc.CheckCityExistByName(txtName.Text) == 1)
                {
                    ct.Name = txtName.Text;
                    bc.InsertCity(ct);
                    Response.Write("Ten chua ton tai ban co the su dung !!!");
                }
                else
                {
                    txtName.Text = "";
                    Response.Write("Ten da ton tai ban vui long nhap ten khac !!!");
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bc = new Bol_City();
            ct = new City();
            if (txtSearch.Text == "")
            {
                Response.Write("Vui long nhap tu khoa muon tim !!!");
                txtSearch.Focus();
            }
            else
            {
                if (DropDownList1.SelectedValue.ToString() == "ByID")
                {
                    if (bc.CheckCityExistByID(Convert.ToInt32(txtSearch.Text)) == 1)
                    {
                        ct.Ci_ID = Convert.ToInt32(txtSearch.Text);
                        GridView1.DataSource = bc.SelectCityByID(ct);
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
                    if (bc.CheckCityExistByName(txtSearch.Text) == 1)
                    {
                        ct.Name = txtSearch.Text;
                        GridView1.DataSource = bc.SelectCityByName(ct);
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bc = new Bol_City();
            ct = new City();
            if (txtID.Text == "")
            {
                Response.Write("Vui long nhap ten hay id can cap nhat !!!");
                txtID.Focus();
            }
            else
            {
                if (DropDownList4.SelectedValue.ToString() == "ByID")
                {
                    if (bc.CheckCityExistByID(Convert.ToInt32(txtSearch.Text)) == 1)
                    {
                        if (TextBox1.Text == "")
                        {
                            Response.Write("Ban dang de trong phan cap nhat !!!");
                            TextBox1.Focus();
                        }
                        else
                        {
                            ct.Ci_ID = Convert.ToInt32(TextBox1.Text);
                            GridView1.DataSource = bc.UpdateCityByID(ct);
                            GridView1.DataBind();
                            Response.Write("Update thanh cong");
                        }
                    }
                    else
                    {
                        Response.Write("ID nay khong ton tai !!!");
                    }
                }
                else if (DropDownList4.SelectedValue.ToString() == "ByName")
                {
                    if (bc.CheckCityExistByName(txtSearch.Text) == 1)
                    {
                        ct.Name = TextBox1.Text;
                        GridView1.DataSource = bc.UpdateCityByName(ct);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("Name nay khong ton tai !!!");
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bc = new Bol_City();
            ct = new City();
            if (txtDelete.Text == "")
            {
                Response.Write("Nhap id hay ten can xoa !!!");
                txtDelete.Focus();
            }
            else if (DropDownList4.SelectedValue.ToString() == "ByID")
            {
                if (bc.CheckCityExistByID(Convert.ToInt32(txtSearch.Text)) == 1)
                {
                    ct.Ci_ID = Convert.ToInt32(TextBox1.Text);
                    GridView1.DataSource = bc.DeleteCityByID(ct);
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("ID nay khong ton tai !!!");
                }
            }
            else if (DropDownList4.SelectedValue.ToString() == "ByName")
            {
                if (bc.CheckCityExistByName(txtSearch.Text) == 1)
                {
                    ct.Name = TextBox1.Text;
                    GridView1.DataSource = bc.DeleteCityByName(ct);
                    GridView1.DataBind();
                    Response.Write("Xoa thanh cong !!!");
                }
                else
                {
                    Response.Write("Name nay khong ton tai !!!");
                }
            }

        }

    }
}
