<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Quanlyhoadon.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Quanlyhoadon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Quản lý hóa đơn</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4">
                            <label>Chọn khách hàng</label>
                            <div id="div" runat="server"></div>
                    <hr />

                        </div>
                    </div>
                </div>
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
                                <p>Đơn giá: </p>
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
                            <th><p id="sp" runat="server"></p></th>
                            <th><p><input type="text" class="form-control" value="1" name="txtSoluong" required /></p></th>
                            <th><p><input type="text" class="form-control" readonly name="txtDongia" required /></p></th>
                            <th><p><input type="text" class="form-control" readonly name="txtTongTien" required /></p></th>
                            <th class="text-center"><p><button type="button" name="remove" class="btn btn-danger btn-sm remove"><i class="fa fa-minus-square" aria-hidden="true"></i></button></p></th>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td class="text-center" colspan="6">
                               <button type="submit" name="btnLapHoaDon" value="laphoadon" class="btn btn-primary">Lập hóa đơn</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
         </div>
     </div>
    <script>
        var soluong;
        var dongia;
      function changeSanPham(selectObject) {
                var xhttp;
                if (window.XMLHttpRequest) {
                    xhttp = new XMLHttpRequest();
                } else {
                    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        var data = this.responseText.split("_");
                        soluong = parseInt(data[0]);
                        dongia = parseFloat(data[1]);
                        $(selectObject).parent().parent().parent().find("input[name='txtDongia']").val(dongia);
                        soluong_ol = parseInt($(selectObject).parent().parent().parent().find("input[name='txtSoluong']").val());
                        $(selectObject).parent().parent().parent().find("input[name='txtTongTien']").val(soluong_ol*dongia);
                    }
                };
                var url = window.location.href;
                var masp = selectObject.value;
                var params = "masp=" + masp;
                xhttp.open("GET", url+"?"+params, true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send();
        }
     $(document).ready(function () {
           var html = "";
           
         $(document).on("click", ".add", function () {
                $("#tbody").append("<tr>" + $("#tr").html() + "</tr>");
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
                dongia = parseInt($(this).parent().parent().parent().find("input[name='txtDongia']").val().replace(/\,/g, ''));
                tongtien = soluong * dongia;
                if ($(this).parent().parent().parent().find("input[name='txtDongia']").val() != "") {
                    $(this).parent().parent().parent().find("input[name='txtTongTien']").val(tongtien);
                }
            });
            $(document).on("change", "input[name='txtDongia']", function () {
                soluong = parseInt($(this).parent().parent().parent().find("input[name='txtSoluong']").val());
                dongia = parseInt($(this).val().replace(/\,/g, ''));
                tongtien = soluong * dongia;
                $(this).parent().parent().parent().find("input[name='txtTongTien']").val(tongtien);
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
