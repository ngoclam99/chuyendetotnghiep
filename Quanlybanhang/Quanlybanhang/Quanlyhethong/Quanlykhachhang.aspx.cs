using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Quanlykhachhang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_khachhang();
        }

        private void load_khachhang()
        {
            DataTable tb = Model.model.getData("get_Khachhang");
            gvDSKH.DataSource = tb;
            gvDSKH.DataBind();
        }

        protected void capnhatNV_Click(object sender, EventArgs e)
        {
            string makh, hotenkh, sdt, gioitinh;
            gioitinh = null;
            if (rbNam.Checked == true)
            {
                gioitinh = "Nam";
            }

            if (rbNu.Checked == true)
            {
                gioitinh = "Nữ";
            }

            sdt = txtSDT.Text;
            hotenkh = txtKhachhang.Text;
            makh = Model.model.Create_Key("'KH'", "sMaKH", "tbl_khachhang");

            if (txtMa.Text != "")
            {
                makh = txtMa.Text;
                int i = Model.model.capnhat_khachhang(makh, hotenkh, sdt, gioitinh, "capnhat");

                if (i > 0)
                {
                    string text = "Cập nhật khách hàng thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlykhachhang.aspx')", true);
                }
                else
                {
                    string text = "Cập nhật khách hàng không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlykhachhang.aspx')", true);

                }
            }
            else
            {
                int i = Model.model.capnhat_khachhang(makh, hotenkh, sdt, gioitinh, "them");

                if (i > 0)
                {
                    string text = "Thêm khách hàng thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlykhachhang.aspx')", true);
                }
                else
                {
                    string text = "Thêm khách hàng không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlykhachhang.aspx')", true);

                }
            }


        }

        protected void gvDSKH_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int qt = Model.model.Xoa("delete_khachhang", "@makh", e.CommandArgument.ToString());
                if (qt > 0)
                {
                    string text = "Xóa khách hàng thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlykhachhang.aspx')", true);
                }
                else
                {
                    string text = "Xóa khách hàng không thành thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlykhachhang.aspx')", true);
                }
            }
        }
    }
}