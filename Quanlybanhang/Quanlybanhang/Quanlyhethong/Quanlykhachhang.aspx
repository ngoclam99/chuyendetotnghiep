<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Quanlykhachhang.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Quanlykhachhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                        <div class="row">
                        <div class="col-md-6">
                            <h3>Danh sách khách hàng</h3>
                        </div>
                        <div class="col-md-6 justify-content-md-center">
                            <button type="button" class="btn btn-primary waves-effect waves-light themkhachhang" data-toggle="modal" data-target=".bs-example-modal-lg">Thêm khách hàng</button>  
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="gvDSKH" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="gvDSKH_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="STT">
                                    <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="sTenKH" HeaderText="Tên khách hàng" />
                                <asp:BoundField DataField="sSDT" HeaderText="Số điện thoại" />
                                <asp:BoundField DataField="sGioiTinh" HeaderText="Giới tính" />
                                <asp:TemplateField HeaderText="Tác vụ">
                                    <ItemTemplate>
                                        <button type="button" 
                                            class="btn btn-primary waves-effect waves-light suanhacc" 
                                            data-toggle="modal" 
                                            data-target=".bs-example-modal-lg"
                                            data-sMaKH ="<%#Eval("sMaKH") %>"
                                            data-sTenKH ="<%#Eval("sTenKH") %>"
                                            data-sSDT ="<%#Eval("sSDT") %>"
                                            data-sGioiTinh ="<%#Eval("sGioiTinh") %>"
                                            >Sửa</button>  
                                        <asp:LinkButton ID="btnXoaNhaKH" ToolTip="Xóa" runat="server" CausesValidation="false" CssClass="btn waves-effect waves-light btn-danger" CommandName="xoa" CommandArgument='<%#Eval("sMaKH") %>' OnClientClick="return confirm('Bạn có muốn xóa khách hàng này không ?');"><i class="fa fa-trash"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--modal--%>
         <div class="modal fade bs-example-modal-lg" style="padding-right: 17px;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myLargeModalLabel">Thêm khách hàng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Tên khách hàng</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtKhachhang" runat="server" CssClass="form-control txtKhachhang"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator2"
                                        CssClass="float-right badge badge-pink mt-2"
                                        ControlToValidate="txtKhachhang"
                                        runat="server"
                                        ErrorMessage="Tên khách hàng không được để trống"
                                    ></asp:RequiredFieldValidator>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Giới tính</label>
                                <div class="col-lg-9">
                                    <asp:RadioButton ID="rbNam" runat="server" CssClass="gt_nam" GroupName="GioiTinh" Text="Nam" /> &nbsp;&nbsp;&nbsp; 
                                    <asp:RadioButton ID="rbNu" runat="server" CssClass="gt_nu" GroupName="GioiTinh" Text="Nữ" /><br /><br />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Số điện thoại</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control txtSDT"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row justify-content-md-center">
                                 <asp:TextBox ID="txtMa" runat="server" CssClass="form-control txtMa hide"></asp:TextBox>
                                  <asp:Button ID="capnhatNV" runat="server" CssClass="btn btn-primary capnhat" Text="Thêm khách hàng" OnClick="capnhatNV_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
         </div>
    <script type="text/javascript">
        $(document).ready(function ($) {
            $(".themkhachhang").click(function () {
                $(".txtMa").val("");
                $(".capnhat").val("Thêm");
                $(".modal .txtKhachhang").val("");
                $(".modal .txtSDT").val("");
            });
            $(".suanhacc").click(function () {
                makh       = $(this).attr("data-sMaKH");
                tenkh      = $(this).attr("data-sTenKH");
                dienthoai      = $(this).attr("data-sSDT");
                gioitinh   = $(this).attr("data-sGioiTinh");
                $(".modal .txtKhachhang").val(tenkh);
                 if (gioitinh == "Nam") {
                    $(".modal .gt_nam input").attr("checked", true);
                }
                if (gioitinh == "Nữ") {
                    $(".modal .gt_nu input").attr("checked", true);
                }
                $(".modal .txtKhachhang").val(tenkh);
                $(".modal .txtSDT").val(dienthoai);
                $(".txtMa").val(makh);
                $(".capnhat").val("Cập nhật");
            });
        });
    </script>
</asp:Content>
