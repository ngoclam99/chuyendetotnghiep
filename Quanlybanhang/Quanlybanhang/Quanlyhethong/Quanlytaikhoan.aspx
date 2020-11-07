<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Quanlytaikhoan.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Quanlytaikhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h3>Quản lý tài khoản</h3>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                    <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Chọn nhân viên</label>
                                    <div class="col-lg-9">
                                        <asp:dropdownlist runat="server" ID="dsNV" 
                                        CssClass="form-control manv">
                                        </asp:dropdownlist>
                                        <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1"
                                                CssClass="float-right badge badge-pink mt-2"
                                                ControlToValidate="dsNV"
                                                runat="server"
                                                ErrorMessage="Tên nhân viên không được để rỗng"
                                            ></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Mã quyền</label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList ID="drDSQuyen" runat="server" CssClass="form-control maquyen" ></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Tài khoản</label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txTaiKhoan" runat="server" CssClass="form-control taikhoan" ></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                                ID="rpftxtTenTK"
                                                CssClass="float-right badge badge-pink mt-2"
                                                ControlToValidate="txTaiKhoan"
                                                runat="server"
                                                ErrorMessage="Tên tài khoản không được để trống"
                                            ></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Mật khẩu</label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <asp:Button ID="btnThem" runat="server" Text="Thêm tài khoản" CssClass="btn btn-primary themtaikhoan" OnClick="btnThem_Click" />
                                    <button class="btn btn-warning huy" type="button">Hủy</button>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h4 class="text-center">Danh sách tài khoản</h4>
                                <asp:GridView ID="grDSTK" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-bordered" OnRowCommand="grDSTK_RowCommand">
                                     <Columns>
                                        <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sTenTK" HeaderText="Tên tài khoản" />
                                        <asp:BoundField DataField="sTenNV" HeaderText="Tên nhân viên" />
                                        <asp:BoundField DataField="sTenQuyen" HeaderText="Quyền" />
                                        <asp:TemplateField HeaderText="Tác vụ">
                                            <ItemTemplate>
                                                <button type="button" class="btn btn-primary suatk"
                                                    data-sTenTK ="<%#Eval("sTenTK") %>"
                                                    data-sMaTK ="<%#Eval("sMaTK") %>"
                                                    data-FK_sMaNV ="<%#Eval("FK_sMaNV") %>"
                                                    data-FK_iMaQuyen ="<%#Eval("FK_iMaQuyen") %>"
                                                > 
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </button>
                                               
                                                <asp:LinkButton ID="LinkButton1" ToolTip="Xóa" runat="server" CausesValidation="false" CssClass="btn btn-danger" CommandName="xoa" CommandArgument='<%#Eval("sMaTK") %>' OnClientClick="return confirm('Bạn có muốn xóa tài khoản này không ?');"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <asp:TextBox ID="txtMaTK" runat="server" CssClass="form-control txtMaTK hide"></asp:TextBox>
     <asp:TextBox ID="txtTenTK" runat="server" CssClass="form-control txtTenTK hide"></asp:TextBox>
    <script>
        $(document).ready(function(){
            $(".huy").hide();
            $(".suatk").click(function () {
                $(".manv").val($(this).attr("data-FK_sMaNV")).trigger("change");
                $(".maquyen").val($(this).attr("data-FK_iMaQuyen")).trigger("change");
                $(".taikhoan").val($(this).attr("data-sTenTK"));
                $(".taikhoan").attr("disabled", true);
                $(".manv").attr("disabled", true);
                $(".maquyen").attr("disabled", true);
                $(".huy").show();
                $(".themtaikhoan").val("Cập nhật tài khoản");
                $(".txtMaTK").val($(this).attr("data-sMaTK"));
                $(".txtTenTK").val($(this).attr("data-sTenTK"));
            });
            $(".huy").click(function () {
                $(".manv").val("").trigger("change");
                $(".taikhoan").val("");
                $(".taikhoan").attr("disabled", false);
                $(".manv").attr("disabled", false);
                $(".maquyen").attr("disabled", false);
                $(".huy").hide();
                $(".themtaikhoan").val("Thêm tài khoản");
                $(".txtMaTK").val("");
                $(".txtTenTK").val("");
            });
        });
    </script>
</asp:Content>
