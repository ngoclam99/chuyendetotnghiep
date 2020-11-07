using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quanlybanhang.Quanlyhethong
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString.Get("logout")  != "")
            {
                string logout = Request.QueryString.Get("logout");
                if(logout != null)
                {
                    Session.Abandon();
                    Response.Redirect("Dangnhap.aspx");
                }
            }
        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            string tendn = txtDangnhap.Value;
            string pass = txtPass.Value;
            SqlDataReader reader = Model.model.checklogin(tendn, pass);
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["manv"] = reader["FK_sMaNV"];
                    Session["tennv"] = reader["sTenNV"];
                    Session["macn"] = reader["FK_iMaCN"];
                    Session["tentk"] = reader["sTenTK"];
                    Session["maquyen"] = reader["FK_iMaQuyen"];
                }
                reader.Close();
                Response.Redirect("Trangchu.aspx");
                //string text = "Đăng nhập thành công!";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "thongbao_success('" + text + "', 'Trangchu.aspx')", true);
            }
            else
            {
                string text = "Tài khoản hoặc mật khẩu của bạn không chính xác!";
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "thongbao_error('" + text + "', 'Dangnhap.aspx')", true);
            }
            
        }
    }
}