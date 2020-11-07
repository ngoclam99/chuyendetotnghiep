using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Quanlynhacungcap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Load_nhacungcap();
        }

        private void Load_nhacungcap()
        {
            DataTable tb = Model.model.getData("get_nhacungcap");
            gvNhaCC.DataSource = tb;
            gvNhaCC.DataBind();
        }

        protected void themNhanVien_Click(object sender, EventArgs e)
        {
            string mancc = Model.model.Create_Key("'NCC'", "sMaNhaCC", "tbl_nhacungcap");
            string tenncc = txtNhaCC.Text;
            string diachi = txtDiaChi.Text;
            string dienthoai = txtDienThoai.Text;
            string ghichu = txtGhiChu.Text;
            if (txtMaNhaCC.Text != "")
            {
                mancc = txtMaNhaCC.Text;
                int i = Model.model.capnhat_NhaCungCap(mancc, tenncc, diachi, dienthoai, ghichu, "capnhat");
                if (i > 0)
                {
                    string text = "Cập nhật nhà cung cấp thành công!";
                    string redirect = "Quanlynhacungcap.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlynhacungcap.aspx')", true);
                }
                else
                {
                    string text = "Cập nhật nhà cung cấp không thành công!";
                    string redirect = "Quanlynhacungcap.aspx";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlynhacungcap.aspx')", true);

                }
            }
            else
            {
                int i = Model.model.capnhat_NhaCungCap(mancc, tenncc, diachi, dienthoai, ghichu, "them");
                if (i > 0)
                {
                    string text = "Thêm nhà cung cấp thành công!";
                    string redirect = "Quanlynhacungcap.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlynhacungcap.aspx')", true);
                }
                else
                {
                    string text = "Thêm nhà cung cấp không thành công!";
                    string redirect = "Quanlynhacungcap.aspx";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlynhacungcap.aspx')", true);

                }
            }

        }

        protected void gvNhaCC_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int qt = Model.model.Xoa("delete_nhacungcap", "@mancc", e.CommandArgument.ToString());
                if (qt > 0)
                {
                    string text = "Xóa nhà cung cấp thành công!";
                    string redirect = "Quanlynhacungcap.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlynhacungcap.aspx')", true);
                }
                else
                {
                    string text = "Xóa nhà cung cấp không thành thành công!";
                    string redirect = "Quanlynhacungcap.aspx";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlynhacungcap.aspx')", true);
                }
            }
        }
    }
}