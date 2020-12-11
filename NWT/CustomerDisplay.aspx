<%@ Page Title="CustomerDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="NWT.CustomerDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-8 col-sm-5">
            Select A Country:<br />
            <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="True" DataSourceID="SqlCountry" DataTextField="Country" DataValueField="Country"></asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlCountry" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" SelectCommand="SELECT DISTINCT [Country] FROM [Customer]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <asp:SqlDataSource ID="SqlCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Customer] WHERE ([Country] = @Country) ORDER BY [LastName]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCustomer" Name="Country" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlCustomer" CssClass="table table-bordered table-condensed" DataKeyField="Id">
                <HeaderStyle CssClass="supheader" />
                <HeaderTemplate>
                    <span class="col-xs-3">Firstname</span>
                    <span class="col-xs-3">Lastname</span>
                    <span class="col-xs-2">City</span>
                    <span class="col-xs-2">Phone</span>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' CssClass="col-xs-3" />
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' CssClass="col-xs-3" />
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' CssClass="col-xs-2" />
                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' CssClass="col-xs-2" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>


</asp:Content>
