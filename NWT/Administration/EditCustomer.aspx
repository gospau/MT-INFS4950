<%@ Page Title="EditCustomer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="NWT.EditCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-sm-12 table-responsive">
            <asp:GridView ID="grdCustomer" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataKeyNames="Id" DataSourceID="SqlEditcustomer" OnRowDeleted="grdCustomer_RowDeleted" OnRowUpdated="grdCustomer_RowUpdated" OnPreRender="grdCustomer_PreRender">
                <Columns>
                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridFName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGridFName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Customer first name is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridLName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGridLName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Customer last name is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City" SortExpression="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtGridCity" CssClass="text-danger" Display="Dynamic" ErrorMessage="Customer city is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country" SortExpression="Country">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridCountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGridCountry" CssClass="text-danger" Display="Dynamic" ErrorMessage="Country is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridCPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtGridCPhone" CssClass="text-danger" Display="Dynamic" ErrorMessage="Phone number is required." ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="edit" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confrim ('Are you sure you want to delete this customer?');"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle CssClass="active" />
                <HeaderStyle CssClass="supheader" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlEditcustomer" runat="server" ConnectionString="<%$ ConnectionStrings:NWTConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Customer] ([FirstName], [LastName], [City], [Country], [Phone]) VALUES (@FirstName, @LastName, @City, @Country, @Phone)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [FirstName] = @FirstName, [LastName] = @LastName, [City] = @City, [Country] = @Country, [Phone] = @Phone WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
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

    <%--Add customer--%>

     <div class="row">
        <div class="col-sm-12">
            <p>To add a new product, enter the product information and click Add Product</p>
        </div>
    </div>

    <%-- First name text box --%>
    <div class="form-group">
        <div class="col-sm-2">First Name:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtFName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtFName" ErrorMessage="First name is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Last name text box --%>
    <div class="form-group">
        <div class="col-sm-2">Last Name:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtLName" ErrorMessage="Last name is a required field." 
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

    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Customer" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
        </div>
    </div>

</asp:Content>
