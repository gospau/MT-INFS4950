<%@ Page Title="EditProduct" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="NWT.EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12 table-responsive">
            <asp:GridView ID="grdProduct" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed " runat="server" DataKeyNames="Id" DataSourceID="SqlProduct" OnRowDeleted="grdProduct_RowDeleted" OnRowUpdated="grdProduct_RowUpdated" OnPreRender="grdProduct_PreRender">
                <Columns>
                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridPName" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGridPName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name is requried" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Price" SortExpression="UnitPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridUnitPrice" runat="server" Text='<%# Bind("UnitPrice", "{0:C}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGridUnitPrice" CssClass="text-danger" Display="Dynamic" ErrorMessage="Unit price is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtGridUnitPrice" CssClass="text-danger" Display="Dynamic" ErrorMessage="Unit price must be in currency of (00.00) fromat." Operator="DataTypeCheck" Type="Currency" ValidationGroup="edit">*</asp:CompareValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("UnitPrice", "{0:C2}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Package" SortExpression="Package">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtGridPackage" runat="server" Text='<%# Bind("Package") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtGridPackage" CssClass="text-danger" Display="Dynamic" ErrorMessage="Package is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Package") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SupplierId" SortExpression="SupplierId">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridSupplierID" runat="server" Text='<%# Bind("SupplierId") %>'></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtGridSupplierID" CssClass="text-danger" Display="Dynamic" ErrorMessage="SupplierID must be numeric" Operator="DataTypeCheck" Type="Integer" ValidationGroup="edit">*</asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtGridSupplierID" CssClass="text-danger" Display="Dynamic" ErrorMessage="SupplierID is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("SupplierId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Is Discontinued" SortExpression="IsDiscontinued">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsDiscontinued") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsDiscontinued") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="edit" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delet this product?');" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <EditRowStyle CssClass="active" />
                <HeaderStyle CssClass="supheader" />

            </asp:GridView>

            <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Product] ([ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (@ProductName, @SupplierId, @UnitPrice, @Package, @IsDiscontinued)" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [ProductName] = @ProductName, [SupplierId] = @SupplierId, [UnitPrice] = @UnitPrice, [Package] = @Package, [IsDiscontinued] = @IsDiscontinued WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Package" Type="String" />
                    <asp:Parameter Name="IsDiscontinued" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Package" Type="String" />
                    <asp:Parameter Name="IsDiscontinued" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" HeaderText="Please correct the following errors." ValidationGroup="edit" />
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false"></asp:Label>
        </div>
    </div>

    <%-- Unit Price --%>

    <div class="row">
        <div class="col-sm-12">
            <p>To add a new product, enter the product information and click Add Product</p>
        </div>
    </div>


    <%-- Package --%>
    <div class="form-group">
        <div class="col-sm-2">Product Name:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtProductName" ErrorMessage="Product Name is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-2">Unit Price:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control">$00.00</asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtUnitPrice" ErrorMessage="Unit price is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ControlToValidate="txtUnitPrice" ErrorMessage="Unit price must be in (00.00) format" 
                Display="Dynamic" CssClass="text-danger" 
                Operator="DataTypeCheck" Type="Currency" ValidationGroup="Add"></asp:CompareValidator>
        </div>
    </div>

    <%-- Package --%>
    <div class="form-group">
        <div class="col-sm-2">Package:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtPackage" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtPackage" ErrorMessage="Package is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2">IsDiscountined:</div>
        <div class="col-sm-3">
            <asp:Checkbox ID="cbIsdis" runat="server" CssClass="form-control"></asp:Checkbox>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-2">SupplierID:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtSupplierID" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtSupplierID" ErrorMessage="SupplierID is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ControlToValidate="txtSupplierID" ErrorMessage="SupplierID must be numeric and valid" 
                Display="Dynamic" CssClass="text-danger" 
                Operator="DataTypeCheck" Type="Integer" ValidationGroup="Add"></asp:CompareValidator>
        </div>
    </div>


    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Product" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
        </div>
    </div>

</asp:Content>
