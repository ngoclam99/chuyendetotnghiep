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
    public partial class BaocaothongkeHoaDon : System.Web.UI.Page
    {
        string tencn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
             string tencn = null;
            if (!Page.IsPostBack)
            {
                //load_chinhanh();
            }
            DateTime Ngayhientai = DateTime.Now;
            DateTime date = Convert.ToDateTime(Ngayhientai);
            if(Request.Form["btnLoc"] == "loc")
            {
                if (Request.Form["ngaylap"] == "")
                {
                    Response.Write("<script languague='javascript'> alert('Ngày lập không được để trống?');location.href = 'BaocaothongkeHoaDon.aspx'</script>");
                }
                else
                {
                    string ngaylap = Request.Form["ngaylap"];
                    DataTable tb = Model.model.getHoaDonTheoNgay(ngaylap);
                    var html = "";
                    int stt = 1;
                    string diachi = null;
                    double tongtienHD = 0;

                    CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                    tbody.InnerHtml = "";
                    foreach (DataRow row in tb.Rows)
                    {
                        diachi = row["sDiaChiChiNhanh"].ToString();
                        html += "<tr>";
                        html += "<td class='text-center'>" + stt++ + "</td>";
                        html += "<td>" + row["sTenCN"] + "</td>";
                        html += "<td>" + row["sDiaChiChiNhanh"] + "</td>";
                        html += "<td>" + row["tongsoHD"] + "</td>";
                        //html += "<td>" + double.Parse(row["tongtienHD"].ToString()).ToString("#,###", cul.NumberFormat) + " VNĐ</td>";
                        //tongtienHD += double.Parse(row["tongtienHD"].ToString());
                        html += "</tr>";
                        tencn = row["FK_iMaCN"].ToString();
                    }

                    Tenchinhanh.Value = tencn;
                    if(diachi != null)
                    {
                        diachiCN.InnerText = "Địa chỉ: " + diachi;
                    }
                    else
                    {
                        diachiCN.InnerText = "Không có dữ liệu ";
                    }
                    ngaychon.InnerText = ngaylap;
                    //tongtien.InnerText = tongtienHD.ToString("#,###", cul.NumberFormat) + " VNĐ";
                    tbody.InnerHtml = html;
                }
            }
        }

        public string FormatTo2Dp(decimal myNumber)
        {
            // Use schoolboy rounding, not bankers.
            myNumber = Math.Round(myNumber, 2, MidpointRounding.AwayFromZero);

            return string.Format("{0:0.00}", myNumber);
        }

        private void load_chinhanh()
        {
            DataTable tb = Model.model.getData("get_chi_nhanh");
            string html = "";
            html += "<select class='form-control cchinhanh' name='chinhanh'>";
            html += "<option value='' disabled selected>--Chọn chi nhánh</option>";
            foreach (DataRow row in tb.Rows)
            {
                html += "<option value='" + row["iMaCN"] + "'>" + row["sTenCN"] + "</option>";
            }
            html += "</select>";
            //div.InnerHtml = html;
        }
    }
}