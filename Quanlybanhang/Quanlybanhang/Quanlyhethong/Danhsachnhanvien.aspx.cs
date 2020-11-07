using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Danhsachnhanvien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gr_dulieu_dsnv();
            dr_dulieu_ChiNhanh();
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

        private void gr_dulieu_dsnv()
        {
            try
            {
                DataTable tb = Model.model.getData("get_nhanvien");
                grDSNV.DataSource = tb;
                grDSNV.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }

        protected void grDSNV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int qt = Model.model.Xoa("delete_nhanvien", "@manv", e.CommandArgument.ToString());
                if (qt > 0)
                {
                    string text = "Xóa nhân viên thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Danhsachnhanvien.aspx')", true);
                }
                else
                {
                    string text = "Xóa nhân viên không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Danhsachnhanvien.aspx')", true);
                }
            }
        }
        protected void capnhatNV_Click(object sender, EventArgs e)
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
            manv = txtMa.Text;
            int i = Model.model.capnhat_NhanVien(manv, hotennv, ngaysinh, gioitinh, diachi, sdt, chinhanh, "capnhat");

            if (i > 0)
            {
                string text = "Cập nhật nhân viên thành công!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Danhsachnhanvien.aspx')", true);
            }
            else
            {
                string text = "Cập nhật viên không thành công!";
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Danhsachnhanvien.aspx')", true);

            }
        }

    }
}