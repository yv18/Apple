<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Orders.aspx.cs" Inherits="GroupProjectFinal.Orders" %>

<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

    <style>
        .email {
            margin-top:20px;
        }

    </style>
    <main>
        <div>
            <div>
            <asp:Label ID="emailId" CssClass="btn btn-warning email" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="table table-striped table-bordered" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
        <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
        <asp:BoundField DataField="mobileNumber" HeaderText="Mobile Number" SortExpression="mobileNumber" />
        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
        <asp:BoundField DataField="province" HeaderText="Province" SortExpression="province" />
        <asp:BoundField DataField="postalCode" HeaderText="Postal Code" SortExpression="postalCode" />
        <asp:BoundField DataField="cardNumber" HeaderText="Card Number" SortExpression="cardNumber" />
        <asp:BoundField DataField="cardHolderName" HeaderText="Card Holder Name" SortExpression="cardHolderName" />
        <asp:BoundField DataField="expiryDate" HeaderText="Expiry Date" SortExpression="expiryDate" />
        <asp:BoundField DataField="securityCode" HeaderText="Security Code" SortExpression="securityCode" />
        <asp:BoundField DataField="grandTotal" HeaderText="Grand Total" SortExpression="grandTotal" />
        <asp:BoundField DataField="orderDate" HeaderText="Order Date" SortExpression="orderDate" />
    </Columns>
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Group2Database %>" SelectCommand="SELECT * FROM [Orders] WHERE (([email] = @email) AND ([email] = @email2))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="emailId" DefaultValue="0" Name="email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="emailId" Name="email2" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />


        </div>
      </div>
  </main>
</asp:Content>
