using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Quanlyhoadon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_khachhang();
                load_sanpham();
            }
            if (Request.QueryString["masp"] != null)
            {
                string masp = Request.QueryString["masp"];
                getSanPham(masp);
            }
            if (Request.Form["btnLapHoaDon"] == "laphoadon")
            {
                laphoadon();
            }
        }

        private void laphoadon()
        {
            string[] txtSanpham = Request.Form["txtSanpham"].Split(',');
            string[] txtSoluong = Request.Form["txtSoluong"].Split(',');
            string[] txtDongia = Request.Form["txtDongia"].Split(',');
            string[] txtTongTien = Request.Form["txtTongTien"].Split(',');
            string khachhang = Request.Form["khachhang"];
            if(khachhang == null)
            {
                khachhang = null;
            }
            DateTime Ngayhientai = DateTime.Now;
            DateTime date = Convert.ToDateTime(Ngayhientai);
            string thoigianlap = date.ToString();
            string nguoilapHD = Session["manv"].ToString();
            int chinhanh = int.Parse(Session["macn"].ToString());
            string maHD = Model.model.Create_Key("'HD'", "sMaHD", "tbl_hoadon");
            int re_hd = Model.model.insert_hoadon(maHD, thoigianlap, khachhang, nguoilapHD, chinhanh);
            int re_ct = 0;
            for (int i = 0; i < txtSanpham.Length; i++)
            {
                int soluong = int.Parse(txtSoluong[i].ToString());
                float dongia = float.Parse(txtDongia[i].ToString());
                float tongtien = float.Parse(txtTongTien[i].ToString());
                re_ct += Model.model.insert_cthoadon(maHD, txtSanpham[i].ToString(), soluong, dongia, tongtien);
                Model.model.capnhat_soluongsp(txtSanpham[i].ToString(), soluong);
            }
            if (re_ct > 0)
            {
                Response.Redirect("Inhoadon.aspx?mahd=" + maHD);
            }
            else
            {
                string text = "Lập hóa đơn không thành công!";
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlyhoadon.aspx')", true);

            }
        } 
        private void getSanPham(string masp)
        {
            DataTable tb = Model.model.getDataWhere(masp, "get_tt_sanpham");
            string soluong = null;
            string dongia = null;
            foreach (DataRow row in tb.Rows)
            {
                 soluong = row["iSoLuong"].ToString();
                 dongia  = row["fDonGia"].ToString();
            }
            Response.Clear();
            Response.Write(soluong+"_"+ dongia);
            Response.End();
        }

        public string DataTableToJsonWithStringBuilder(DataTable table)
        {
            var jsonString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                //jsonString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    jsonString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            jsonString.Append("\"" + table.Columns[j].ColumnName.ToString()
                                              + "\":" + "\""
                                              + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            jsonString.Append("\"" + table.Columns[j].ColumnName.ToString()
                                              + "\":" + "\""
                                              + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        jsonString.Append("}");
                    }
                    else
                    {
                        jsonString.Append("},");
                    }
                }
                //jsonString.Append("]");
            }
            return jsonString.ToString();
        }

        private void load_khachhang()
        {
            DataTable tb = Model.model.getData("get_khachhang");
            string html = "";
            html += "<select class='form-control' name='khachhang' requied>";
            html += "<option value=''>--Chọn khách hàng</option>";
            foreach (DataRow row in tb.Rows)
            {
                html += "<option value='" + row["sMaKH"] + "'>" + row["sTenKH"] + "</option>";
            }
            html += "</select>";
            div.InnerHtml = html;
        }
        private void load_sanpham()
        {
            DataTable tb = Model.model.getData("get_sanpham");
            string html = "";
            html += "<select class='form-control sanpham' requied name='txtSanpham' onchange='changeSanPham(this)'>";
            html += "<option value=''>--Chọn sản phẩm</option>";
            foreach (DataRow row in tb.Rows)
            {
                html += "<option value='" + row["sMaSP"] + "'>" + row["sTensp"] + "</option>";
            }
            html += "</select>";
            sp.InnerHtml = html;
        }

    }
}