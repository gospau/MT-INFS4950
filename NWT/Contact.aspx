<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="NWT.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="col-sm-offset-1">How to contact us </h3>
     <%--Row 1 - Heading--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-11">
            <p>
                If you ever have any questions or comment about our product,
                <br />
                please be sure to contact us by phone or email.
            </p>
        </div>
    </div>

    <%--Row 2 - Phone--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Phone:</div>
        <div class="col-sm-9">
            1-800-555-0400<br />
            Weekdays, 8 to 5 Central Time
        </div>
    </div>

    <%--Row 3 - Email--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Email:</div>
        <div class="col-sm-9">
            <a href="mailto:northwind@northwindco.com">northwind@northwindco.com</a>
        </div>
    </div>

    <%--Row 4 - Address--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Address:</div>
        <div class="col-sm-9">
            North Wind, Inc.<br />
            2000 North Street <br />
            Nashville, TN 37211
        </div>
    </div>


    </asp:Content>
