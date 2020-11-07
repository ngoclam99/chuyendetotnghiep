using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Suaphieunhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Form["remove"] != null)
            {
                Xoa_CTSP();
               
            }
            if (Request.QueryString.Get("mapn") != "")
            {
                hienthisp();
            }
            if(Request.Form["btnCapNhat"] == "capnhat")
            {
                capnhat();
            }
            if (!Page.IsPostBack)
            {
                load_sanpham();
            }
        }

        private void load_sanpham()
        {
            DataTable tb = Model.model.getData("get_sanpham");
            string html = "";
            html += "<select class='form-control txtSP' name='sanpham'>";
            foreach (DataRow row in tb.Rows)
            {
                html += "<option value='" + row["sMaSP"] + "'>" + row["sTensp"] + "</option>";
            }
            html += "</select>";
            div.InnerHtml = html;
        }

        private void hienthisp()
        {
            string mapn = Request.QueryString.Get("mapn");
            if (mapn != null)
            {
                DataTable tb = Model.model.getDataWhere(mapn, "get_ctphieunhap");
                string html = "";
                foreach (DataRow row in tb.Rows)
                {
                    html += "<tr id ='tr'>";
                    html += "<th><select class='form-control' name='sanpham' readonly><option value='" + row["sMaSP"] +"'>" + row["sTensp"] + "<option></select></th>";
                    html += "<th ><p><input type = 'text' class='form-control'  value='" + row["iSoLuongN"] + "' name='txtSoluong' required /></p></th>";
                    html += "<th ><p><input type = 'text' class='form-control'  value='" + row["fDonGiaN"] + "' name='txtDongianhap' required /></p></th>";
                    html += "<th ><p><input type = 'text' class='form-control'  value='" + row["fDonGia"] + "' name='txtDongiaban' required /></p></th>";
                    html += "<th ><p><input type = 'text' class='form-control'  value='" + row["fTongTien"] + "' name='txtTongTien' required /></p></th>";
                    html += "<th class='text-center'><p><button type = 'submit' name='remove' value='" + row["FK_MaSP"] + "_" + row["FK_MaPN"] + "' class='btn btn-danger btn-sm' onclick='return confirm(\"Bạn có chắc chắn muốn xóa sản phẩm này không?\")'><i class='fa fa-minus-square' aria-hidden='true'></i></button></p></th>";
                    html += "</tr>";
                }
                tbody.InnerHtml = html;
                txtMaPN.Text = mapn;
            }
        }

        private void Xoa_CTSP()
        {
            Response.Write(1);
            string[] ma = Request.Form["remove"].Split('_');
            int qt = Model.model.Xoa_CTPN(ma[0], ma[1]);
            string redirect = "Suaphieunhap.aspx?mapn=" + Request.QueryString.Get("mapn");
            if (qt > 0)
            {
                string text = "Xóa sản phẩm thành công!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', '" + redirect + "')", true);
            }
            else
            {
                string text = "Xóa sản phẩm không thành thành công!";
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', '" + redirect + "')", true);
            }
        }

        private void capnhat()
        {
            string redirect = "Suaphieunhap.aspx?mapn=" + Request.QueryString.Get("mapn");
            if (int.Parse(Request.Form["tongso"].ToString()) > 1)
            {
                string[] txtSanpham = Request.Form["sanpham"].Split(',');
                string[] txtSoluong = Request.Form["txtSoluong"].Split(',');
                string[] txtDongianhap = Request.Form["txtDongianhap"].Split(',');
                string[] txtDongiaban = Request.Form["txtDongiaban"].Split(',');
                string[] txtTongTien = Request.Form["txtTongTien"].Split(',');
                if (txtMaPN.Text != null)
                {
                    int re = 0;
                    int up = 0;
                    int r = Model.model.Xoa("delete_chitiepn", "@mapn", txtMaPN.Text);
                    for (int i = 0; i < txtSanpham.Length; i++)
                    {

                        int soluong = int.Parse(txtSoluong[i].ToString());
                        float dongia_nhap = float.Parse(txtDongianhap[i]);
                        float dongia_ban = float.Parse(txtDongiaban[i]);
                        float tongtien = float.Parse(txtTongTien[i]);
                        Model.model.insert_ctphieunhap(
                            txtSanpham[i].ToString(),
                            txtMaPN.Text,
                            soluong,
                            dongia_nhap,
                            tongtien);
                        Model.model.update_giasp(txtSanpham[i].ToString(), txtDongiaban[i].ToString(), soluong);
                    }
                    Response.Redirect(redirect);
                    //string text = "Cập nhật phiếu nhập thành công!";
                    //ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_success('" + text + "', '" + redirect + "'')", true);
                    //if (re == up)
                    //{
                    //    string text = "Cập nhật phiếu nhập thành công!";
                    //    Response.Redirect("<script>alert('" + text + "'); location.href='" + redirect + "'<script>");
                    //}
                    //else
                    //{
                    //    string text = "Cập nhật nhập không thành công!";
                    //    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', '" + redirect + "'')", true);
                    //}
                }
            }
            else
            {
                    string txtSanpham = Request.Form["sanpham"];
                    string txtSoluong = Request.Form["txtSoluong"];
                    string txtDongianhap = Request.Form["txtDongianhap"];
                    string txtDongiaban = Request.Form["txtDongiaban"];
                    string txtTongTien = Request.Form["txtTongTien"];
                    int kq = Model.model.check_key_and("ct_phieunhap", "@masp", txtSanpham.ToString(), "@mapn", txtMaPN.Text);
                    if (kq != 1)
                    {
                        string text = "Sản phẩm này đã tồn tại trong phiếu nhập";
                        ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', '" + redirect + "'')", true);
                    }
                    int r = Model.model.Xoa("delete_chitiepn", "@mapn", txtMaPN.Text);
                    int i = Model.model.insert_ctphieunhap(
                               txtSanpham.ToString(),
                               txtMaPN.Text,
                               int.Parse(txtSoluong.ToString()),
                               float.Parse(txtDongianhap.ToString()),
                               float.Parse(txtTongTien.ToString()));
                    i = Model.model.update_giasp(txtSanpham[i].ToString(), txtDongiaban.ToString(), int.Parse(txtSoluong.ToString()));
                    if (i > 0)
                    {
                        string text = "Cập nhật phiếu nhập thành công!";
                        Response.Redirect("<script>alert('" + text + "'); location.href='" + redirect + "'<script>");
                    }
                    else
                    {
                        string text = "Cập nhật nhập không thành công!";
                        ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', '" + redirect + "'')", true);
                    }
                }
        }
    }
}