<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Danhsachphieunhap.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Danhsachphieunhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="row justify-content-md-center">
                <div class="col-md-12">
                    <div class="card mt-3">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Danh sách phiếu nhập</h3>
                                </div>
                            </div>
                             <div class="row">
                                <table class="table table-bordered table_id">
                                    <thead>
                                        <tr>
                                            <td class="text-center">STT</td>
                                            <td>Mã phiếu nhập</td>
                                            <td>Thời gian</td>
                                            <td >Người lập</td>
                                            <td>Chi nhánh</td>
                                            <td>Nhà cung cấp</td>
                                            <td class="text-center">Tác vụ</td>
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
        </div>
    </div>
    <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Chi tiết phiếu nhập</h4>
              </div>
              <div class="modal-body">
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>

          </div>
        </div>
</asp:Content>
