<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Quanlynhacungcap.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Quanlynhacungcap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                        <div class="row">
                        <div class="col-md-6">
                            <h3>Danh sách nhà cung cấp</h3>
                        </div>
                        <div class="col-md-6 justify-content-md-center">
                            <button type="button" class="btn btn-primary waves-effect waves-light themnhacc" data-toggle="modal" data-target=".bs-example-modal-lg">Thêm nhà cung cấp</button>  
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="gvNhaCC" runat="server" AutoGenerateColumns="False" CssClass=" table table-hover table-bordered" OnRowCommand="gvNhaCC_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="STT">
                                    <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="sTenNhaCC" HeaderText="Tên nhà cung cấp" />
                                <asp:BoundField DataField="sDiaChi" HeaderText="Địa chỉ" />
                                <asp:BoundField DataField="sDienThoai" HeaderText="Điện thoại" />
                                <asp:BoundField DataField="sGhiChu" HeaderText="Ghi chú" />
                                <asp:TemplateField HeaderText="Tác vụ">
                                    <ItemTemplate>
                                        <button type="button" 
                                            class="btn btn-primary waves-effect waves-light suanhacc" 
                                            data-toggle="modal" 
                                            data-target=".bs-example-modal-lg"
                                            data-mancc      = "<%#Eval("sMaNhaCC") %>"
                                            data-tenncc     = "<%#Eval("sTenNhaCC") %>"
                                            data-diachi     = "<%#Eval("sDiaChi") %>"
                                            data-dienthoai  = "<%#Eval("sDienThoai") %>"
                                            data-ghichu     = "<%#Eval("sGhiChu") %>"
                                            >Sửa</button>  
                                        <asp:LinkButton ID="btnXoaNhaCC" ToolTip="Xóa" runat="server" CausesValidation="false" CssClass="btn waves-effect waves-light btn-danger" CommandName="xoa" CommandArgument='<%#Eval("sMaNhaCC") %>' OnClientClick="return confirm('Bạn có muốn xóa nhà cung cấp này không ?');"><i class="fa fa-trash"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-lg" style="padding-right: 17px;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myLargeModalLabel">Thêm nhà cung cấp</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label">Tên nhà cung cấp</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtNhaCC" runat="server" CssClass="form-control txtNhaCC"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1"
                                    CssClass="float-right badge badge-pink mt-2"
                                    ControlToValidate="txtNhaCC"
                                    runat="server"
                                    ErrorMessage="Nhà cung cấp không được để trống"
                                ></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label">Địa chỉ</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control txtDiaChi"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2"
                                    CssClass="float-right badge badge-pink mt-2"
                                    ControlToValidate="txtDiaChi"
                                    runat="server"
                                    ErrorMessage="Địa chỉ không được để trống"
                                ></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label">Điện thoại</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control txtDienThoai"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label">Ghi chú</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtGhiChu" runat="server" CssClass="form-control txtGhiChu"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row justify-content-md-center">
                            <asp:TextBox ID="txtMaNhaCC" runat="server" CssClass="form-control txtManhacc hiden"></asp:TextBox>
                            <asp:Button ID="themncc" runat="server" CssClass="btn btn-primary capnhat" Text="Thêm" OnClick="themNhanVien_Click" />
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
            $(".themnhacc").click(function () {
                $(".txtManhacc").val("");
                $(".capnhat").val("Thêm");
            });
            $(".suanhacc").click(function () {
                mancc       = $(this).attr("data-mancc");
                tenncc      = $(this).attr("data-tenncc");
                diachi      = $(this).attr("data-diachi");
                dienthoai   = $(this).attr("data-dienthoai");
                ghichu = $(this).attr("data-ghichu");
                $(".modal .txtNhaCC").val(tenncc);
                $(".modal .txtDiaChi").val(diachi);
                $(".modal .txtDienThoai").val(dienthoai);
                $(".modal .txtGhiChu").val(ghichu);
                $(".txtManhacc").val(mancc);
                $(".capnhat").val("Cập nhật");
            });
        });
    </script>
    <style>
        #Content_gvNhaCC > tbody > tr:nth-child(1) > th:nth-child(6){
            width:10%;
        }
    </style>
</asp:Content>
