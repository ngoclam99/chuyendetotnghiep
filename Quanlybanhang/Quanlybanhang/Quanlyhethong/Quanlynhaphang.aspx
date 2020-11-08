<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Quanlynhaphang.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Quanlynhaphang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Quản lý nhập hàng</h3>
            </div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr>
                        <th>
                            <p>Ngày nhập: </p>
                            <p>
                                  <input type="text" class="form-control datepicker" required  id="ngaynhap" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" name="ngaynhap" autocomplete="off">
                            </p>
                        </th>
                        <th>
                           <p>Nhà cung cấp: </p>
                            <p>
                                <asp:DropDownList ID="drNhaCungCap" CssClass="form-control" runat="server"></asp:DropDownList>
                            </p>
                        </th>
                        <th>
                           <p>Chi nhánh: </p>
                            <p>
                                <asp:DropDownList ID="drChiNhanh" CssClass="form-control" runat="server"></asp:DropDownList>
                            </p>
                        </th>
                    </tr>
                </table>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>
                                <p>Tên sản phẩm: </p>
                            </th>
                            <th>
                                <p>Số lượng: </p>
                            </th>
                            <th>
                                <p>Đơn giá nhập: </p>
                            </th>
                            <th>
                                <p>Đơn giá bán: </p>
                            </th>
                            <th>
                                <p>Tổng tiền: </p>
                            </th>
                            <th class="text-center">
                                <p>Tác vụ: <button type="button" name="add" class="btn btn-success btn-sm add"><i class="fa fa-plus-square" aria-hidden="true"></i></button></p>
                            </th>
                        <tr>
                    </thead>
                    <tbody id="tbody">
                        <tr id="tr">
                            <th><p id="div" runat="server"></p></th>
                            <th><p><input type="text" class="form-control" name="txtSoluong" required /></p></th>
                            <th><p><input type="text" class="form-control" name="txtDongianhap" required /></p></th>
                            <th><p><input type="text" class="form-control" name="txtDongiaban" required /></p></th>
                            <th><p><input type="text" class="form-control" name="txtTongTien" required /></p></th>
                            <th class="text-center"><p><button type="button" name="remove" class="btn btn-danger btn-sm remove"><i class="fa fa-minus-square" aria-hidden="true"></i></button></p></th>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td class="text-center" colspan="6">
                               <button type="submit" name="btnCapNhat" value="capnhat" class="btn btn-primary">Cập nhật</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
   
    <script>
        $(document).ready(function () {
            var html = "";
            $(document).on("click", ".add", function () {
               // $('#tr select').addClass('js-example-basic-multiple1');
                $("#tbody").append("<tr>" + $("#tr").html() + "</tr>");
                //$('input[name="txtDongianhap"]').simpleMoneyFormat();
                //$('input[name="txtDongiaban"]').simpleMoneyFormat();
               // $('#tr select').removeClass('js-example-basic-multiple1');
               // thuvien1();
            });
            $(document).on("click", ".remove", function () {
                if ($("#tbody tr").length > 1) {
                    $(this).parent().parent().parent().remove();
                } else {
                    warning("Không được phép xóa!");
                }
            });
            var tongtien = 0;
            $(document).on("change", "input[name='txtSoluong']", function () {
                soluong = parseInt($(this).val());
                dongia = parseInt($(this).parent().parent().parent().find("input[name='txtDongianhap']").val().replace(/\,/g, ''));
                tongtien = soluong * dongia;
                //$(this).parent().parent().parent().find("input[name='txtTongTien']").val(numberWithCommas(tongtien));
                //$(this).parent().parent().parent().find("input[name='txtDongianhap']").val(numberWithCommas(dongia));
                //$(this).parent().parent().parent().find("input[name='txtDongiaban']").val(numberWithCommas(dongia + dongia*0.3));
                });
            $(document).on("change", "input[name='txtDongianhap']", function () {
                soluong = parseInt($(this).parent().parent().parent().find("input[name='txtSoluong']").val());
                dongia = parseInt($(this).val().replace(/\,/g, ''));
                tongtien = soluong * dongia;
                $(this).parent().parent().parent().find("input[name='txtTongTien']").val(numberWithCommas(tongtien));
                $(this).parent().parent().parent().find("input[name='txtDongianhap']").val(numberWithCommas(dongia));
                $(this).parent().parent().parent().find("input[name='txtDongiaban']").val(numberWithCommas(dongia + dongia*0.3));
            });
            
            function thuvien1(){
                $('.js-example-basic-multiple1').select2();
            }
           
            function numberWithCommas(x) {
                var parts = x.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                return parts.join(".");
            }
        });
    </script>
     <script>
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        $(document).ready(function () {
            
        });
        today = dd + '/' + mm+ '/' + yyyy;
        $("#ngaynhap").val(today);
    </script>
</asp:Content>
