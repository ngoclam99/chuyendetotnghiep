<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Danhsachhoadon.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Danhsachhoadon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                        <div class="row">
                        <div class="col-md-6">
                            <h3>Danh sách hóa đơn</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-bordered table-hover table_id">
                            <thead>
                                <tr>
                                    <th class="text-center">STT</th>
                                    <th>Mã hóa đơn</th>
                                    <th>Thời gian lập</th>
                                    <th>Khách hàng</th>
                                    <th>Người lập</th>
                                    <th>Chi nhánh</th>
                                    <th>Tổng tiền HD</th>
                                    <th class="text-center">Tác vụ</th>
                                </tr>
                            </thead>
                            <tbody id="tbody" runat="server">

                            </tbody>
                            <tfoot>
                                <th colspan="5"></th>
                                <th>Tổng tiền</th>
                                <th><span id="tongtienHDD" runat="server"></span></th>
                                <th></th>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
