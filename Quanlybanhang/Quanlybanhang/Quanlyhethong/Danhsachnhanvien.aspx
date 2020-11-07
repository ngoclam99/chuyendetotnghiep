<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Danhsachnhanvien.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Danhsachnhanvien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                    <div class="row">
                    <div class="col-md-6">
                        <h3>Danh sách nhân viên</h3>
                    </div>
                    <div class="col-md-6 justify-content-md-center">
                        <a href="Themnhanvien.aspx" class="btn btn-info">Thêm nhân viên</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="grDSNV" runat="server" CssClass="table table-hover table-bordered " AutoGenerateColumns="False" OnRowCommand="grDSNV_RowCommand" >
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="sTenNV" HeaderText="Họ và Tên" />
                            <asp:BoundField DataField="sNgaySinh" HeaderText="Ngày sinh" />
                            <asp:BoundField DataField="sGioiTinh" HeaderText="Giới tính" />
                            <asp:BoundField DataField="sDiaChi" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="sSDT" HeaderText="Số điện thoại" />
                            <asp:BoundField DataField="sTenCN" HeaderText="Chi nhánh" />
                            <asp:TemplateField HeaderText="Tác vụ">
                                <ItemTemplate>
                                        <button type="button" 
                                        class="btn btn-primary waves-effect waves-light suanhanvien" 
                                        data-toggle="modal" 
                                        data-target=".bs-example-modal-lg"
                                        data-sMaNV      ="<%#Eval("sMaNV") %>"
                                        data-sTenNV     ="<%#Eval("sTenNV") %>"
                                        data-sNgaySinh  ="<%#Eval("sNgaySinh") %>"
                                        data-sGioiTinh  ="<%#Eval("sGioiTinh") %>"
                                        data-sDiaChi    ="<%#Eval("sDiaChi") %>"
                                        data-sSDT       ="<%#Eval("sSDT") %>"
                                        data-FK_iMaCN   ="<%#Eval("FK_iMaCN") %>"
                                        > <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                        </button>  
                                    <asp:LinkButton ID="btnXoaNhanVien" ToolTip="Xóa" runat="server" CausesValidation="false" CssClass="btn btn-danger" CommandName="xoa" CommandArgument='<%#Eval("sMaNV") %>' OnClientClick="return confirm('Bạn có muốn xóa loại tin này không ?');"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </div>
            </div>
            </div>
    </div>
</div>
    
<!-- Modal -->
    <div class="modal fade bs-example-modal-lg" style="padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myLargeModalLabel">Sửa thông tin nhân viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Tên nhân viên</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtTenNV" runat="server" CssClass="form-control txtTenNV"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Ngày sinh</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control txtNgaySinh"></asp:TextBox>
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
                    <label class="col-lg-3 col-form-label">Địa chỉ</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtDiachi" runat="server" CssClass="form-control txtDiachi"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Số điện thoại</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control txtSDT"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Chi nhánh</label>
                    <div class="col-lg-9">
                        <asp:DropDownList
                            ID="drChiNhanh"
                            runat="server"
                            CssClass="form-control chinhanh"
                            AutoPostBack="False"
                            AppendDataBoundItems="True"
                        ></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row justify-content-md-center">
                        <asp:TextBox ID="txtMa" runat="server" CssClass="form-control txtMaNV hide"></asp:TextBox>
                        <asp:Button ID="capnhatNV" runat="server" CssClass="btn btn-primary" Text="Cập nhật thông tin nhân viên" OnClick="capnhatNV_Click"  />
                </div>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script type="text/javascript">
    $(document).ready(function($) {
        $(".suanhanvien").click(function () {
            manv        = $(this).attr("data-sMaNV");
            sTenNV      = $(this).attr("data-sTenNV");
            sNgaySinh   = $(this).attr("data-sNgaySinh");
            sGioiTinh = $(this).attr("data-sGioiTinh");
            sDiaChi     = $(this).attr("data-sDiaChi");
            sSDT        = $(this).attr("data-sSDT");
            FK_iMaCN = $(this).attr("data-FK_iMaCN");
            if (sGioiTinh == "Nam") {
                $(".modal .gt_nam input").attr("checked", true);
            }
            if (sGioiTinh == "Nữ") {
                $(".modal .gt_nu input").attr("checked", true);
            }
            $(".modal .txtTenNV").val(sTenNV);
            $(".modal .txtMaNV").val(manv);
            $(".modal .txtNgaySinh").val(sNgaySinh);
            $(".modal .txtDiachi").val(sDiaChi);
            $(".modal .txtSDT").val(sSDT);
            $(".modal .chinhanh").val(FK_iMaCN).trigger('change');
        });
    });
</script>
</asp:Content>
