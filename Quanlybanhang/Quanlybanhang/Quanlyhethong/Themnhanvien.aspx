<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Themnhanvien.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Themnhanvien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="container">
        <div class="row">
        <div class="col-xl-12">
            <div class="row justify-content-md-center">
                <div class="panel panel-primary">
		            <div class="panel-heading">
			            <h3 class="panel-title">Thêm nhân viên</h3>
		            </div>
		            <div class="panel-body">
                        <div class="col-md-12 justify-content-md-center">
                            <a href="Danhsachnhanvien.aspx" class="btn btn-success">Danh sách nhân viên</a>
                        <hr />
                        </div>
                        <table class="table table-bordered">
                            <tr>
                                <td width="50%">
                                    <label class="col-lg-3 col-form-label">Tên nhân viên</label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txtTenNV" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="rpftxtTenNV"
                                            CssClass="float-right badge badge-pink mt-2"
                                            ControlToValidate="txtTenNV"
                                            runat="server"
                                            ErrorMessage="Tên nhân viên không được để trống"
                                        ></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                                <td>
                                    <label class="col-lg-3 col-form-label">Ngày sinh</label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txtNgaySinh" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="rpftxtNgaySinh"
                                            CssClass="float-right badge badge-pink mt-2"
                                            ControlToValidate="txtNgaySinh"
                                            runat="server"
                                            ErrorMessage="Ngày sinh không được để trống"
                                        ></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="col-lg-3 col-form-label">Giới tính</label>
                                    <div class="col-lg-9">
                                        <asp:RadioButton ID="rbNam" runat="server" GroupName="GioiTinh" Text="Nam" /> &nbsp;&nbsp;&nbsp; <asp:RadioButton ID="rbNu" runat="server" GroupName="GioiTinh" Text="Nữ" /><br /><br />
                                    </div>
                                </td>
                                <td>
                                     <label class="col-lg-3 col-form-label">Địa chỉ</label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txtDiachi" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator1"
                                            CssClass="float-right badge badge-pink mt-2"
                                            ControlToValidate="txtDiachi"
                                            runat="server"
                                            ErrorMessage="Địa chỉ không được để trống"
                                        ></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="col-lg-3 col-form-label">Số điện thoại</label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator2"
                                            CssClass="float-right badge badge-pink mt-2"
                                            ControlToValidate="txtSDT"
                                            runat="server"
                                            ErrorMessage="Số điện thoại không được để trống"
                                        ></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                                <td>
                                     <label class="col-lg-3 col-form-label">Chi nhánh</label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList
                                            ID="drChiNhanh"
                                            runat="server"
                                            CssClass="form-control"
                                            AutoPostBack="False"
                                            OnSelectedIndexChanged="drChiNhanh_SelectedIndexChanged"
                                            AppendDataBoundItems="True"
                                        ></asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rpfdrChiNhanh" ControlToValidate="drChiNhanh" runat="server" ErrorMessage="Chi nhánh không được để trống"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <asp:Button ID="themNhanVien" runat="server" CssClass="btn btn-primary" Text="Thêm nhân viên" OnClick="themNhanVien_Click" />
                                </td>
                            </tr>
                        </table>
		            </div>
	            </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
