using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Quanlynhaphang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_chinhanh();
                load_nhacungcap();
                load_sanpham();
            }
          
            if(Request.Form["btnCapNhat"] == "capnhat")
            {
                string ngaynhap = Request.Form["ngaynhap"];
                string nhacc = drNhaCungCap.SelectedValue;
                string chinhanh = drChiNhanh.SelectedValue;
                string[] txtSanpham = Request.Form["txtSanpham"].Split(',');
                string[] txtSoluong = Request.Form["txtSoluong"].Split(',');
                string[] txtDongianhap = Request.Form["txtDongianhap"].Split(',');
                string[] txtDongiaban = Request.Form["txtDongiaban"].Split(',');
                string[] txtTongTien = Request.Form["txtTongTien"].Split(',');
                string mapn = Model.model.Create_Key("'PN'", "sMaPN", "tbl_phieunhap");
                int r = Model.model.insert_phieunhap(mapn, Session["manv"].ToString(), chinhanh, nhacc);
                string mapn_old = mapn;

                int re = 0;
                int up = 0;
                for (int i = 0; i < txtSanpham.Length; i++)
                {
                    int soluong = int.Parse(txtSoluong[i].ToString());
                    float dongia_nhap = float.Parse(txtDongianhap[i].Replace(".", ""));
                    float dongia_ban = float.Parse(txtDongiaban[i].Replace(".", ""));
                    float tongtien = float.Parse(txtTongTien[i].Replace(".", ""));
                    re += Model.model.insert_ctphieunhap(
                        txtSanpham[i].ToString(),
                        mapn_old,
                        soluong,
                        dongia_nhap,
                        tongtien);

                    up += Model.model.update_giasp(txtSanpham[i].ToString(), dongia_ban.ToString(), soluong);

                }
                if (re == up)
                {
                    string text = "Thêm phiếu nhập thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlynhaphang.aspx')", true);
                }
                else
                {
                    string text = "Thêm phiếu nhập không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlynhaphang.aspx')", true);

                }

            }
        }

        private void load_sanpham()
        {
            DataTable tb = Model.model.getData("get_sanpham");
            string html = "";
            html += "<select class='form-control' name='txtSanpham'>";
            foreach (DataRow row in tb.Rows)
            {
                html += "<option value='" + row["sMaSP"] + "'>" + row["sTensp"] +"</option>";
            }
            html += "</select>";
            div.InnerHtml = html;
        }

        private void load_nhacungcap()
        {
            DataTable tb = Model.model.getData("get_chi_nhanh");
            drChiNhanh.DataSource = tb;
            drChiNhanh.DataTextField = "sTenCN";
            drChiNhanh.DataValueField = "iMaCN";
            drChiNhanh.DataBind();
          
        }

        private void load_chinhanh()
        {
            DataTable tb = Model.model.getData("get_nhacungcap");
            drNhaCungCap.DataSource = tb;
            drNhaCungCap.DataTextField = "sTenNhaCC";
            drNhaCungCap.DataValueField = "sMaNhaCC";
            drNhaCungCap.DataBind();
        }
    }
}