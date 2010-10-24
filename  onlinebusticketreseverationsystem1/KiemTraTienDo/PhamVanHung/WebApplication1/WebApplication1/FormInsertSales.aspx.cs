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
    public partial class FormInsertSales : System.Web.UI.Page
    {
        Bol_Sales bs;
        Sales sa;
        protected void Page_Load(object sender, EventArgs e)
        {
            bs = new Bol_Sales();
            sa = new Sales();
            GridView1.DataSource = bs.SelectAllSales();
            GridView1.DataBind();
        }
        
           
       
        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "")
            {
                Response.Write("Name null !!!");
            }
            else if (txtMaxage.Text == "")
            {
                Response.Write("Maxage null !!!");
            }
            else if (txtMinage.Text == "")
            {
                Response.Write("Minage null !!!");
            }
            else
            {
                if (bs.CheckSalesExistByName(txtName.Text) == 0)
                {
                    sa.Name = txtName.Text;
                    try
                    {
                        sa.Maxage = Convert.ToInt32(txtMaxage.Text);
                        sa.Minage = Convert.ToInt32(txtMinage.Text);
                        sa.Rate = Convert.ToInt32(txtrate.Text);
                        if (RadioButton1.Checked)
                        {
                            sa.Status = true;
                        }
                        else
                        {
                            sa.Status = false;
                        }
                        bs.InsertSales(sa);
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }
                else
                {
                    Response.Write("Ten ban nhap da ton tai !!!");
                    txtName.Focus();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bs = new Bol_Sales();
            sa = new Sales();
            if (txtSearch.Text == "")
            {
                Response.Write("Vui long nhap ten hoac id can cap nhat !!!");
                txtSearch.Focus();
            }
            else
            {
                if (DropDownList1.SelectedValue.ToString() == "ByID")
                {
                    if (bs.CheckSalesExistByID(Convert.ToInt32(txtSearch.Text)) == 0)
                    {
                        sa.Sa_ID = Convert.ToInt32(txtSearch.Text);
                        GridView1.DataSource = bs.SelectSalesByID(sa);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("ID nay khong ton tai !!!");
                    }
                }
                else if (DropDownList1.SelectedValue.ToString() == "ByName")
                {
                    if (bs.CheckSalesExistByName(txtSearch.Text) == 0)
                    {
                        sa.Name = txtSearch.Text;
                        GridView1.DataSource = bs.SelectSalesByName(sa);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("Name nay khong ton tai !!!");
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bs = new Bol_Sales();
            sa = new Sales();
            if (txtID.Text == "")
            {
                Response.Write("Vui long nhap id hay ten trong phan cap nhat !!!");
            }
            else
            {
                if (DropDownList4.SelectedValue.ToString() == "ByID")
                {
                    if (bs.CheckSalesExistByID(Convert.ToInt32(txtID.Text))== 0)
                    {
                        if (TextBox1.Text == "")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else if (TextBox2.Text =="")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else if (TextBox3.Text == "")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else if (TextBox4.Text == "")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else
                        {
                            sa.Sa_ID = Convert.ToInt32(txtID.Text);
                            sa.Name = txtName.Text;
                            sa.Maxage = Convert.ToInt32(txtMaxage.Text);
                            sa.Minage = Convert.ToInt32(txtMinage.Text);
                            sa.Rate = Convert.ToInt32(txtrate.Text);
                            if (RadioButton3.Checked)
                            {
                                sa.Status = true;
                            }
                            else
                            {
                                sa.Status = false;
                            }
                            try
                            {
                                GridView1.DataSource = bs.UpdateSalesByID(sa);
                                GridView1.DataBind();
                            }
                            catch (Exception ex)
                            {
                                Response.Write(ex.Message + "SAO LAI THE NHI !!!");
                            }
                        }
                    }
                }
                else if (DropDownList4.SelectedValue.ToString() == "ByName")
                {
                    if (bs.CheckSalesExistByName(txtID.Text) == 0)
                    {
                        if (TextBox1.Text == "")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else if (TextBox2.Text == "")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else if (TextBox3.Text == "")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else if (TextBox4.Text == "")
                        {
                            Response.Write("Ban nhap thieu thong tin !!!");
                            txtName.Focus();
                        }
                        else
                        {
                            sa.Name = txtName.Text;
                            sa.Maxage = Convert.ToInt32(txtMaxage.Text);
                            sa.Minage = Convert.ToInt32(txtMinage.Text);
                            sa.Rate = Convert.ToInt32(txtrate.Text);
                            if (RadioButton3.Checked)
                            {
                                sa.Status = true;
                            }
                            else
                            {
                                sa.Status = false;
                            }
                            try
                            {
                                GridView1.DataSource = bs.UpdateSalesByID(sa);
                                GridView1.DataBind();
                            }
                            catch (Exception ex)
                            {
                                Response.Write(ex.Message + "SAO LAI THE NHI !!!");
                            }
                        }
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bs = new Bol_Sales();
            sa = new Sales();
            if (txtDelete.Text == "")
            {
                Response.Write("Vui long nhap id hoac name can xoa !!!");
                txtDelete.Focus();
            }
            else
            {
                if (DropDownList3.SelectedValue.ToString() == "ByID")
                {
                    if (bs.CheckSalesExistByID(Convert.ToInt32(txtDelete.Text)) == 0)
                    {
                        sa.Sa_ID = Convert.ToInt32(txtDelete.Text);
                        GridView1.DataSource = bs.DeleteSalesByID(sa);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("ID ban nhap khong ton tai vui long nhap lai !!!");
                        txtDelete.Focus();
                    }
                }
                else if (DropDownList3.SelectedValue.ToString() == "ByName")
                {
                    if (bs.CheckSalesExistByName(txtDelete.Text) == 0)
                    {
                        sa.Name = txtDelete.Text;
                        GridView1.DataSource = bs.DeleteSalesByName(sa);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("Name ban nhap khong ton tai vui long nhap lai !!!");
                        txtDelete.Focus();
                    }
                }
            }
        }

    }
}
