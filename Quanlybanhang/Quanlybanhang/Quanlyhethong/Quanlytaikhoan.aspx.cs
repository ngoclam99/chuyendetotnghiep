using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Quanlytaikhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_nhanvien();
                Load_quyen();
            }
            load_dsnv();
        }

        private void load_dsnv()
        {
            DataTable tb = Model.model.getData("get_dstk");
            grDSTK.DataSource = tb;
            grDSTK.DataBind();
        }

        private void Load_quyen()
        {
            DataTable tb = Model.model.getData("get_dsquyen");
            drDSQuyen.DataSource = tb.DefaultView;
            drDSQuyen.DataTextField = "sTenQuyen";
            drDSQuyen.DataValueField = "iMaQuyen";
            drDSQuyen.DataBind();
        }

        private void load_nhanvien()
        {
            DataTable tb = Model.model.getData("get_dsnv");
            dsNV.DataSource = tb.DefaultView;
            dsNV.DataTextField = "sTenNV";
            dsNV.DataValueField = "sMaNV";
            dsNV.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string matk, manv, maquyen, taikhoan, matkhau;
            manv = dsNV.SelectedValue;
            maquyen = drDSQuyen.SelectedValue;
            taikhoan = txTaiKhoan.Text;
            matkhau = txtMatKhau.Text;

            matk = Model.model.Create_Key("'TK'", "sMaTK", "tbl_taikhoan");

            if (txtMaTK.Text != "")
            {
                matk = txtMaTK.Text;
                taikhoan = txtTenTK.Text;
                int i = Model.model.capnhat_taikhoan(matk, manv, maquyen, taikhoan, matkhau, "capnhat");

                if (i > 0)
                {
                    string text = "Cập nhật tài khoản thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlytaikhoan.aspx')", true);
                }
                else
                {
                    string text = "Cập nhật tài khoản không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlytaikhoan.aspx')", true);

                }
            }
            else
            {
                int i = Model.model.capnhat_taikhoan(matk, manv, maquyen, taikhoan, matkhau, "them");

                if (i > 0)
                {
                    string text = "Thêm tài khoản thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlytaikhoan.aspx')", true);
                }
                else
                {
                    string text = "Thêm tài khoản không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlytaikhoan.aspx')", true);

                }
            }



        }

        protected void grDSTK_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName == "xoa")
            {
                int qt = Model.model.Xoa("delete_taikhoan", "@matk", e.CommandArgument.ToString());
                if (qt > 0)
                {
                    string text = "Xóa tài khoản thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlytaikhoan.aspx')", true);
                }
                else
                {
                    string text = "Xóa tài khoản thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlytaikhoan.aspx')", true);
                }
            }
        }


    }
}
