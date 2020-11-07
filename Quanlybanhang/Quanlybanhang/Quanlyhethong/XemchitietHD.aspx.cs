using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class XemchitietHD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_ct_hoadon();
            }
        }

        private void load_ct_hoadon()
        {
            string mahd = Request.QueryString.Get("mahd");
            if(mahd != null)
            {
                DataTable tb = Model.model.getDataWhere(mahd, "get_cthoadon");
                var html = "";
                int stt = 1;
                foreach (DataRow row in tb.Rows)
                {
                    html += "<tr>";
                    html += "<td class='text-center'>" + stt++ + "</td>";
                    html += "<td>" + row["FK_MaHD"] + "</td>";
                    html += "<td>" + row["sTensp"] + "</td>";
                    html += "<td>" + row["iSoLuongM"] + "</td>";
                    html += "<td>" + row["fDonGiaM"] + "</td>";
                    html += "<td>" + row["fTongTienM"] + "</td>";
                    html += "</tr>";
                }
                tbody.InnerHtml = html;
            }
            
        }

        protected void btnInHoadon_Click(object sender, EventArgs e)
        {
            string mahd = Request.QueryString.Get("mahd");
            Response.Redirect("Inhoadon.aspx?mahd=" + mahd);
        }
    }
}