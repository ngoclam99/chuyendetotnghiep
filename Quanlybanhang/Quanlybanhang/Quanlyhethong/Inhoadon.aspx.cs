using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Inhoadon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString.Get("mahd") != null)
            {
                string mahd = Request.QueryString.Get("mahd");

                DataTable ctHD = Model.model.getDataWhere(mahd, "get_hoadon_where");
                foreach (DataRow row in ctHD.Rows)
                {
                    thoigianlap.InnerText = row["sThoiGian_Lap"].ToString();
                    NV.InnerText = row["FK_sNguoiLapHD"].ToString();
                    maHD.InnerText = row["sMaHD"].ToString();
                    KH.InnerText = row["FK_sMaKH"].ToString();
                    chinhanh.InnerText = row[""].ToString();
                }
                    DataTable tb = Model.model.getDataWhere(mahd, "get_cthoadon");
                var html = "";
                int stt = 1;
                float tongtien_m = 0;
                foreach (DataRow row in tb.Rows)
                {
                    html += "<tr>";
                    html += "<td class='text-center'>" + stt++ + "</td>";
                    html += "<td>" + row["sTensp"] + "</td>";
                    html += "<td class='text-center'>" + row["iSoLuongM"] + "</td>";
                    html += "<td class='text-center'>" + row["fDonGiaM"] + "</td>";
                    html += "<td class='text-center'>" + row["fTongTienM"] + "</td>";
                    html += "</tr>";
                    tongtien_m += float.Parse(row["fTongTienM"].ToString());
                }
                tbody.InnerHtml = html;
                tongtien.InnerText = tongtien_m.ToString();
            }
        }
    }
}