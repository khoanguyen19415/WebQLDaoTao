﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhvien.aspx.cs" Inherits="WebQLDaoTao.QLSinhvien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>TRANG QUẢN LÝ SINH VIÊN</h2>
    <asp:ObjectDataSource ID="odsSinhVien" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="masv" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="masv" Type="String" />
            <asp:Parameter Name="hosv" Type="String" />
            <asp:Parameter Name="tensv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="Boolean" />
            <asp:Parameter Name="ngaysinh" Type="DateTime" />
            <asp:Parameter Name="noisinh" Type="String" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="makh" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="masv" Type="String" />
            <asp:Parameter Name="hosv" Type="String" />
            <asp:Parameter Name="tensv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="Boolean" />
            <asp:Parameter Name="ngaysinh" Type="DateTime" />
            <asp:Parameter Name="noisinh" Type="String" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="makh" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="gvSinhVien" runat="server" AllowPaging="True" DataSourceID="odsSinhVien" CssClass="table"
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
        Width="1000px" RowStyle-Wrap="false" AutoGenerateColumns="False" DataKeyNames="Masv" OnRowUpdating="gvSinhVien_RowUpdating">
        <Columns>
            <asp:BoundField DataField="masv" HeaderText="Mã SV" ReadOnly="True" />
            <asp:BoundField DataField="hosv" HeaderText="Họ SV" />
            <asp:BoundField DataField="tensv" HeaderText="Tên SV" />
            <asp:TemplateField HeaderText="Giới tính">
                <ItemTemplate>
                    <asp:Label ID="lbGioiTinh" runat="server" Text='<%# Convert.ToBoolean(Eval("gioitinh")) ? "Nam" : "Nữ" %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="cbGioiTinh" runat="server" Checked='<%# Convert.ToBoolean(Eval("gioitinh")) %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ngaysinh" HeaderText="Ngày sinh" />
            <asp:BoundField DataField="noisinh" HeaderText="Nơi sinh" />
            <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="makh" HeaderText="Mã khoa" />
            <asp:TemplateField HeaderText="Thao tác" ItemStyle-Width="250px">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-success">
    <i class="bi bi-pencil-square"></i> Sửa
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnDelete" OnClientClick="return confirm('Bạn có chắc muốn xóa sinh viên này?')"
                        runat="server" Text="Xóa" CommandName="Delete" CssClass="btn btn-danger">
    <i class="bi bi-trash"></i> Xóa
                    </asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CommandName="Update" CssClass="btn btn-primary" />
                    <asp:Button ID="btnCancel" runat="server" Text="Hủy" CommandName="Cancel" CssClass="btn btn-warning" />
                </EditItemTemplate>

                <ItemStyle Width="250px"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" Font-Size="Large"
            HorizontalAlign="Center" VerticalAlign="Middle" CssClass="paging" />

        <RowStyle Wrap="False"></RowStyle>
    </asp:GridView>
</asp:Content>
