using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Themsanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Load_loadsp();
                dr_dulieu_ChiNhanh();
                dr_dulieu_nhacc();
            }
            DateTime Ngayhientai = DateTime.Now;
            DateTime date = Convert.ToDateTime(Ngayhientai);
            txtNgayDang.Value = String.Format("{0:dd-MM-yyyy}", date);
            if (Request.QueryString.Get("xoasp") != "")
            {
                string masp = Request.QueryString.Get("xoasp");
                if (masp != null)
                {
                    Response.Redirect("Quanlysanpham.aspx?xoasp=" + masp);
                }
            }
            if (Request.QueryString.Get("suasp") != "")
            {
                string masp = Request.QueryString.Get("suasp");
                if (masp != null)
                {
                    SqlDataReader reader = Model.model.getRow_Reader("get_sanpham_where", "@masp", masp);
                    if (reader.HasRows)
                    {
                        int tongtien = 0;
                        while (reader.Read())
                        {
                            tongtien = int.Parse(reader["fDonGia"].ToString()) * int.Parse(reader["iSoLuong"].ToString());
                            txtSanPham.Value = reader["sTensp"].ToString();
                            txtSoLuong.Value = reader["iSoLuong"].ToString();
                            txtDonGia.Value = reader["fDonGia"].ToString();
                            txtNgayDang.Value = reader["sNgayDangSp"].ToString();
                            txtMoTa.Value = reader["sMoTa"].ToString();
                            txtXuatSu.Value = reader["sXuatSu"].ToString();
                            txtTongTien.Value = tongtien.ToString();
                            drLoaiSP.SelectedValue = reader["FK_sMaLoaiSP"].ToString();
                            drNhacc.SelectedValue = reader["FK_sMaNhaCC"].ToString();
                            drChiNhanh.SelectedValue = reader["FK_iMaCN"].ToString();
                            txtMa.Text = reader["sMaSP"].ToString();
                        }
                        reader.Close();
                        DataTable hinhanh = Model.model.getDataWhere(masp,"get_hinhanh");
                        string html = "";
                        foreach(DataRow row in hinhanh.Rows)
                        {
                            html += "<img src='Thuvien/img/"+ row["sLinkAnh"] + "' class='avtata'/>";
                        }
                        btnThemSP.Text = "Cập nhật sản phẩm";
                        hienthi_anh.InnerHtml = html;
                    }
                }
            }
        }

        private void dr_dulieu_nhacc()
        {
            DataTable tb = Model.model.getData("get_nhacungcap");
            drNhacc.DataSource = tb;
            drNhacc.DataTextField = "sTenNhaCC";
            drNhacc.DataValueField = "sMaNhaCC";
            drNhacc.DataBind();
        }

        private void dr_dulieu_ChiNhanh()
        {
            try
            {
                DataTable tb = Model.model.getData("get_chi_nhanh");
                if (tb.Rows.Count > 0)
                {
                    drChiNhanh.DataSource = tb.DefaultView;
                    drChiNhanh.DataTextField = "sTenCN";
                    drChiNhanh.DataValueField = "iMaCN";
                    drChiNhanh.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }
        private void Load_loadsp()
        {
            DataTable tb = Model.model.getData("get_loaiSP");
            drLoaiSP.DataSource = tb;
            drLoaiSP.DataValueField = "sLoaiSP";
            drLoaiSP.DataTextField = "sTenLoaiSP";
            drLoaiSP.DataBind();

            dsLoaiSP.DataSource = tb;
            dsLoaiSP.DataBind();
        }

        protected void btnThemLoaiSP_Click(object sender, EventArgs e)
        {
           
            string tenloaisp = txtLoaiSP.Text;
            if (txtMa.Text != "")
            {
                string maloai = txtMa.Text;
                int i = Model.model.capnhat_loaisanpham(maloai, tenloaisp, "capnhat");
                if (i > 0)
                {
                    string text = "Cập nhật sản phẩm thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Themsanpham.aspx')", true);
                }
                else
                {
                    string text = "Cập nhật sản phẩm không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Themsanpham.aspx')", true);
                }
            }
            else
            {
                string maloai = Model.model.Create_Key("'LOAISP'", "sLoaiSP", "tbl_loaiSP");
                int i = Model.model.capnhat_loaisanpham(maloai, tenloaisp, "them");
                if (i > 0)
                {
                    string text = "Thêm sản phẩm thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Themsanpham.aspx')", true);
                }
                else
                {
                    string text = "Thêm sản phẩm không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Themsanpham.aspx')", true);
                }
            }

        }

        protected void dsLoaiSP_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int qt = Model.model.Xoa("delete_dmsp", "@maloai", e.CommandArgument.ToString());
                if (qt > 0)
                {
                    string text = "Xóa thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Themsanpham.aspx')", true);
                }
                else
                {
                    string text = "Xóa không thành thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Themsanpham.aspx')", true);
                }
            }
        }

        protected void btnThemSP_Click(object sender, EventArgs e)
        {
            string loaisp = drLoaiSP.SelectedValue;
            string tensp = txtSanPham.Value;
            int soluong = int.Parse(txtSoLuong.Value);
            string dongia = txtDonGia.Value;
            string nhacc = drNhacc.SelectedValue;
            DateTime Ngayhientai = DateTime.Now;
            DateTime date = Convert.ToDateTime(Ngayhientai);
            string ngaydang = String.Format("{0:dd-MM-yyyy HH:mm:ss}", date);
            string mota = txtMoTa.Value;
            string xuatsu = txtXuatSu.Value;
            string chinhanh = drChiNhanh.SelectedValue;
            string masp = Model.model.Create_Key("'SP'", "sMaSP", "tbl_sanpham");
            if(txtMa.Text != "")
            {
               masp = txtMa.Text;
               int i = Model.model.capnhat_sanpham(masp,
               tensp,
                 soluong,
                 dongia,
                 "Còn hàng",
                 loaisp,
                 nhacc,
                 Session["manv"].ToString(),
                 ngaydang,
                 mota,
                 xuatsu,
                 chinhanh,
                 "capnhat");
                if (AnhSP.HasFile)
                {
                    int fCount = Directory.EnumerateFiles(@"E:\TaiLieuHocTap\HOU\CongNgheThongTin\Programing\LTW_NC\ChuyenDe\Quanlybanhang\Quanlybanhang\Quanlyhethong\Thuvien\img\", "*").Count();
                    string tenanh = "";
                    foreach (HttpPostedFile uploadedFile in AnhSP.PostedFiles)
                    {
                        fCount++;
                        tenanh = "AnhSanPham" + fCount + ".jpg";
                        uploadedFile.SaveAs(Server.MapPath("~/Quanlyhethong/Thuvien/img/" + tenanh));
                        Model.model.insert_anhsanpham(tenanh, "", masp);
                    };

                }
                string re = "Themsanpham.aspx?suasp=" + masp;

                if (i > 0)
                {
                    string text = "Cập nhật sản phẩm thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', '"+re+"')", true);
                }
                else
                {
                    string text = "Cập nhật sản phẩm không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "','"+re+"')", true);
                }
            }
            else
            {
                int i = Model.model.capnhat_sanpham(masp,
                tensp,
                  soluong,
                  dongia,
                  "Còn hàng",
                  loaisp,
                  nhacc,
                  Session["manv"].ToString(),
                  ngaydang,
                  mota,
                  xuatsu,
                  chinhanh,
                  "them");
                if (AnhSP.HasFile)
                {
                    int fCount = Directory.EnumerateFiles(@"E:\TaiLieuHocTap\HOU\CongNgheThongTin\Programing\LTW_NC\ChuyenDe\Quanlybanhang\Quanlybanhang\Quanlyhethong\Thuvien\img\", "*").Count();
                    string tenanh = "";
                    foreach (HttpPostedFile uploadedFile in AnhSP.PostedFiles)
                    {
                        fCount++;
                        tenanh = "AnhSanPham" + fCount + ".jpg";
                        uploadedFile.SaveAs(Server.MapPath("~/Quanlyhethong/Thuvien/img/" + tenanh));
                        Model.model.insert_anhsanpham(tenanh, "", masp);
                    };

                }

                if (i > 0)
                {
                    string text = "Thêm sản phẩm thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Themsanpham.aspx')", true);
                }
                else
                {
                    string text = "Thêm sản phẩm không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Themsanpham.aspx')", true);

                }

            }
        }
    }
}