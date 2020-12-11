<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="NWT.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-group">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [ID]"></asp:SqlDataSource>
            <asp:DataList ID="dlProduct" runat="server" DataKeyField="Id" DataSourceID="SqlProduct" CssClass="table table-bordered table-condensed">
                <HeaderStyle CssClass="supheader" />
                <HeaderTemplate>
                    <span class="col-xs-1">ID</span>
                    <span class="col-xs-4">Product Name</span>
                    <span class="col-xs-2">Unit Price</span>
                    <span class="col-xs-3">Package</span>
                    <span class="col-xs-2">Continued?</span>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' CssClass="col-xs-1" />
                    <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' CssClass="col-xs-4" />
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' CssClass="col-xs-2" />
                    <asp:Label ID="PackageLabel" runat="server" Text='<%# Eval("Package") %>' CssClass="col-xs-3" />
                    <asp:Label ID="IsDiscontinuedLabel" runat="server" Text='<%# Eval("IsDiscontinued") %>' CssClass="col-xs-2" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
