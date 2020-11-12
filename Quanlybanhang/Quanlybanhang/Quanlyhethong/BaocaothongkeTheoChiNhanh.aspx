<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="BaocaothongkeTheoChiNhanh.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.BaocaothongkeTheoChiNhanh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                        <div class="row">
                        <div class="col-md-6">
                            <h3>Báo cáo thống kê hóa tổng tất cả chi nhánh</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                     <div class="col-md-2">
                         <label>Chọn ngày lập</label>
                         <input type="text" class="form-control datepicker ngaylap" required  data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" name="ngaylap" autocomplete="off">
                     </div>
                     <div class="col-md-2">
                          <label>Chức năng</label><br />
                           <button class="btn btn-primary btnLoc" name="btnLoc" value="loc" type="submit">Lọc dữ liệu
                           </button>
                      </div>
                     <div class="col-md-8">
                         <table class="table table-bordered table_id">
                             <thead>
                                 <tr>
                                     <th class="text-center">STT</th>
                                     <th>Chi nhánh</th>
                                     <th>Địa chỉ</th>
                                     <th>Tổng tiền</th>
                                 </tr>
                             </thead>
                             <tbody id="tbody" runat="server">

                             </tbody>
                             <tfoot>
                                 <th colspan="2">
                                     <p id="thoigian" runat="server"></p> <span id="ngaychon" runat="server" style="display:none"></span></th>
                                 <th>Tổng tiền</th>
                                 <th> <span id="tongtien" runat="server"></span></th>
                             </tfoot>
                         </table>
                     </div>
                </div>
            </div>
        </div>
    </div>
     <script>
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        today = dd + '/' + mm+ '/' + yyyy;
           $(".ngaylap").val($("#Content_ngaychon").text());
    </script>
</asp:Content>
