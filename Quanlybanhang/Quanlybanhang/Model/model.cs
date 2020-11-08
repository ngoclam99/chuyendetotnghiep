using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quanlybanhang.Model
{
    public class SqlConnectionData
    {

        // kết nối cơ sở dữ liệu
        public static SqlConnection Connect()
        {
            string strcon = @"Data Source=DESKTOP-6MKG600\NGUYENLAM;Initial Catalog=QuanLyBanHang;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strcon); // khởi tạo connect;
            return conn;
        }
    }

    public class model
    {
        // checklogin
        public static SqlDataReader checklogin(string username, string password)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("proc_login", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@user", username);
            command.Parameters.AddWithValue("@pass", password);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            return reader;

        }



        public static SqlDataReader getRow(string proc)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            conn.Close();
            return reader;
        }


        public static int check_key(string proc, string key, string value)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue(key, value);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        public static int check_key_and(string proc, string key, string value, string key1, string value1)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue(key, value);
            command.Parameters.AddWithValue(key1, value1);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public static SqlDataReader getRow_Reader(string proc, string key, string ma)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue(key, ma);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }

        // hàm get dữ liệu
        public static DataTable getData(string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            return ds.Tables[0];
        }

        // hàm get dữ liệu
        public static DataTable getDataWhere(string id, string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            Conn.Close();
            return ds.Tables[0];
        }

        // gọi hàm tạo mã tự động ở đây

        public static string Create_Key(string key_noi, string key_where, string table)
        {
            //key_noi    = "'KH'";
            //key_where  = "sMaKH";
            //table      = "tbl_khachang";
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            string truyvan = "Select CONCAT(" + key_noi + ", RIGHT(CONCAT('0000',ISNULL(right(max(" + key_where + "),4),0) + 1),4)) as " + key_where + " from " + table + " where " + key_where + " like " + key_noi + "+'%' ";
            command.CommandText = truyvan;
            command.Connection = conn;
            object data = command.ExecuteScalar();
            string ma = data.ToString();
            return ma;
        }


        //insert thông tin nhân viên

        public static int capnhat_NhanVien(string manv, string tennv, string ngaysinh, string gioitinh, string diachi, string sdt, string macn, string trangthai)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("capnhat_nhanvien", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@manv", manv);
            cmd.Parameters.AddWithValue("@tennv", tennv);
            cmd.Parameters.AddWithValue("@ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("@gioitinh", gioitinh);
            cmd.Parameters.AddWithValue("@diachi", diachi);
            cmd.Parameters.AddWithValue("@sdt", sdt);
            cmd.Parameters.AddWithValue("@macn", macn);
            cmd.Parameters.AddWithValue("@trangthai", trangthai);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // Hàm xóa bài viết
        public static int Xoa(string proc, string parameter, string value)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue(parameter, value);
            command.Connection = conn;
            int banghitacdong = command.ExecuteNonQuery();
            conn.Close();
            return banghitacdong;
        }

        //insert thông tin nhà cung cấp

        public static int capnhat_NhaCungCap(string ma, string tenncc, string diachi, string dienthoai, string ghichu, string trangthai)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("capnhat_nhacc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mancc", ma);
            cmd.Parameters.AddWithValue("@tenncc", tenncc);
            cmd.Parameters.AddWithValue("@diachi", diachi);
            cmd.Parameters.AddWithValue("@dienthoai", dienthoai);
            cmd.Parameters.AddWithValue("@ghichu", ghichu);
            cmd.Parameters.AddWithValue("@trangthai", trangthai);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }


        //insert thông tin khách hàng

        public static int capnhat_khachhang(string makh, string tenkh, string dienthoai, string gioitinh, string trangthai)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("capnhat_khachhang", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            cmd.Parameters.AddWithValue("@dienthoai", dienthoai);
            cmd.Parameters.AddWithValue("@gioitinh", gioitinh);
            cmd.Parameters.AddWithValue("@trangthai", trangthai);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }


        //insert thông tin tài khoản

        public static int capnhat_taikhoan(string ma, string manv, string maquyen, string taikhoan, string matkhau, string trangthai)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("capnhat_taikhoan", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@matk", ma);
            cmd.Parameters.AddWithValue("@manv", manv);
            cmd.Parameters.AddWithValue("@maquyen", maquyen);
            cmd.Parameters.AddWithValue("@tentk", taikhoan);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            cmd.Parameters.AddWithValue("@trangthai", trangthai);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }


        //insert thông tin tài khoản

        public static int capnhat_chinhanh(string ma, string tencn, string diachi, string trangthai)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("capnhat_chinhanh", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@macn", ma);
            cmd.Parameters.AddWithValue("@tencn", tencn);
            cmd.Parameters.AddWithValue("@diachi", diachi);
            cmd.Parameters.AddWithValue("@trangthai", trangthai);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        //insert thông tin tài khoản

        public static int capnhat_loaisanpham(string ma, string tenloai, string trangthai)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("capnhat_loaisanpham", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@maloai", ma);
            cmd.Parameters.AddWithValue("@tenloai", tenloai);
            cmd.Parameters.AddWithValue("@trangthai", trangthai);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        //insert và cập nhật thông tin sản phẩm

        public static int capnhat_sanpham(
            string ma, 
            string tensp, 
            int soluong, 
            string dongia, 
            string trangthaisp, 
            string maloaisp, 
            string manhacc, 
            string nguoidang, 
            string ngaydang, 
            string mota, 
            string xuatsu, 
            string machinhanh, 
            string trangthai )
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("capnhat_sanpham", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", ma);
            cmd.Parameters.AddWithValue("@tensp", tensp);
            cmd.Parameters.AddWithValue("@soluong", soluong);
            cmd.Parameters.AddWithValue("@dongia", dongia);
            cmd.Parameters.AddWithValue("@trangthaiSP", trangthaisp);
            cmd.Parameters.AddWithValue("@maloaisp", maloaisp);
            cmd.Parameters.AddWithValue("@manhacc", manhacc);
            cmd.Parameters.AddWithValue("@nguoidang", nguoidang);
            cmd.Parameters.AddWithValue("@ngaydang", ngaydang);
            cmd.Parameters.AddWithValue("@mota", mota);
            cmd.Parameters.AddWithValue("@xuatsu", xuatsu);
            cmd.Parameters.AddWithValue("@machinhanh", machinhanh);
            cmd.Parameters.AddWithValue("@trangthai", trangthai);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // insert hinhf ảnh sản phẩm
        public static int insert_anhsanpham(string linkanh, string ghichu, string masp)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert_hinhanh", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@linkanh", linkanh);
            cmd.Parameters.AddWithValue("@ghichu", ghichu);
            cmd.Parameters.AddWithValue("@masp", masp);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // insert phieeus chi tiet nhap
        public static int insert_ctphieunhap(string masp, string mapn, int sl, float dongia, float tongtien)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert_ctphieunhap", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@maphieuPN", mapn);
            cmd.Parameters.AddWithValue("@soluong", sl);
            cmd.Parameters.AddWithValue("@dongia", dongia);
            cmd.Parameters.AddWithValue("@tongtien", tongtien);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // insert phieeus nhap
        public static int insert_phieunhap(string mapn, string nguoilap, string macn, string mancc)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert_phieunhap", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@maPN", mapn);
            cmd.Parameters.AddWithValue("@nguoilap", nguoilap);
            cmd.Parameters.AddWithValue("@macn", macn);
            cmd.Parameters.AddWithValue("@mancc", mancc);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // update giasp, sl
        public static int update_giasp(string masp, string giasp, int soluong)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("update_giaban", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@giaban", giasp);
            cmd.Parameters.AddWithValue("@soluong", soluong);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // Hàm xóa bài viết
        public static int Xoa_CTPN(string value1, string value2)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("delete_ctpn", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@masp", value1);
            command.Parameters.AddWithValue("@mapn", value2);
            command.Connection = conn;
            int banghitacdong = command.ExecuteNonQuery();
            conn.Close();
            return banghitacdong;
        }

        // insert hóa đơn
        public static int insert_hoadon(string mahd, string thoigian, string makh, string nguoilap, int macn)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert_hoadon", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mahd", mahd);
            cmd.Parameters.AddWithValue("@thoigian", thoigian);
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@nguoilapHD", nguoilap);
            cmd.Parameters.AddWithValue("@machinhanh", macn);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // insert chi tiết hóa đơn
        public static int insert_cthoadon(string mahd, string masp, int soluong, float dongia, float tongtien)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert_cthoadon", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mahd", mahd);
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@soluong", soluong);
            cmd.Parameters.AddWithValue("@dongia", dongia);
            cmd.Parameters.AddWithValue("@tongtien", tongtien);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }

        // hàm get dữ liệu
        public static DataTable getHoaDonTheoNgay(string macn, string ngaylap)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand("thongkehoadon", Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@macn", macn);
            cmd.Parameters.AddWithValue("@ngaylap", ngaylap);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            Conn.Close();
            return ds.Tables[0];
        }

        //insert thông tin tài khoản

        public static int capnhat_soluongsp(string ma, int soluong)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("update_soluongSP", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", ma);
            cmd.Parameters.AddWithValue("@soluong", soluong);
            int ret = cmd.ExecuteNonQuery();
            conn.Close();
            return ret;
        }



    }
}