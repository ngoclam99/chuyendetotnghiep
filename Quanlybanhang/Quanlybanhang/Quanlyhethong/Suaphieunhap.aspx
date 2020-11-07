<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Suaphieunhap.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Suaphieunhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Sửa phiếu nhập sản phẩm</h3>
            </div>
            <div class="panel-body">
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
                    <tbody id="tbody" runat="server">
                        
                    </tbody>
                    <tfoot>
                        <tr>
                            <td class="text-center" colspan="6">
                                <asp:TextBox ID="txtMaPN" CssClass="hidden" runat="server"></asp:TextBox>
                               <button type="submit" name="btnCapNhat" value="capnhat" class="btn btn-primary">Cập nhật</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    <div style="display:none;" id="an">
         <p id="div" runat="server"></p>
    </div>
    <input type="hidden" id="tongso" name="tongso" />
     <script>
        $(document).ready(function () {
            var tong = $("tbody > tr").length;
            $("#tongso").val(tong);
            var select = $("#Content_div").html();
            $("#Content_div").remove();
            $(document).on("click", ".add", function () {
               
                tong = tong + 1;
                var html = "";
                html += '<tr id="tr_an">';
                html += '<th><p>'+select+'</p></th>';
                html += '<th><p><input type="text" class="form-control" name="txtSoluong" required /></p></th>';
                html += '<th><p><input type="text" class="form-control" name="txtDongianhap" required /></p></th>';
                html += '<th><p><input type="text" class="form-control" name="txtDongiaban" required /></p></th>';
                html += '<th><p><input type="text" class="form-control" name="txtTongTien" required /></p></th>';
                html += '<th class="text-center"><p><button type="button" name="remove" class="btn btn-danger btn-sm remove"><i class="fa fa-minus-square" aria-hidden="true"></i></button></p></th>';
                html += '</tr>';
                $("table tbody").append(html);
                $("#tongso").val(tong);
            });
            $(document).on("click", ".remove", function () {
                if ($("tbody tr").length > 1) {
                    tong = tong - 1;
                    $("#tongso").val(tong);
                    $(this).parent().parent().parent().remove();
                } else {
                    warning("Không được phép xóa!");
                }
            });
            var tongtien = 0;
            $(document).on("change", "input[name='txtSoluong']", function () {
                soluong = parseInt($(this).val());
                dongia = parseInt($(this).parent().parent().parent().find("input[name='txtDongianhap']").val().replace('.', ''));
                tongtien = soluong * dongia;
                if ($(this).parent().parent().parent().find("input[name='txtDongianhap']").val() != "") {
                    $(this).parent().parent().parent().find("input[name='txtTongTien']").val(tongtien);
                    $(this).parent().parent().parent().find("input[name='txtDongianhap']").val(dongia);
                    $(this).parent().parent().parent().find("input[name='txtDongiaban']").val(dongia + dongia*0.3);
                }
            });
            $(document).on("change", "input[name='txtDongianhap']", function () {
                soluong = parseInt($(this).parent().parent().parent().find("input[name='txtSoluong']").val());
                dongia = parseInt($(this).val().replace('.', ''));
                tongtien = soluong * dongia;
                $(this).parent().parent().parent().find("input[name='txtTongTien']").val(tongtien);
                $(this).parent().parent().parent().find("input[name='txtDongianhap']").val(dongia);
                $(this).parent().parent().parent().find("input[name='txtDongiaban']").val(dongia + dongia*0.3);
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
</asp:Content>
