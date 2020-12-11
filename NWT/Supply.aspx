<%@ Page Title="Supply" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Supply.aspx.cs" Inherits="NWT.Supply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-8 col-sm-5">
            Select A Country:<br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlSupCountry" DataTextField="Country" DataValueField="Country" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlSupply" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Supplier] WHERE ([Country] = @Country) ORDER BY [CompanyName]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Country" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <asp:SqlDataSource ID="SqlSupCountry" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" SelectCommand="SELECT DISTINCT [Country] FROM [Supplier]" OnSelecting="SqlProduct_Selecting">
            </asp:SqlDataSource>
            <asp:DataList ID="dlProduct" runat="server" DataSourceID="SqlSupply" CssClass="table table-bordered table-condensed" DataKeyField="Id">
                <HeaderStyle CssClass="supheader" />
                <HeaderTemplate>
                    <div class="row">
                        <span class="col-sm-4">Company Name</span>
                        <span class="col-sm-3">Contact Name</span>
                        <span class="col-sm-3">City</span>
                        <span class="col-sm-2">Phone</span>
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' CssClass="col-sm-4" />
                    <asp:Label ID="ContactNameLabel" runat="server" Text='<%# Eval("ContactName") %>' CssClass="col-sm-3" />
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' CssClass="col-sm-3" />
                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' CssClass="col-sm-2" />
                </ItemTemplate>
                <AlternatingItemStyle CssClass="active" />
            </asp:DataList>
        </div>
    </div>
</asp:Content>
