<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="XemchitietHD.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.XemchitietHD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                        <div class="row">
                        <div class="col-md-6">
                            <h3>Xem chi tiết Hóa đơn</h3>
                        </div>
                        <div class="col-md-6 justify-content-md-center">
                            <asp:Button ID="btnInHoadon" OnClick="btnInHoadon_Click" runat="server" Text="In hóa đơn" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                         <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">STT</th>
                                    <th>Mã hóa đơn</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Tổng tiền</th>
                                </tr>
                            </thead>
                            <tbody id="tbody" runat="server">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#inhoadon").click(function () {
            window.print();
            window.onafterprint = function() {
                window.close();
            };
        });
    </script>
</asp:Content>
