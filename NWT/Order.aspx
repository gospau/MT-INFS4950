<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="NWT.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row">
        <div class="col-xs-8 col-sm-5">
            Select A Country:<br />
            <asp:DropDownList ID="ddlOrderCountry" runat="server" AutoPostBack="True" DataSourceID="SqlOrderCountry" DataTextField="Country" DataValueField="Country">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlOrderCountry" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" SelectCommand="SELECT DISTINCT [Country] FROM [Customer]"></asp:SqlDataSource>
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <asp:SqlDataSource ID="SqlOrder" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" SelectCommand="SELECT DISTINCT [Order].OrderDate, [Order].OrderNumber, OrderItem.Quantity, OrderItem.UnitPrice, ( OrderItem.Quantity * OrderItem.UnitPrice) as Total
FROM [Order] INNER JOIN OrderItem ON [Order].Id = OrderItem.OrderId AND [Order].Id = OrderItem.OrderId INNER JOIN Customer ON [Order].CustomerId = Customer.Id 
WHERE (Customer.Country = @Country) 
ORDER BY [Order].OrderNumber">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlOrderCountry" Name="Country" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlOrder" CssClass="table table-bordered table-condensed">
                <HeaderStyle CssClass="supheader" />
                <HeaderTemplate>
                    <span class="col-xs-3">Order Date</span>
                    <span class="col-xs-3">Order Number</span>
                    <span class="col-xs-2">Quantity</span>
                    <span class="col-xs-2">Unit Price</span>
                    <span class="col-xs-2">Total Amount</span>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate", "{0:d}") %>' CssClass="col-xs-3" />
                    <asp:Label ID="OrderNumberLabel" runat="server" Text='<%# Eval("OrderNumber") %>' CssClass="col-xs-3" />
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' CssClass="col-xs-2" />
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>' CssClass="col-xs-2" />
                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total", "{0:C}") %>' CssClass="col-xs-2" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</asp:Content>
