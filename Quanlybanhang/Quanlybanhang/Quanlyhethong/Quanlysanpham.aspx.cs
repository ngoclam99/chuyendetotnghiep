using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Quanlysanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_sanpham();
            }
            if (Request.QueryString.Get("xoasp") != "")
            {
                string masp = Request.QueryString.Get("xoasp");
                if (masp != null)
                {
                    Model.model.Xoa("delete_hinhanh", "@masp", masp);
                    int qt = Model.model.Xoa("delete_sanpham", "@masp", masp);
                    if (qt > 0)
                    {
                        string text = "Xóa sản phẩm thành công!";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlysanpham.aspx')", true);
                    }
                    else
                    {
                        string text = "Xóa sản phẩm không thành công!";
                        ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlysanpham.aspx')", true);
                    }
                }

            }
        }

        private void load_sanpham()
        {
            DataTable tb = Model.model.getData("get_sanpham");
            string html = "";
            int stt = 1;
            int tongtien = 0;
            foreach (DataRow row in tb.Rows)
            {
                
                html += "<tr>";
                html += "<td class='text-center'>" + stt++ + "</td>";
                html += "<td>" + row["sTensp"] + "</td>";
                html += "<td>" + row["iSoLuong"] + "</td>";
                html += "<td>" + row["fDonGia"] + "</td>";
                html += "<td>" + row["sTrangThai"] + "</td>";
                html += "<td>" + row["sTenLoaiSP"] + "</td>";
                html += "<td>" + row["sTenNhaCC"] + "</td>";
                html += "<td>" + row["sTenNV"] + "</td>";
                html += "<td>" + row["sNgayDangSp"] + "</td>";
                html += "<td><a href='Themsanpham.aspx?suasp=" + row["sMaSP"] + "' class='btn btn-primary'>Sửa sản phẩm</a></td>";
                html += "<td><a href='Themsanpham.aspx?xoasp=" + row["sMaSP"] + "' class='btn btn-danger' onclick='return confirm(\"Bạn có chắc chắn muốn xóa sản phẩm này không?\")'>Xóa sản phẩm</a></td>";
                html += "</tr>";
            }
            tbody.InnerHtml = html;
            //dsSP.DataSource = tb;
            //dsSP.DataBind();
        }
    }
}