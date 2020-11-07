<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="BaocaothongkeHoaDon.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.BaocaothongkeHoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                        <div class="row">
                        <div class="col-md-6">
                            <h3>Báo cáo thống kê hóa đơn theo thời gian</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                      <div class="col-md-2">
                         <label>Chọn ngày lập</label>
                         <input type="text" class="form-control datepicker ngaylap" required  data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" name="ngaylap" autocomplete="off">
                      </div>
                      <div class="col-md-3">
                        <label>Chọn chi nhánh</label>
                          <div id="div" runat="server"></div>
                       
                      </div>
                      <div class="col-md-1">
                          <label>Chức năng</label>
                           <button class="btn btn-primary btnLoc" name="btnLoc" value="loc" type="submit">Lọc dữ liệu
                           </button>
                      </div>
                     <div class="col-md-6">
                         <table class="table table-bordered table_id">
                             <thead>
                                 <tr>
                                     <th class="text-center">STT</th>
                                     <th>Chi nhánh</th>
                                     <th>Số Hóa đơn</th>
                                     <th>Thời gian lập</th>
                                     <th>Tổng tiền hóa đơn</th>
                                 </tr>
                             </thead>
                             <tbody id="tbody" runat="server">

                             </tbody>
                             <tfoot>
                                 <th colspan="3"> <p runat="server" id="diachiCN"></p></th>
                                 <th>Tổng tiền</th>
                                 <th> <span id="tongtien" runat="server"></span></th>
                             </tfoot>
                         </table>
                     </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="Tenchinhanh" runat="server" value="" />
    <script>
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        $(document).ready(function () {
            
        });
        today = dd + '/' + mm+ '/' + yyyy;
        $(".ngaylap").val(today);
    </script>
</asp:Content>
