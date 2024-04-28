<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/Main.Master" Inherits="GroupProjectFinal.Login" %>
<%@ MasterType VirtualPath="~/Main.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <style>
        .lgn {
            width: 380px;
        }
    </style>
    <main>
        <div style="display:flex; justify-content:center; align-items:center; width:100%; margin-top:50px;">
        <div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <asp:TextBox ID="password" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            
            <asp:Button ID="Button1" CssClass="btn btn-primary lgn" runat="server" Text="LOGIN" OnClick="Button1_Click" />
            
            
        &nbsp;<br />
            <br />
            <asp:HyperLink ID="HyperLink7" runat="server" CssClass="btn btn-warning lgn" NavigateUrl="~/Register.aspx">New User? Click here to Register</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="Error" ForeColor="red" runat="server"></asp:Label>
            
            
        </div>
        </div>

    </main>

</asp:Content>
