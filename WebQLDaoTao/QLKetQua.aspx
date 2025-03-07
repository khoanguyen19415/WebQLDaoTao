<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKetQua.aspx.cs" Inherits="WebQLDaoTao.KetQua" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h5 class="alert alert-success">QUAN LY DIEM</h5>
    <hr />
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2">Chon mon hoc</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlMonHoc" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMonHoc_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <hr />
    <asp:GridView ID="gvKetQua" ShowFooter="true" DataKeyNames="id" runat="server"
        AutoGenerateColumns="false" CssClass="table table-bordered" Width="70%">
        <Columns>
            <asp:BoundField DataField="masv" HeaderText="MA SV" />
            <asp:BoundField DataField="hotensv" HeaderText="Ho ten sinh vien" />
            <asp:TemplateField HeaderText="diem">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("diem") %>' CssClass="form-control"></asp:TextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btLuu" OnClick="btLuu_Click" runat="server" Text="luu diem" CssClass="btn btn-success" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="chon tac vu">
                <ItemTemplate>
                    <asp:CheckBox ID="chkChon" runat="server" CssClass="radio-inline" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="btnXoa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa điểm sinh viên này ra khỏi danh sách?')"
                        runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="btnXoa_Click">xoa</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>

        <HeaderStyle CssClass="bg-primary text-white" />
        <RowStyle CssClass="bg-light" />
        <FooterStyle CssClass="bg-secondary text-white" />

    </asp:GridView>
</asp:Content>
