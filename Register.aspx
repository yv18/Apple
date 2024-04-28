<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Register.aspx.cs" Inherits="GroupProjectFinal.Register" %>
<%@ MasterType VirtualPath="~/Main.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

    <main>
         <div class="mb-3">
     <label for="txtFirstName" class="form-label">First Name</label>
     <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control mb-3" />
     <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." Display="Dynamic" CssClass="text-danger" />
 </div>
 <div class="mb-3">
     <label for="txtLastName" class="form-label">Last Name</label>
     <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control mb-3" />
     <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." Display="Dynamic" CssClass="text-danger" />
 </div>
 <div class="mb-3">
     <label for="txtEmail" class="form-label">Email</label>
     <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-3" />
     <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." Display="Dynamic" CssClass="text-danger" />
     <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format." Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger" />
 </div>
 <div class="mb-3">
     <label for="txtPassword" class="form-label">Password</label>
     <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" TextMode="Password" />
     <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." Display="Dynamic" CssClass="text-danger" />
 </div>
 <div class="text-center">
     <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click1" />
 </div>

 <div class="text-center mt-3">
     <p>Already registered? <a href="Login.aspx">click here</a> to Login.</p>
 </div>

    </main>

</asp:Content>
