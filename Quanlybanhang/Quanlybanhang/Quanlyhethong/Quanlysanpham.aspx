<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Quanlysanpham.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Quanlysanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
		<div class="col-xl-12">
			<div class="row justify-content-md-center">
				<div class="col-md-12">
					<div class="card mt-3">
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<h3>Danh sách sản phẩm<a href="Themsanpham.aspx" class="btn btn-primary waves-effect waves-light themCN">Thêm sản phẩm</a></h3>
								</div>
							</div>
							<br />
							<br />
							<div class="row">
                                <table Class="tb-dt table table-responsive table-bordered table_id" id="table">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Đơn giá</th>
                                            <th>Trạng thái</th>
                                            <th>Loại sản phẩm</th>
                                            <th>Nhà cung cấp</th>
                                            <th>Người đăng sản phẩm</th>
                                            <th>Ngày đăng</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody" runat="server">

                                    </tbody>
                                </table>
                                <%-- <asp:GridView ID="dsSP" runat="server" AutoGenerateColumns="false" CssClass="tb-dt table table-responsive table-bordered">
                                    <Columns>
                                            <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sTensp" HeaderText="Tên sản phẩm" />
                                        <asp:BoundField DataField="iSoLuong" HeaderText="Số lượng" />
                                        <asp:BoundField DataField="fDonGia" HeaderText="Đơn giá" />
                                        <asp:BoundField DataField="sTrangThai" HeaderText="Trạng thái" />
                                        <asp:BoundField DataField="sTenLoaiSP" HeaderText="Loại sản phẩm"/>
                                        <asp:BoundField DataField="sTenNhaCC" HeaderText="Nhà cung cấp"/>
                                        <asp:BoundField DataField="sTenNV" HeaderText="Người đăng sản phẩm"/>
                                        <asp:BoundField DataField="sNgayDangSp" HeaderText="Ngày đăng"/>
                                        <asp:BoundField DataField="sMoTa" HeaderText="Mô tả"/>
                                        <asp:BoundField DataField="sXuatSu" HeaderText="Xuất sứ"/>
                                        <asp:BoundField DataField="sTenCN" HeaderText="Chi nhánh"/>
                                        <asp:BoundField DataField="sDiaChiChiNhanh" HeaderText="Địa chỉ Chi nhánh"/>
                                    </Columns>
                                </asp:GridView>--%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
