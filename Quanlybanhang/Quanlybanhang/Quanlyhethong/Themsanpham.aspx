<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Themsanpham.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Themsanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
		<div class="col-xl-12">
			<div class="row justify-content-md-center">
				<div class="col-md-12">
					<div class="card mt-3">
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<h3>Thêm sản phẩm <a href="Quanlysanpham.aspx" class="btn btn-primary">Danh sách sản phẩm</a></h3>
								</div>
							</div>
							<br />
							<br />
                            <div class="row">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Loại sản phẩm: </th>
                                        <th>
                                            <asp:DropDownList ID="drLoaiSP" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <button type="button" 
                                                class="btn btn-primary waves-effect waves-light themloaisp" 
                                                data-toggle="modal" 
                                                data-target=".bs-example-modal-lg"
                                                style="margin-top:5px;"
                                                >
                                                Thêm loại sản phẩm</button>  
                                        </th>
                                        <th>Tên sản phẩm</th>
                                        <th><input type="text" class="form-control" ID="txtSanPham" runat="server" />
                                            <%--<asp:RequiredFieldValidator 
                                            ID="rqtxtSanPham" 
                                            runat="server" 
                                            ControlToValidate="txtSanPham"
                                            CssClass="float-right badge badge-pink mt-2"
                                            ErrorMessage="Tên sản phẩm không được để trống">
                                        </asp:RequiredFieldValidator>--%>
                                        </th>
                                        
                                    </tr>
                                    <tr>
                                        <th> Số lượng: </th>
                                        <th><input type="text" class="form-control txtSoLuong" id="txtSoLuong" runat="server" />
                                            <%--<asp:RequiredFieldValidator 
                                            ID="rqtxtSoLuong" 
                                            runat="server" 
                                            ControlToValidate="txtSoLuong"
                                            CssClass="float-right badge badge-pink mt-2"
                                            ErrorMessage="Số lượng không được để trống">
                                        </asp:RequiredFieldValidator>--%>

                                        </th>
                                        <th> Đơn giá:</th>
                                        <th><input type="text" class="form-control txtDonGia" id="txtDonGia" runat="server" />
                                           <%-- <asp:RequiredFieldValidator 
                                            ID="RequiredFieldValidator3" 
                                            runat="server" 
                                            ControlToValidate="txtDonGia"
                                            CssClass="float-right badge badge-pink mt-2"
                                            ErrorMessage="Đơn giá không được để trống">
                                        </asp:RequiredFieldValidator>--%>
                                        </th>
                                    </tr>
                                        <tr>
                                        <th colspan="2"></th>
                                        <th>Tổng tiền:</th>
                                        <th>
                                            <p><input type="text" class="form-control txtTongTien" runat="server" ID="txtTongTien" disabled/></p>
                                        </th>
                                    </tr>
                                        <tr>
                                            <th> Nhà cung cấp: </th>
                                            <th>
                                                <asp:DropDownList ID="drNhacc" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </th>
                                            <th>Ngày đăng sản phẩm:</th>
                                            <th><input type="text" class="form-control" ID="txtNgayDang" runat="server" disabled /></th>
                                    </tr>
                                    <tr>
                                        <th>Chi nhánh:</th>
                                        <th>
                                            <asp:DropDownList ID="drChiNhanh" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </th>
                                        <th>Xuất sứ:</th>
                                        <th>
                                            <input type="text" class="form-control" id="txtXuatSu" runat="server" />
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            Mô tả:
                                        </th>
                                        <td colspan="3"><textarea class="form-control" id="txtMoTa" runat="server" rows="10"></textarea></td>
                                    </tr>
                                     <tr>
                                        <th>
                                            Hình ảnh sản phẩm:
                                        </th>
                                        <td colspan="3">
                                            <asp:FileUpload ID="AnhSP" runat="server" CssClass="input-file"  data-ariginal-title="Chọn ảnh avata" AllowMultiple  accept=".jpg,.png, .jpeg" />
                                            <div class="col-md-12 hienthi_anh" id="hienthi_anh" runat="server">
                                                <img src="Thuvien/img/image_upload.png" class="avtata"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="text-center">
                                            <asp:Button ID="btnThemSP" CssClass="btn btn-primary"  runat="server" Text="Thêm sản phẩm" OnClick="btnThemSP_Click" />
                                        </td>
                                    </tr>
                                </table>
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
                        <h5 class="modal-title" id="myLargeModalLabel">Thêm loại sản phẩm</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Tên loại sản phẩm</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtLoaiSP" runat="server" CssClass="form-control txtLoaiSP"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:GridView ID="dsLoaiSP" runat="server" AutoGenerateColumns="false" cssClass="table table-bordered" OnRowCommand="dsLoaiSP_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sTenLoaiSP" HeaderText="Tên loại sản phẩm" />
                                        <asp:TemplateField HeaderText="Tác vụ">
                                            <ItemTemplate>
                                                <button type="button" 
                                                    class="btn btn-primary waves-effect waves-light sualoaisp" 
                                                    data-sLoaiSP="<%#Eval("sLoaiSP") %>"
                                                    data-sTenLoaiSP="<%#Eval("sTenLoaiSP") %>"
                                                    >Sửa</button>  
                                                <asp:LinkButton ID="btnLoaiSP" 
                                                    ToolTip="Xóa" runat="server" 
                                                    CausesValidation="false" 
                                                    CssClass="btn waves-effect waves-light btn-danger" 
                                                    CommandName="xoa" 
                                                    CommandArgument='<%#Eval("sLoaiSP") %>' 
                                                    OnClientClick="return confirm('Bạn có muốn xóa loại sản phẩm này không ?');"><i class="fas fa-trash"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="form-group row justify-content-md-center">
                                <asp:TextBox ID="txtMa" runat="server" CssClass="form-control txtMa hide"></asp:TextBox>
                                <asp:Button ID="btnThemLoaiSP" runat="server" CssClass="btn btn-primary capnhat" Text="Thêm" OnClick="btnThemLoaiSP_Click" />
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
                $(".modal .txtMa").val("");
                $(".capnhat").val("Thêm");
            });
            $(".sualoaisp").click(function () {
                maloai       = $(this).attr("data-sLoaiSP");
                tenloai      = $(this).attr("data-sTenLoaiSP");
                $(".modal .txtLoaiSP").val(tenloai);
                $(".modal .txtMa").val(maloai);
                $(".capnhat").val("Cập nhật");
                $(".modal").attr("style", "display: block; padding-right: 17px;");
            });
            var soluong = 0;
            var tongtien = 0;
            $(".txtSoLuong").on("change", function () {
                soluong = parseInt($(".txtSoLuong").val());
                if ($(".txtDonGia").val() != "") {
                     var dongia = parseInt($(".txtDonGia").val());
                    $(".txtTongTien").val(soluong * dongia);
                    $(".txtTongTien").simpleMoneyFormat();
                }
               
            });
            $(".txtDonGia").on("change", function () {
                soluong = parseInt($(".txtSoLuong").val());
                dongia = parseInt($(".txtDonGia").val()); 
                if ($(".txtSoLuong").val() != "") {
                    $(".txtTongTien").val(soluong * dongia);
                    $(".txtTongTien").simpleMoneyFormat();
                }
            });
        });
    </script>
    <script>
       function handleFileSelect(event) {
            //Check File API support
                if (window.File && window.FileList && window.FileReader) {

                    var files = event.target.files; //FileList object
                    var output = document.getElementById("result");
                    $("#hienthi_anh").html("");
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        //Only pics
                        if (!file.type.match('image')) continue;

                        var picReader = new FileReader();
                        picReader.addEventListener("load", function (event) {
                            var picFile = event.target;
                            var html  = '';
                            html += "<img class='anh anh1' src='" + picFile.result + "'" + "title='" + file.name + "'/>";
                            $(".hienthi_anh").append(html);
                        });
                        //Read the image
                        picReader.readAsDataURL(file);
                    }
                } else {
                    console.log("Your browser does not support File API");
                }
        }

        $(".input-file").change(function (event) {
            handleFileSelect(event);
        });
       
    </script>    
</asp:Content>
