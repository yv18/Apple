<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Cart.aspx.cs" Inherits="GroupProjectFinal.Cart" %>
<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <style>
         body {
     display: flex;
     flex-direction: column;
     min-height: 100vh;
 }
 form{
     margin-bottom: 35vh;
 }

 .container,h1 {
     text-align: center;
     flex-grow: 1;
     display: flex;
     flex-direction: column;
     align-items: center;
 }

 h1 {
     font-size: 42px;
     font-weight: bold;
     margin-bottom: 30px;
     margin-top:20px;
     color: #333;
     text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
 }

 .cart-item {
     background-color: #f5f5f5;
     padding: 10px;
     margin: 10px 0;
     border-radius: 5px;
     width: 80%;
     display: flex;
     justify-content: space-between;
     align-items: center;
     font-size: 20px;  
     font-weight: bold; 
 }

 .delete-btn {
     margin-left: 10px;
 }

 .total-section {
     font-size: 24px;
     font-weight: bold;
     background-color: #e9ecef;
     padding: 15px;
     border-radius: 10px;
     margin-top: 20px;
     color: green;
     width: 80%;
     text-align: center;
 }

 .empty-cart-message {
     margin-top: 20px;
     font-size: 18px;
 }

 .btn-group {
     margin-top: 20px;
     display: flex;
     justify-content: space-between;
     width: 80%;
 }

 .btn-clear-cart, .btn-checkout {
     flex-grow: 1;
     margin: 0 5px;
     font-size: 20px;
 }

 .btn-checkout {
     color: white;
 }

 .btn-checkout:hover {
     background-color: darkblue;
     border-color: blue;
     color: white;
 }

 .btn-checkout-empty {
     background-color: grey;
 }

 .btn-checkout {
     background-color: green;
     border-color: green;
 }
    </style>

    <main>
        <div>
            <h1>Your Cart</h1>
            <div class="container">
    <!--Cart with Individual delete button -->
    <asp:Repeater ID="rptCartItems" runat="server">
        <ItemTemplate>
            <div class="cart-item">
                <span><%# Container.DataItem %></span>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm delete-btn" OnClick="btnDelete_Click" CommandArgument='<%# Container.ItemIndex %>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <!-- Empty cart message -->
    <div class="empty-cart-message">
        <asp:Label ID="lblEmptyCartMessage" runat="server" Visible="False">Your cart is empty.</asp:Label>
    </div>

    <!-- Total display and Clear cart button -->
    <div class="total-section">
        <asp:Label ID="totaltext" runat="server"></asp:Label>
    </div>

    <!-- Clear cart and Checkout buttons -->
    <div class="btn-group">
        <asp:Button ID="btnClearCart" runat="server" Text="Clear Cart" CssClass="btn btn-danger" OnClick="btnClearCart_Click" />
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-checkout" OnClick="btnCheckout_Click" />
    </div>
</div>

        </div>
    </main>

</asp:Content>

