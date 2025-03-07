﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h3>Giao diện trang quản lý khoa</h3>
     
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm khoa</button>
    
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm khoa</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="txtMaMH" class="col-sm-2 col-form-label">Mã khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaKH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtTenMon" class="col-sm-2 col-form-label">Tên khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txttenMH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                   
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btXuLy" OnClick="btXuLy_Click" runat="server" Text="Lưu" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
     <asp:GridView ID="gvKhoa" runat="server" AutoGenerateColumns="False" CssClass="table table-border table-hover" DataSourceID="odsKhoa"
         AllowPaging="True" PageSize="5" DataKeyNames="MaKH">
         <Columns>
             <asp:BoundField DataField="MaKH" HeaderText="MaKH" ReadOnly="true" SortExpression="MaKH"/>
             <asp:BoundField DataField="TenKh" HeaderText="TenKh" SortExpression="TenKh" />
             <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Sửa"
                    ShowDeleteButton="true" DeleteText="Xóa" />
         </Columns>
         <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
         <HeaderStyle BackColor="#003399" ForeColor="#ffffff" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsKhoa" runat="server"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.KhoaDAO"
        DataObjectTypeName="WebQLDaoTao.Models.Khoa" 
        UpdateMethod="Update"
        DeleteMethod="Delete"
        InsertMethod="Insert">
    </asp:ObjectDataSource>
</asp:Content>
