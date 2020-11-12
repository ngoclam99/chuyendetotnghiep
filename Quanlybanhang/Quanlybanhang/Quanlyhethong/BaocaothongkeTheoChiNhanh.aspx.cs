using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class BaocaothongkeTheoChiNhanh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["btnLoc"] == "loc")
            {
                DateTime Ngayhientai = DateTime.Now;
                DateTime date = Convert.ToDateTime(Ngayhientai);
                string ngaylap = Request.Form["ngaylap"];
                DataTable tb = Model.model.getDataWhere(ngaylap, "getTTChiNhanhTheoNgay");
                var html = "";
                int stt = 1;
                double tongtienHD = 0;
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                tbody.InnerHtml = "";
                foreach (DataRow row in tb.Rows)
                {
                    html += "<tr>";
                    html += "<td class='text-center'>" + stt++ + "</td>";
                    html += "<td>" + row["sTenCN"] + "</td>";
                    html += "<td>" + row["sDiaChiChiNhanh"] + "</td>";
                    string ttfm = "0";
                    if(int.Parse(row["tongsoSPHD"].ToString()) == 0)
                    {
                        html += "<td> 0 VNĐ</td>";
                        row["tongtienHD"] = 0;
                    }
                    else
                    {
                        ttfm = double.Parse(row["tongtienHD"].ToString()).ToString("#,###", cul.NumberFormat);
                        html += "<td> "+ ttfm + " VNĐ</td>";
                    }

                    tongtienHD += double.Parse(row["tongtienHD"].ToString());

                    html += "</tr>";
                }
                thoigian.InnerText = "Ngày thống kê: "+ ngaylap;
                tbody.InnerHtml = html;
                ngaychon.InnerText = ngaylap;
                tongtien.InnerText = tongtienHD.ToString("#,###", cul.NumberFormat) + " VNĐ";
            }

            //DataTable tb = Model.model.getDataWhere(ngaylap,"getTtChiNhanh");

        }
    }
}