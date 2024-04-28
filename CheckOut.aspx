<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CheckOut.aspx.cs" Inherits="GroupProjectFinal.CheckOut" %>
<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
 

    <main>

        <div>
             <div class="container mt-2">
     <h1 class="text-center mb-4">Checkout Form</h1>

     <h3 id="total" runat="server" class="text-center text-success fw-bold">Grand Total : $</h3>
     <h3 class="text-center my-2 mt-5">Personal Details</h3>
         <div class="container">
         <div class="row mb-3">
             <div class="col">
                 <label for="txtFirstName" class="form-label">First Name</label>
                 <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                 <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." Display="Dynamic" CssClass="text-danger" />
             </div>
             <div class="col">
                 <label for="txtLastName" class="form-label">Last Name</label>
                 <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                 <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." Display="Dynamic" CssClass="text-danger" />
             </div>
         </div>
         <div class="row mb-3">
             <div class="col">
                 <label for="txtMobileNumber" class="form-label">Mobile Number</label>
                 <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" TextMode="Number" />
                 <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Mobile Number is required." Display="Dynamic" CssClass="text-danger" />
                 <asp:RegularExpressionValidator ID="regmobile" runat="server" ErrorMessage="Enter 10 digit number." ControlToValidate="txtMobileNumber" ValidationExpression="^\d{10}$" CssClass="text-danger"></asp:RegularExpressionValidator>
             </div>
             <div class="col">
                 <label for="txtEmail" class="form-label">Email</label>
                 <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control " ReadOnly="True" />
                 <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." Display="Dynamic" CssClass="text-danger" />
                 <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format." Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger" />
             </div>
         </div>


         <h3 class="text-center my-2 mt-5">Shipping Details</h3>
         <div class="mb-3">
             <label for="txtAddress" class="form-label">Address</label>
             <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control " />
             <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." Display="Dynamic" CssClass="text-danger" />
         </div>
         <div class="row mb-3">
             <div class="col">
                 <label for="txtCity" class="form-label">City</label>
                 <asp:TextBox ID="txtCity" runat="server" CssClass="form-control " />
                 <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required." Display="Dynamic" CssClass="text-danger" />
             </div>
             <div class="col">
                 <label for="txtProvince" class="form-label">Province</label>
                 <asp:TextBox ID="txtProvince" runat="server" CssClass="form-control" />
                 <asp:RequiredFieldValidator ID="rfvProvince" runat="server" ControlToValidate="txtProvince" ErrorMessage="Province is required." Display="Dynamic" CssClass="text-danger" />
             </div>
         </div>
         <div class="row mb-3">
             <div class="col">
                 <label for="ddlCountry" class="form-label">Country</label>
                 <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control ">
                     <asp:ListItem Text="--Select Country--" Value="" />
                     <asp:ListItem Text="USA" Value="USA" />
                     <asp:ListItem Text="Canada" Value="Canada" />
                     <asp:ListItem Text="UK" Value="UK" />
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Country is required." Display="Dynamic" CssClass="text-danger" />
             </div>
             <div class="col">
                 <label for="txtPostalCode" class="form-label">Postal Code</label>
                 <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" />
                 <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Postal Code is required." Display="Dynamic" CssClass="text-danger" />
             </div>
         </div>

         <h3 class="text-center my-2 mt-5">Payment Details</h3>
         <div class="row mb-3">
             <div class="col">
                 <label for="txtCardNumber" class="form-label">Card Number</label>
                 <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" TextMode="Number" />
                 <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="Card Number is required." Display="Dynamic" CssClass="text-danger" />
                 <asp:RegularExpressionValidator ID="regcardnum" runat="server" ErrorMessage="Enter 16 digit Card number." ControlToValidate="txtCardNumber" ValidationExpression="^\d{16}$" CssClass="text-danger"></asp:RegularExpressionValidator>
             </div>
             <div class="col">
                 <label for="txtCardHolderName" class="form-label">Card Holder Name</label>
                 <asp:TextBox ID="txtCardHolderName" runat="server" CssClass="form-control" />
                 <asp:RequiredFieldValidator ID="rvfCardHolderName" runat="server" ControlToValidate="txtCardHolderName" ErrorMessage="Card Holder Name is required." Display="Dynamic" CssClass="text-danger" />
             </div>
         </div>
         <div class="row mb-3">
             <div class="col">
                 <label for="txtExpiryDate" class="form-label">Expiry Date</label>
                 <asp:TextBox type="month" ID="txtExpiryDate" runat="server" CssClass="form-control"  />
                 <asp:RequiredFieldValidator ID="rvfExpiryDate" runat="server" ControlToValidate="txtExpiryDate" ErrorMessage="Expiry Date is required." Display="Dynamic" CssClass="text-danger" />
             </div>
             <div class="col">
                 <label for="txtSecurityCode" class="form-label">Security Code</label>
                 <asp:TextBox ID="txtSecurityCode" runat="server" CssClass="form-control" TextMode="Number" />
                 <asp:RequiredFieldValidator ID="rfvSecurityCode" runat="server" ControlToValidate="txtSecurityCode" ErrorMessage="Security Code is required." Display="Dynamic" CssClass="text-danger" />
                 <asp:RegularExpressionValidator ID="regcvv" runat="server" ErrorMessage="Enter 3 digit Security Code." ControlToValidate="txtSecurityCode" CssClass="text-danger" ValidationExpression="^\d{3}$"></asp:RegularExpressionValidator>
             </div>
         </div>
         <div class="text-center mt-5">
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-dark px-5 py-2" OnClick="btnSubmit_Click1" />
         </div>
             </div>
    
 </div>

        </div>
        
    </main>

    <asp:TextBox ID="TextBox1" runat="server" BackColor="#0066FF" BorderColor="#993399"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btn btn-dark px-5 py-2" Text="Button" />

</asp:Content>

