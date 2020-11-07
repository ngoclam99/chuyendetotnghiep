using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Danhsachphieunhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_dspn();
            }
            if(Request.QueryString.Get("xoapn") != null)
            {
                string pn = Request.QueryString.Get("xoapn");
                int qt = Model.model.Xoa("delete_phieunhap", "@mapn", pn);
                if (qt > 0)
                {
                    string text = "Xóa phiếu nhập thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Danhsachphieunhap.aspx')", true);
                }
                else
                {
                    string text = "Xóa phiếu nhập không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Danhsachphieunhap.aspx')", true);
                }
            }
        }

        private void load_dspn()
        {
            DataTable tb = Model.model.getData("get_phieunhap");
            string html = "";
            int stt = 1;
         
            foreach (DataRow row in tb.Rows)
            {
                DateTime date = Convert.ToDateTime(row["sThoiGian_Nhap"]);
                string ngaynhap= String.Format("{0:dd-MM-yyyy}", date);
                html += "<tr>";
                html += "<td class='text-center'>"+ stt++ +"</td>";
                html += "<td>"+ row["sMaPN"] +"</td>";
                html += "<td>"+ ngaynhap + "</td>";
                html += "<td>"+ row["sTenNV"] +"</td>";
                html += "<td>"+ row["sTenCN"] +"</td>";
                html += "<td>"+ row["sTenNhaCC"] +"</td>";
                html += "<td class='text-center'> <a href='Suaphieunhap.aspx?mapn="+row["sMaPN"] + "' class='btn btn-primary'>Xem chi tiết</a> <a href='Danhsachphieunhap.aspx?xoapn=" + row["sMaPN"] + "' class='btn btn-danger' onclick='return confirm(\"Bạn có chắc chắn muốn xóa phiếu nhập này không?\")'>Xóa phiếu nhập</a>";
                html += "</tr>";
            }
            tbody.InnerHtml = html;
        }

    }
}