using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Quanlychinhanh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_chinhanh();
        }

        private void load_chinhanh()
        {
            DataTable tb = Model.model.getData("get_chinhanh");
            grDSCN.DataSource = tb;
            grDSCN.DataBind();
        }

        protected void themncc_Click(object sender, EventArgs e)
        {
            string macn, tencn, diachi;
            tencn = txtChinhanh.Text.ToString();
            diachi = txtDiachi.Text.ToString();
            if (txtMa.Text != "")
            {
                int i = Model.model.capnhat_chinhanh(txtMa.Text, tencn, diachi, "capnhat");
                if (i > 0)
                {
                    string text = "Cập nhât chi nhánh thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlychinhanh.aspx')", true);
                }
                else
                {
                    string text = "Cập nhật chi nhánh không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlychinhanh.aspx')", true);
                }
            }
            else
            {
                Random r = new Random();
                int id = r.Next();
                int i = Model.model.capnhat_chinhanh("", tencn, diachi, "them");
                if (i > 0)
                {
                    string text = "Thêm chi nhánh thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlychinhanh.aspx')", true);
                }
                else
                {
                    string text = "Thêm chi nhánh không thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlychinhanh.aspx')", true);
                }
            }
        }

        protected void grDSCN_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int qt = Model.model.Xoa("delete_chinhanh", "@macn", e.CommandArgument.ToString());
                if (qt > 0)
                {
                    string text = "Xóa chi nhánh cấp thành công!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Quanlychinhanh.aspx')", true);
                }
                else
                {
                    string text = "Xóa chi nhánh không thành thành công!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Quanlychinhanh.aspx')", true);
                }
            }
        }
    }
}