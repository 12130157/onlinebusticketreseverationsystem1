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

            DropDownList4.DataSource = ci.SelectAllCity();
            DropDownList4.DataTextField = "Name";
            DropDownList4.DataValueField = "Ci_id";
            DropDownList4.DataBind();

         }
        private void loadlist()
        {          
        
        }     
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Response.Write("Vui long nhap ten !!!");
                TextBox1.Focus();
            }
            else
            {
                bpp = new Bol_Packing_Place();
                Packing_Place pp = new Packing_Place();
                if (bpp.CheckParking_PlaceExistByName(TextBox1.Text) == 0)
                {
                    pp.Name = TextBox1.Text;
                    pp.Ci_ID = Convert.ToInt32(DropDownList1.SelectedValue);
                    Label1.Text = Convert.ToString(pp.Ci_ID);
                    if (RadioButton3.Checked)
                    {
                        pp.Status = true;
                        GridView1.DataSource = bpp.InsertPacking_Place(pp);
                        GridView1.DataBind();
                    }
                    else
                    {
                        pp.Status = false;
                        GridView1.DataSource = bpp.InsertPacking_Place(pp);
                        GridView1.DataBind();
                    }
                }
                else
                {
                    Response.Write("Ten ban nhap da ton tai vui long nhap ten khac !!!");
                }
            }
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
            if (txtSearch.Text == "")
            {
                Response.Write("Vui long nhap ten hay id can tim !!!");
                txtSearch.Focus();
            }
            else
            {
                if (DropDownList2.SelectedValue.ToString() == "ByID")
                {
                    if (bpp.CheckParking_PlaceExistByID(Convert.ToInt32(txtSearch.Text)) == 0)
                    {
                        pl.PP_ID = Convert.ToInt32(txtSearch.Text);
                        GridView1.DataSource = bpp.SelectPacking_PlaceByID(pl);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("ID ban nhap khong ton tai vui long nhap id khac !!!");
                        txtSearch.Focus();
                    }
                }
                else if (DropDownList2.SelectedValue.ToString() == "ByName")
                {
                    if (bpp.CheckParking_PlaceExistByName(txtSearch.Text) == 0)
                    {
                        pl.Name = txtSearch.Text;
                        GridView1.DataSource = bpp.SelectPacking_PlaceByName(pl);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("Name ban nhap khong ton tai vui long nhap id khac !!!");
                        txtSearch.Focus();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bpp = new Bol_Packing_Place();
            pl = new Packing_Place();
            if (txtSearch.Text == "")
            {
                Response.Write("Vui long nhap ten hay id can tim !!!");
                txtSearch.Focus();
            }
            else
            {
                if (DropDownList4.SelectedValue.ToString() == "ByID")
                {
                    if (bpp.CheckParking_PlaceExistByID(Convert.ToInt32(txtID.Text)) == 0)
                    {
                        if (txtName.Text == "")
                        {
                            Response.Write("Vui long nhap thong tin cap nhat !!!");
                        }
                        else
                        {
                            pl.Ci_ID = Convert.ToInt32(txtID.Text);
                            pl.Name = txtName.Text;
                            if (RadioButton1.Checked)
                            {
                                pl.Status = true;
                            }
                            else
                            {
                                pl.Status = false;
                            }
                            try
                            {
                                GridView1.DataSource = bpp.UpdatePacking_PlaceByID(pl);
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
                        Response.Write("ID ban nhap khong ton tai !!!");
                        txtID.Focus();
                    }
                }
                else if (DropDownList4.SelectedValue.ToString() == "ByName")
                {
                    if (bpp.CheckParking_PlaceExistByName(txtID.Text) == 0)
                    {
                        if (txtName.Text == "")
                        {
                            Response.Write("Vui long nhap thong tin cap nhat !!!");
                        }
                        else
                        {
                            pl.Name = txtName.Text;
                            try
                            {
                                GridView1.DataSource = bpp.UpdatePacking_PlaceByName(pl);
                                GridView1.DataBind();
                            }
                            catch (Exception ex)
                            {
                                Response.Write(ex.Message + "CHAN CHUA KIA !!!");
                            }
                        }
                    }
                    else
                    {
                        Response.Write("Ten ban nhap khong ton tai !!!");
                        txtID.Focus();
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bpp = new Bol_Packing_Place();
            pl = new Packing_Place();
            if (txtDelete.Text == "")
            {
                Response.Write("Vui long nhap ten can delete !!!");
                txtDelete.Focus();
            }
            else
            {
                if (DropDownList3.SelectedValue.ToString() == "ByID")
                {
                    if (bpp.CheckParking_PlaceExistByID(Convert.ToInt32(txtDelete.Text)) == 0)
                    {
                        pl.Ci_ID = Convert.ToInt32(txtDelete.Text);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("ID ban nhap khong ton tai !!!");
                        txtDelete.Focus();                        
                    }
                }
                else if (DropDownList3.SelectedValue.ToString() == "ByName")
                {
                    if (bpp.CheckParking_PlaceExistByName(txtDelete.Text) == 0)
                    {
                        pl.Name = txtDelete.Text;
                        GridView1.DataSource = bpp.DeletePacking_PlaceByName(pl);
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("Ten ban nhap khong ton tai !!!");
                        txtDelete.Focus();
                    }
                }
            }
        }


    }
}
