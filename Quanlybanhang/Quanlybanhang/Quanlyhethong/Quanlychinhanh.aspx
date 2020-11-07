<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Quanlychinhanh.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Quanlychinhanh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="row justify-content-md-center">
                <div class="col-md-12">
                    <div class="card mt-3">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Quản lý chi nhánh</h3>
                                </div>
                                <div class="col-md-6 justify-content-md-center">
                                    <button type="button" class="btn btn-primary waves-effect waves-light themCN" data-toggle="modal" data-target=".bs-example-modal-lg">Thêm chi nhánh</button>  
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <asp:GridView ID="grDSCN" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="grDSCN_RowCommand">
                                    <Columns>
                                            <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sTenCN" HeaderText="Tên chi nhánh" />
                                        <asp:BoundField DataField="sDiaChiChiNhanh" HeaderText="Địa chỉ" />
                                        <asp:TemplateField HeaderText="Tác vụ">
                                            <ItemTemplate>
                                                <button type="button" 
                                                    class="btn btn-primary waves-effect waves-light suanhacc" 
                                                    data-toggle="modal" 
                                                    data-target=".bs-example-modal-lg"
                                                    data-macn ="<%#Eval("iMaCN") %>"
                                                    data-tenCN ="<%#Eval("sTenCN") %>"
                                                    data-diachi ="<%#Eval("sDiaChiChiNhanh") %>"
                                                    >Sửa</button>  
                                                <asp:LinkButton ID="btnXoaNhaCC" ToolTip="Xóa" runat="server" CausesValidation="false" CssClass="btn waves-effect waves-light btn-danger" CommandName="xoa" CommandArgument='<%#Eval("iMaCN") %>' OnClientClick="return confirm('Bạn có muốn xóa chi nhánh này không ?');"><i class="fa fa-trash"></i></asp:LinkButton>
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
        </div>
        <div class="modal fade bs-example-modal-lg" style="padding-right: 17px;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myLargeModalLabel">Thêm chi nhánh</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Tên chi nhánh</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtChinhanh" runat="server" CssClass="form-control txtChinhanh"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Địa chỉ chi nhánh</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtDiachi" runat="server" CssClass="form-control txtDiachi"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" style="justify-content:center;">
                                 <asp:TextBox ID="txtMa" runat="server" CssClass="form-control txtMa hide"></asp:TextBox>
                                 <asp:Button ID="themncc" runat="server" CssClass="btn btn-primary capnhat" Text="Thêm" OnClick="themncc_Click" />
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
                $(".themCN").click(function () {
                    $(".txtDC").val("");
                    $(".txtChinhanh").val("");
                    $(".txtDiachi").val("");
                    $(".capnhat").val("Thêm chi nhánh");
                });
                $(".suanhacc").click(function () {
                    macn        = $(this).attr("data-macn");
                    tencn       = $(this).attr("data-tenCN");
                    diachi      = $(this).attr("data-diachi");
                    $(".txtChinhanh").val(tencn);
                    $(".txtDiachi").val(diachi);
                    $(".txtMa").val(macn);
                    $(".capnhat").val("Cập nhật chi nhánh");
                });
            });
        </script>
</asp:Content>
