------------------Insert dữ liệu----------------------

INSERT INTO tbl_chinhanh VALUES
(N'Chi nhánh Trương Định',N'83 Trương định'),
(N'Chi nhánh Hoàn kiếm',N'93 Hồ hoàn kiếm, Hà Nội'),
(N'Chi nhánh Định Công',N'96 Định công'),
(N'Chi nhánh Linh Đàm',N'HH4C Linh đàm'),
(N'Chi nhánh Thịnh liệt',N'83 Thịnh liệt, Hoàng Mai, Hà Nội'),
(N'Chi nhánh Ngọc Hồi',N'75 Ngọc Hồi')

---Tao proc để lấy tất cả các chi nhánh
create proc get_chi_nhanh
as
begin
	SELECT * FROM tbl_chinhanh
end
---Tao proc để lấy danh sách nhân viên
create proc get_nhanvien
as
begin
	SELECT * FROM tbl_chinhanh, tbl_nhanvien where tbl_chinhanh.iMaCN = tbl_nhanvien.FK_iMaCN
end

--- insert thông tin nhân viên----
create proc capnhat_nhanvien
@manv nvarchar(100),
@tennv nvarchar(50),
@ngaysinh nvarchar(50),
@gioitinh nvarchar(50),
@diachi nvarchar(255),
@sdt nvarchar(15),
@macn int,
@trangthai nvarchar(50)
as
begin
	if @trangthai = N'them'
	begin
		INSERT INTO tbl_nhanvien VALUES(@manv, @tennv, @ngaysinh, @gioitinh, @diachi, @sdt, @macn)
	end
	else
	begin
		UPDATE tbl_nhanvien 
		set sTenNV = @tennv, 
		sNgaySinh = @ngaysinh, 
		sGioiTinh = @gioitinh, 
		sDiaChi = @diachi, 
		sSDT = @sdt, 
		FK_iMaCN = @macn 
		where sMaNV = @manv
	end
end
SELECT * FROM tbl_nhanvien

--proc xóa nhân viên

create proc delete_nhanvien
@manv nvarchar(100)
as
begin
	DELETE tbl_nhanvien WHERE sMaNV = @manv
end

-- get danh sách nhà cung cấp 

create proc get_nhacungcap
as
begin
	select * from tbl_nhacungcap 
end
exec get_nhacungcap

---Insert nhà cung cấp-----
alter proc capnhat_nhacc
@mancc nvarchar(100),
@tenncc nvarchar(255),
@diachi nvarchar(255),
@dienthoai nvarchar(50),
@ghichu nvarchar(255),
@trangthai nvarchar(255)
as
begin
	if @trangthai = N'capnhat'
	begin
		UPDATE tbl_nhacungcap set sTenNhaCC = @tenncc, sDiaChi = @diachi, sDienThoai = @dienthoai, sGhiChu = @ghichu where sMaNhaCC = @mancc
	end
	else
	begin
		INSERT INTO tbl_nhacungcap VALUES(@mancc, @tenncc, @diachi, @dienthoai, @ghichu)
	end
end

create proc delete_nhacungcap
@mancc nvarchar(100)
as
begin
	DELETE tbl_nhacungcap WHERE sMaNhaCC = @mancc
end


create proc get_khachhang
as
begin
	SELECT * FROM tbl_khachhang
end


create proc capnhat_khachhang
@makh nvarchar(100),
@tenkh nvarchar(50),
@dienthoai nvarchar(50),
@gioitinh nvarchar(10),
@trangthai nvarchar(255)
as
begin
	if @trangthai = N'them'
	begin
		INSERT INTO tbl_khachhang VALUES(@makh, @tenkh, null, @dienthoai, @gioitinh)
	end
	else
	begin
		update tbl_khachhang set sTenKH = @tenkh, sLoaiKH = null, sSDT = @dienthoai, sGioiTinh = @gioitinh where sMaKH = @makh
	end
end


--proc xóa nhân viên

create proc delete_khachhang
@makh nvarchar(100)
as
begin
	DELETE tbl_khachhang WHERE sMaKH = @makh
end

-- get ds nhân viên
create proc get_dsnv
as
begin
	SELECT * from tbl_nhanvien
end

-- get ds quyền
alter proc get_dsquyen
as
begin
	SELECT * from tbl_quyen
end

alter proc capnhat_taikhoan
@matk nvarchar(100),
@manv nvarchar(50),
@tentk nvarchar(50),
@matkhau nvarchar(10),
@maquyen nvarchar(10),
@trangthai nvarchar(255)
as
begin
	if @trangthai = N'them'
	begin
		INSERT INTO tbl_taikhoan VALUES(@tentk, @manv, @tentk, @matkhau, @maquyen)
	end
	else
	begin
		update tbl_taikhoan set FK_sMaNV =  @manv, sTenTK = @tentk, sMatKhau = @matkhau, FK_iMaQuyen = @maquyen where sMaTK = @matk and @matkhau is not null
	end
end

-- GET DS TÀI KHOẢN

CREATE PROC get_dstk
as
begin
	SELECT * FROM tbl_taikhoan 
	INNER JOIN tbl_nhanvien on tbl_taikhoan.FK_sMaNV = tbl_nhanvien.sMaNV
	INNER JOIN tbl_quyen on tbl_quyen.iMaQuyen = tbl_taikhoan.FK_iMaQuyen 
	inner join tbl_chinhanh on tbl_chinhanh.iMaCN = tbl_nhanvien.FK_iMaCN
end 

-- xóa tài khoản

create proc delete_taikhoan
@matk nvarchar(50)
as
begin
	DELETE tbl_taikhoan where sMaTK = @matk
end


alter proc capnhat_chinhanh
@macn nvarchar(100),
@tencn nvarchar(255),
@diachi nvarchar(255),
@trangthai nvarchar(255)
as
begin
	if @trangthai = N'them'
	begin
		INSERT INTO tbl_chinhanh VALUES(@tencn, @diachi)
	end
	else
	begin
		update tbl_chinhanh set sTenCN = @tencn, sDiaChiChiNhanh = @diachi where iMaCN = @macn
	end
end

exec capnhat_chinhanh 1, N'Trưng Định2',1,N'capnhat'
--get ds chi nhánh---
create proc get_chinhanh
as
begin
	SELECT * FROM tbl_chinhanh
end


-- xóa tài khoản

create proc delete_chinhanh
@macn nvarchar(50)
as
begin
	DELETE tbl_chinhanh where iMaCN = @macn
end

-- get loại sản phẩm
create proc get_loaiSP
as
begin
	SELECT * FROM tbl_loaiSP
end


create proc capnhat_loaisanpham
@maloai nvarchar(100),
@tenloai nvarchar(255),
@trangthai nvarchar(255)
as
begin
	if @trangthai = N'them'
	begin
		INSERT INTO tbl_loaiSP VALUES(@maloai, @tenloai)
	end
	else
	begin
		update tbl_loaiSP set sTenLoaiSP = @tenloai where sLoaiSP = @maloai
	end
end

-- xóa danh mục sản phẩm

create proc delete_dmsp
@maloai nvarchar(50)
as
begin
	DELETE tbl_loaiSP where sLoaiSP = @maloai
end


alter proc capnhat_sanpham
@masp nvarchar(100),
@tensp nvarchar(100),
@soluong int,
@dongia nvarchar(20),
@trangthaiSP nvarchar(100),
@maloaisp nvarchar(100),
@manhacc nvarchar(100),
@nguoidang nvarchar(100),
@ngaydang nvarchar(100),
@mota ntext,
@xuatsu nvarchar(255),
@machinhanh nvarchar(100),
@trangthai nvarchar(255)
as
begin
	if @trangthai = N'them'
	begin
		INSERT INTO tbl_sanpham VALUES(@masp, @tensp, @soluong, @dongia, @trangthaiSP, @maloaisp, @manhacc, @nguoidang, @ngaydang, @mota, @xuatsu, @machinhanh)
	end
	else
	begin
		update tbl_sanpham set 
		sTensp = @tensp, 
		iSoLuong = @soluong, 
		fDonGia = @dongia, 
		sTrangThai = @trangthaiSP, 
		FK_sMaLoaiSP = @maloaisp, 
		FK_sMaNhaCC = @manhacc, 
		FK_sNguoiDangSP = @nguoidang, 
		sNgayDangSp = @ngaydang, 
		sMoTa = @mota, 
		sXuatSu = @xuatsu, 
		FK_iMaCN = @machinhanh 
		where sMaSP = @masp
	end
end

-- get danh sách sản phẩm

alter proc get_sanpham
as
begin
	select * from tbl_sanpham 
	inner join tbl_loaiSP on tbl_loaiSP.sLoaiSP = tbl_sanpham.FK_sMaLoaiSP 
	inner join tbl_nhacungcap on tbl_nhacungcap.sMaNhaCC= tbl_sanpham.FK_sMaNhaCC
	inner join tbl_nhanvien on tbl_nhanvien.sMaNV= tbl_sanpham.FK_sNguoiDangSP
	inner join tbl_chinhanh on tbl_chinhanh.iMaCN= tbl_sanpham.FK_iMaCN
	ORDER BY tbl_sanpham.sNgayDangSp DESC
end


create proc delete_sanpham
@masp nvarchar(50)
as
begin
	DELETE tbl_sanpham where sMaSP = @masp
end

create proc get_sanpham_where
@masp nvarchar(50)
as
begin
	select * from tbl_sanpham 
	inner join tbl_loaiSP on tbl_loaiSP.sLoaiSP = tbl_sanpham.FK_sMaLoaiSP 
	inner join tbl_nhacungcap on tbl_nhacungcap.sMaNhaCC= tbl_sanpham.FK_sMaNhaCC
	inner join tbl_nhanvien on tbl_nhanvien.sMaNV= tbl_sanpham.FK_sNguoiDangSP
	inner join tbl_chinhanh on tbl_chinhanh.iMaCN= tbl_sanpham.FK_iMaCN
	where tbl_sanpham.sMaSP = @masp
end

create proc get_tt_sanpham
@id nvarchar(50)
as
begin
	select * from tbl_sanpham 
	where tbl_sanpham.sMaSP = @id
end

create proc insert_hinhanh
@linkanh nvarchar(255),
@ghichu  nvarchar(255),
@masp nvarchar(255)
as
begin
	INSERT INTO tbl_anh values(@linkanh, @ghichu, @masp)
end

create proc delete_hinhanh
@masp nvarchar(50)
as
begin
	DELETE tbl_anh where FK_sMaSP = @masp
end

alter proc get_hinhanh
@id nvarchar(50)
as
begin
	SELECT * from tbl_anh where FK_sMaSP = @id
end


alter proc proc_login
@user nvarchar(255),
@pass nvarchar(255)
as
begin
	SELECT * FROM tbl_taikhoan, tbl_nhanvien 
	where 
	tbl_taikhoan.FK_sMaNV = tbl_nhanvien.sMaNV
	and tbl_taikhoan.sMaTK = @user and tbl_taikhoan.sMatKhau = @pass
end

create proc insert_ctphieunhap
@masp nvarchar(100),
@maphieuPN nvarchar(100),
@soluong int,
@dongia float,
@tongtien float
as
begin
	INSERT INTO tbl_chitietphieunhap VALUES(@masp, @maphieuPN, @soluong, @dongia, @tongtien)
end

alter proc insert_phieunhap
@maPN nvarchar(100),
@nguoilap nvarchar(100),
@macn int,
@mancc nvarchar(100)
as
begin
	INSERT INTO tbl_phieunhap VALUES(@maPN, GETDATE(), null , @nguoilap, @macn, @mancc)
end

alter proc update_giaban
@masp nvarchar(255),
@giaban nvarchar(20),
@soluong int
as
begin
	declare @slcu int
	select @slcu = iSoLuong from tbl_sanpham where sMaSP = @masp
	update tbl_sanpham set fDonGia = @giaban,iSoLuong = @slcu + @soluong  where sMaSP = @masp
end

alter proc get_phieunhap
as
begin
	select * from tbl_phieunhap 
	inner join tbl_nhacungcap on tbl_nhacungcap.sMaNhaCC = tbl_phieunhap.FK_sMaNCC
	inner join tbl_chinhanh on tbl_chinhanh.iMaCN= tbl_phieunhap.FK_iMaCN
	inner join tbl_nhanvien on tbl_nhanvien.sMaNV= tbl_phieunhap.FK_sNguoiLap
	order by tbl_phieunhap.sThoiGian_Nhap DESC
end

create proc get_ctphieunhap
@id nvarchar(100)
as
begin
	SELECT * FROM tbl_chitietphieunhap
	inner join tbl_sanpham on tbl_chitietphieunhap.FK_MaSP = tbl_sanpham.sMaSP
	where tbl_chitietphieunhap.FK_MaPN = @id
end


-- xóa danh mục sản phẩm

create proc delete_ctpn
@masp nvarchar(50),
@mapn nvarchar(50)
as
begin
	DELETE tbl_chitietphieunhap where FK_MaSP = @masp and FK_MaPN = @mapn
end


alter proc delete_chitiepn
@mapn nvarchar(100)
as
begin 
	DELETE tbl_chitietphieunhap where FK_MaPN = @mapn
end

create proc check_pn
@mapn nvarchar(100)
as
begin
	select * from tbl_phieunhap where sMaPN = @mapn
end

create proc ct_phieunhap
@masp nvarchar(100),
@mapn nvarchar(100)
as
begin
	select * from tbl_chitietphieunhap where  FK_MaPN = @mapn and FK_MaSP = @masp
end


create proc delete_phieunhap
@mapn nvarchar(100)
as
begin 
	DELETE tbl_chitietphieunhap where FK_MaPN = @mapn
	DELETE tbl_phieunhap where sMaPN = @mapn
end


create proc insert_hoadon
@mahd nvarchar(100),
@thoigian nvarchar(50),
@makh nvarchar(100),
@nguoilapHD nvarchar(100),
@machinhanh int
as
begin
	INSERT INTO tbl_hoadon values(@mahd, @thoigian, @makh, @nguoilapHD, @machinhanh)
end

--ALTER TABLE tbl_hoadon DROP CONSTRAINT FK_sMaKH;

create proc insert_cthoadon
@mahd nvarchar(100),
@masp nvarchar(50),
@soluong int,
@dongia float,
@tongtien float
as
begin
	INSERT INTO tbl_chitiethoadon values(@mahd, @masp, @soluong, @dongia, @tongtien)
end

alter proc get_hoadon
as
begin
	SELECT tbl_chinhanh.sTenCN, tbl_nhanvien.sTenNV, tbl_khachhang.sTenKH, tbl_hoadon.sThoiGian_Lap, tbl_hoadon.sMaHD,
	sum(tbl_chitiethoadon.fTongTienM) as [tongtienHD]
	 FROM tbl_hoadon
	INNER JOIN tbl_chinhanh on tbl_hoadon.FK_iMaCN = tbl_chinhanh.iMaCN
	LEFT JOIN tbl_khachhang on tbl_hoadon.FK_sMaKH = tbl_khachhang.sMaKH
	INNER JOIN tbl_nhanvien on tbl_nhanvien.sMaNV = tbl_hoadon.FK_sNguoiLapHD
	LEFT JOIN tbl_chitiethoadon on tbl_chitiethoadon.FK_MaHD = tbl_hoadon.sMaHD
	group by tbl_chinhanh.sTenCN, tbl_nhanvien.sTenNV, tbl_khachhang.sTenKH, tbl_hoadon.sThoiGian_Lap, tbl_hoadon.sMaHD
	order by tbl_hoadon.sThoiGian_Lap DESC
end

create proc delete_hoadon
@mahd nvarchar(100)
as
begin
	DELETE tbl_chitiethoadon where FK_MaHD = @mahd
	DELETE tbl_hoadon where sMaHD = @mahd
end

create proc get_cthoadon
@id nvarchar(100)
as
begin
	SELECT * from tbl_chitiethoadon 
	INNER JOIN tbl_hoadon on tbl_hoadon.sMaHD = tbl_chitiethoadon.FK_MaHD
	INNER JOIN tbl_sanpham on tbl_sanpham.sMaSP= tbl_chitiethoadon.FK_MaSP
	where tbl_chitiethoadon.FK_MaHD = @id
end

alter proc get_hoadon_where
@id nvarchar(100)
as
begin
	SELECT * from tbl_hoadon
	inner join tbl_chinhanh on tbl_chinhanh.iMaCN = tbl_hoadon.FK_iMaCN 
	where tbl_hoadon.sMaHD = @id
end

---- báo cáo thống kê

alter proc thongkehoadon
--@macn int,
@ngaylap nvarchar(50)
as
begin
	if @ngaylap != ''
		begin
			select tbl_hoadon.FK_iMaCN,tbl_chinhanh.sTenCN, tbl_chinhanh.sDiaChiChiNhanh, COUNT(sMaHD) as [tongsoHD]
			from tbl_hoadon
			inner join tbl_chinhanh on tbl_chinhanh.iMaCN = tbl_hoadon.FK_iMaCN
			--right join tbl_chitiethoadon on tbl_chitiethoadon.FK_MaHD = tbl_hoadon.sMaHD 
			where sThoiGian_Lap like '%'+@ngaylap+'%'
			group by tbl_hoadon.FK_iMaCN,tbl_chinhanh.sTenCN, tbl_chinhanh.sDiaChiChiNhanh
		end
end



select tbl_hoadon.sMaHD,tbl_hoadon.sThoiGian_Lap, tbl_chinhanh.sTenCN, tbl_chinhanh.iMaCN, tbl_chinhanh.sDiaChiChiNhanh, sum(tbl_chitiethoadon.fTongTienM) as [tongtienHD], count(tbl_chitiethoadon.FK_MaSP) as [tongsoSPHD] from tbl_hoadon
left join tbl_chitiethoadon on tbl_chitiethoadon.FK_MaHD = tbl_hoadon.sMaHD 
inner join tbl_chinhanh on tbl_chinhanh.iMaCN = tbl_hoadon.FK_iMaCN
where sThoiGian_Lap like '%'+'08/11/2020'+'%'
group by tbl_hoadon.sMaHD,tbl_hoadon.sThoiGian_Lap, tbl_chinhanh.sTenCN,tbl_chinhanh.sDiaChiChiNhanh, tbl_chinhanh.iMaCN

alter proc getTTChiNhanhTheoNgay
@id nvarchar(50)
as
begin
	select tbl_chinhanh.sTenCN, tbl_chinhanh.sTenCN, tbl_chinhanh.sDiaChiChiNhanh, sum(tbl_chitiethoadon.fTongTienM) as [tongtienHD], count(tbl_chitiethoadon.FK_MaSP) as [tongsoSPHD] from tbl_hoadon
	left join tbl_chitiethoadon on tbl_chitiethoadon.FK_MaHD = tbl_hoadon.sMaHD 
	full join tbl_chinhanh on tbl_chinhanh.iMaCN = tbl_hoadon.FK_iMaCN
	where tbl_hoadon.sThoiGian_Lap like '%'+@id+'%' or tbl_hoadon.sThoiGian_Lap is null
	group by tbl_chinhanh.sTenCN,tbl_chinhanh.sDiaChiChiNhanh, tbl_chinhanh.iMaCN
end

exec getTTChiNhanhTheoNgay '07/11/2020'

alter proc update_soluongSP
@masp nvarchar(100),
@soluong int
as
begin
	update tbl_sanpham set iSoLuong = iSoLuong - @soluong where sMaSP =  @masp
end

SELECT * FROM tbl_anh
SELECT * FROM tbl_chinhanh
SELECT * FROM tbl_chitiethoadon

SELECT * FROM tbl_hoadon
SELECT * FROM tbl_khachhang
SELECT * FROM tbl_loaiSP
SELECT * FROM tbl_nhacungcap	
SELECT * FROM tbl_nhanvien
SELECT * FROM tbl_phieunhap
SELECT * FROM tbl_quyen
SELECT * FROM tbl_taikhoan
SELECT * FROM tbl_sanpham
SELECT * FROM tbl_chitietphieunhap

ALTER TABLE tbl_nhacungcap ALTER COLUMN sTenNhaCC nvarchar(500)