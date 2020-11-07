using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Themnhanvien : System.Web.UI.Page
    {
        public string chinhanh = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dr_dulieu_ChiNhanh();

            }

            string pg = "Test";




        }


        private void dr_dulieu_ChiNhanh()
        {
            try
            {
                DataTable tb = Model.model.getData("get_chi_nhanh");
                if (tb.Rows.Count > 0)
                {
                    drChiNhanh.DataSource = tb.DefaultView;
                    drChiNhanh.DataTextField = "sTenCN";
                    drChiNhanh.DataValueField = "iMaCN";
                    drChiNhanh.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }

        protected void themNhanVien_Click(object sender, EventArgs e)
        {


            string manv, hotennv, ngaysinh, gioitinh, diachi, sdt, chinhanh;
            gioitinh = null;
            hotennv = txtTenNV.Text;
            ngaysinh = txtNgaySinh.Text;
            DateTime custom_ngaysinh = Convert.ToDateTime(ngaysinh);
            ngaysinh = String.Format("{0:dd-MM-yyyy}", custom_ngaysinh);
            if (rbNam.Checked == true)
            {
                gioitinh = "Nam";
            }

            if (rbNu.Checked == true)
            {
                gioitinh = "Nữ";
            }

            diachi = txtDiachi.Text;
            sdt = txtSDT.Text;
            chinhanh = drChiNhanh.SelectedValue.ToString();

            manv = Model.model.Create_Key("'NV'", "sMaNV", "tbl_nhanvien");
            int i = Model.model.capnhat_NhanVien(manv, hotennv, ngaysinh, gioitinh, diachi, sdt, chinhanh, "them");

            if (i > 0)
            {
                string text = "Thêm nhân viên thành công!";
                string redirect = "Themnhanvien.aspx";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Themnhanvien.aspx')", true);
            }
            else
            {
                string text = "Thêm nhân viên không thành công!";
                string redirect = "Themnhanvien.aspx";
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Themnhanvien.aspx')", true);

            }

        }

        protected void drChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}