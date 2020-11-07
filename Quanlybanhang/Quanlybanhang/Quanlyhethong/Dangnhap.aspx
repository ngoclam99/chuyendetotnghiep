<%@ Page Title="" Language="C#" MasterPageFile="~/Quanlyhethong/Layout.Master" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="Quanlybanhang.Quanlyhethong.Dangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link rel="stylesheet" type="text/css" href="Thuvien/css/login.css">
     <div class="bacground animated  "> </div>
    <div class="container animated ct-login">
        <div class="row">
            <div class="col-lg-5 col-lg-offset-3">
                <div class="panel panel-primary p-r">
                    <div class="panel-heading text-center">
                        <img src="Thuvien/img/logodki_on.png" alt="logo" width="170" height="110" class="logo-img">
                        <span class="splash-description"><h4 >Hệ thống quản lý cửa hàng bán lẻ</h5></span>
                        <hr>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Tên đăng nhập:</label>
                            <input type="text" class="form-control" name="taikhoan" placeholder="Tên đăng nhập..." ID="txtDangnhap" runat="server" required="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Mật khẩu:</label>
                            <input type="password" class="form-control" name="matkhau" placeholder="Mật khẩu" required="" runat="server" id="txtPass">
                        </div>
                        <div class="form-group text-center">
                            <asp:Button ID="btndangnhap" runat="server" OnClick="btndangnhap_Click" CssClass="btn btn-primary" Text="Đăng nhập" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .col-lg-offset-3 {
            margin-left: 30%;
        }
        .content{
            padding:0;
            margin-bottom:50px;
            background: #ececec40;
            border:none;
        }
    </style>
</asp:Content>
