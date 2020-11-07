using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Danhsachhoadon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_hoadon();
            }
            if(Request.QueryString.Get("xoahd") != null)
            {
                string mahd = Request.QueryString.Get("xoahd");
                int qt = Model.model.Xoa("delete_hoadon", "@mahd", mahd);
                if (qt > 0)
                {
                    string text = "Xóa hóa đơn thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Danhsachhoadon.aspx')", true);
                }
                else
                {
                    string text = "Xóa hóa đơn không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Danhsachhoadon.aspx')", true);
                }
            }
        }

        private void load_hoadon()
        {
            DataTable tb = Model.model.getData("get_hoadon");
            var html = "";
            int stt = 1;
            foreach (DataRow row in tb.Rows)
            {
                html += "<tr>";
                html += "<td class='text-center'>" + stt++ + "</td>";
                html += "<td>" + row["sMaHD"] + "</td>";
                html += "<td>" + row["sThoiGian_Lap"] + "</td>";
                html += "<td>" + row["sTenKH"] + "</td>";
                html += "<td>" + row["sTenNV"] + "</td>";
                html += "<td>" + row["sTenCN"] + "</td>";
                html += "<td class='text-center'> <a href='XemchitietHD.aspx?mahd=" + row["sMaHD"] + "' class='btn btn-primary'>Xem chi tiết</a> <a href='Inhoadon.aspx?mahd=" + row["sMaHD"] + "' class='btn btn-success'>In hóa đơn</a> <a href='Danhsachhoadon.aspx?xoahd=" + row["sMaHD"] + "' class='btn btn-danger' onclick='return confirm(\"Bạn có chắc chắn muốn xóa phiếu nhập này không?\")'>Xóa phiếu nhập</a>";
                html += "</tr>";
            }
            tbody.InnerHtml = html;
        }
    }
}