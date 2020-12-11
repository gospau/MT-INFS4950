<%@ Page Title="EditSupplier" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditSupplier.aspx.cs" Inherits="NWT.EditSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12 table-responsive">
            <asp:GridView ID="grdSupplier" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" runat="server" DataKeyNames="Id" DataSourceID="SqlEditsupplier" OnRowDeleted="grdSupplier_RowDeleted" OnRowUpdated="grdSupplier_RowUpdated" OnPreRender="grdSupplier_PreRender">
                <Columns>
                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company Name" SortExpression="CompanyName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridCompanyname" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGridCompanyname" CssClass="text-danger" Display="Dynamic" ErrorMessage="Company name is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Name" SortExpression="ContactName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridContact" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGridContact" CssClass="text-danger" Display="Dynamic" ErrorMessage="Contact name is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City" SortExpression="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtGridCity" CssClass="text-danger" Display="Dynamic" ErrorMessage="City is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country" SortExpression="Country">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridCountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGridCountry" CssClass="text-danger" Display="Dynamic" ErrorMessage="Country is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridphone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtGridphone" CssClass="text-danger" Display="Dynamic" ErrorMessage="Phone number is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fax" SortExpression="Fax">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Fax") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="edit" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm ('Are you sure you want to delete this supplier?');" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle CssClass="active" />
                <HeaderStyle CssClass="supheader" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlEditsupplier" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" DeleteCommand="DELETE FROM [Supplier] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Supplier] ([CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (@CompanyName, @ContactName, @ContactTitle, @City, @Country, @Phone, @Fax)" SelectCommand="SELECT * FROM [Supplier]" UpdateCommand="UPDATE [Supplier] SET [CompanyName] = @CompanyName, [ContactName] = @ContactName, [ContactTitle] = @ContactTitle, [City] = @City, [Country] = @Country, [Phone] = @Phone, [Fax] = @Fax WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="ContactTitle" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Fax" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="ContactTitle" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Fax" Type="String" />
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

    <%--add supplier--%>

     <div class="row">
        <div class="col-sm-12">
            <p>To add a new product, enter the product information and click Add Product</p>
        </div>
    </div>

    

    <%-- Company Name text box --%>
    <div class="form-group">
        <div class="col-sm-2">Company Name:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtCompanyName" ErrorMessage="Company name is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Contact Name text box --%>
    <div class="form-group">
        <div class="col-sm-2">Contact Name:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtContactName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtContactName" ErrorMessage="Contact name is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>


    <%-- City text box --%>
    <div class="form-group">
        <div class="col-sm-2">City:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtCity" ErrorMessage="City is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Country text box --%>
    <div class="form-group">
        <div class="col-sm-2">Country:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtCountry" ErrorMessage="Country is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Phone text box --%>
    <div class="form-group">
        <div class="col-sm-2">Phone:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtPhone" ErrorMessage="Phone is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Fax text box --%>
    <div class="form-group">
        <div class="col-sm-2">Fax:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtFax" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Supplier" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
        </div>
    </div>

</asp:Content>
