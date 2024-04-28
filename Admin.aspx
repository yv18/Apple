<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GroupProjectFinal.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
     <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style>
        .ma {
            margin-top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
     <div class="container-fluid">
         <a class="navbar-brand" href="Defualt.aspx">Mobile Store</a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarColor01">
             <ul class="navbar-nav me-auto">
                 <li class="nav-item">
                     <asp:HyperLink CssClass="nav-link" ID="HyperLink1" NavigateUrl="~/Admin.aspx" runat="server">Admin Dashboard</asp:HyperLink>
                 </li>
                 <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link" ID="HyperLink2" NavigateUrl="~/Login.aspx" runat="server">Log Out</asp:HyperLink>
                </li>
             </ul>
         </div>
     </div>
 </nav>

        </div>

        <div style="display:flex; justify-content:center; align-items:center; width:100%; flex-direction:column; margin-top:50px;">
            <asp:Label ID="Label1" runat="server" Text="Add New Category"></asp:Label>
           <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="categoryID" ForeColor="#333333" GridLines="None" CssClass="table table-striped">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary" />
        <asp:BoundField DataField="categoryID" HeaderText="categoryID" ReadOnly="True" SortExpression="categoryID" />
        <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Group2Database %>" DeleteCommand="DELETE FROM [Categories] WHERE [categoryID] = @original_categoryID AND [categoryName] = @original_categoryName" InsertCommand="INSERT INTO [Categories] ([categoryID], [categoryName]) VALUES (@categoryID, @categoryName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [categoryName] = @categoryName WHERE [categoryID] = @original_categoryID AND [categoryName] = @original_categoryName">
                <DeleteParameters>
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_categoryName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter Name="categoryName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="categoryName" Type="String" />
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_categoryName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <div>

            <br />
            <br />
            <div style="display:flex; justify-content:center; align-items:center; ">

            
            <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource2" Height="50px" Width="350px" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="categoryID" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <Fields>
                    <asp:BoundField DataField="categoryID" HeaderText="categoryID" ReadOnly="True" SortExpression="categoryID" />
                    <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Group2Database %>" DeleteCommand="DELETE FROM [Categories] WHERE [categoryID] = @original_categoryID AND [categoryName] = @original_categoryName" InsertCommand="INSERT INTO [Categories] ([categoryID], [categoryName]) VALUES (@categoryID, @categoryName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Categories] WHERE ([categoryID] = @categoryID)" UpdateCommand="UPDATE [Categories] SET [categoryName] = @categoryName WHERE [categoryID] = @original_categoryID AND [categoryName] = @original_categoryName">
                <DeleteParameters>
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_categoryName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter Name="categoryName" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="categoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="categoryName" Type="String" />
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_categoryName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
                </div>

            <br />
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="productID" DataSourceID="SqlDataSource3" CssClass="table table-striped" AllowPaging="True">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary ma" />
        <asp:BoundField DataField="productID" HeaderText="productID" ReadOnly="True" SortExpression="productID" />
        <asp:BoundField DataField="categoryID" HeaderText="categoryID" SortExpression="categoryID" />
        <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
        <asp:BoundField DataField="productDescription" HeaderText="productDescription" SortExpression="productDescription" />
        <asp:BoundField DataField="productPrice" HeaderText="productPrice" SortExpression="productPrice" />
        <asp:BoundField DataField="productImage" HeaderText="productImage" SortExpression="productImage" />
    </Columns>
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Group2Database %>" DeleteCommand="DELETE FROM [Products] WHERE [productID] = @original_productID AND [categoryID] = @original_categoryID AND [productName] = @original_productName AND [productDescription] = @original_productDescription AND [productPrice] = @original_productPrice AND [productImage] = @original_productImage" InsertCommand="INSERT INTO [Products] ([productID], [categoryID], [productName], [productDescription], [productPrice], [productImage]) VALUES (@productID, @categoryID, @productName, @productDescription, @productPrice, @productImage)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [categoryID] = @categoryID, [productName] = @productName, [productDescription] = @productDescription, [productPrice] = @productPrice, [productImage] = @productImage WHERE [productID] = @original_productID AND [categoryID] = @original_categoryID AND [productName] = @original_productName AND [productDescription] = @original_productDescription AND [productPrice] = @original_productPrice AND [productImage] = @original_productImage">
                <DeleteParameters>
                    <asp:Parameter Name="original_productID" Type="Int32" />
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_productName" Type="String" />
                    <asp:Parameter Name="original_productDescription" Type="String" />
                    <asp:Parameter Name="original_productPrice" Type="Double" />
                    <asp:Parameter Name="original_productImage" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="productID" Type="Int32" />
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter Name="productName" Type="String" />
                    <asp:Parameter Name="productDescription" Type="String" />
                    <asp:Parameter Name="productPrice" Type="Double" />
                    <asp:Parameter Name="productImage" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter Name="productName" Type="String" />
                    <asp:Parameter Name="productDescription" Type="String" />
                    <asp:Parameter Name="productPrice" Type="Double" />
                    <asp:Parameter Name="productImage" Type="String" />
                    <asp:Parameter Name="original_productID" Type="Int32" />
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_productName" Type="String" />
                    <asp:Parameter Name="original_productDescription" Type="String" />
                    <asp:Parameter Name="original_productPrice" Type="Double" />
                    <asp:Parameter Name="original_productImage" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="productID" DataSourceID="SqlDataSource4" Height="50px" Width="125px" CssClass="table table-bordered">
    <Fields>
        <asp:BoundField DataField="productID" HeaderText="productID" ReadOnly="True" SortExpression="productID" />
        <asp:BoundField DataField="categoryID" HeaderText="categoryID" SortExpression="categoryID" />
        <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
        <asp:BoundField DataField="productDescription" HeaderText="productDescription" SortExpression="productDescription" />
        <asp:BoundField DataField="productPrice" HeaderText="productPrice" SortExpression="productPrice" />
        <asp:BoundField DataField="productImage" HeaderText="productImage" SortExpression="productImage" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Group2Database %>" SelectCommand="SELECT * FROM [Products] WHERE ([productID] = @productID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Products] WHERE [productID] = @original_productID AND [categoryID] = @original_categoryID AND [productName] = @original_productName AND [productDescription] = @original_productDescription AND [productPrice] = @original_productPrice AND [productImage] = @original_productImage" InsertCommand="INSERT INTO [Products] ([productID], [categoryID], [productName], [productDescription], [productPrice], [productImage]) VALUES (@productID, @categoryID, @productName, @productDescription, @productPrice, @productImage)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Products] SET [categoryID] = @categoryID, [productName] = @productName, [productDescription] = @productDescription, [productPrice] = @productPrice, [productImage] = @productImage WHERE [productID] = @original_productID AND [categoryID] = @original_categoryID AND [productName] = @original_productName AND [productDescription] = @original_productDescription AND [productPrice] = @original_productPrice AND [productImage] = @original_productImage">
                <DeleteParameters>
                    <asp:Parameter Name="original_productID" Type="Int32" />
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_productName" Type="String" />
                    <asp:Parameter Name="original_productDescription" Type="String" />
                    <asp:Parameter Name="original_productPrice" Type="Double" />
                    <asp:Parameter Name="original_productImage" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="productID" Type="Int32" />
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter Name="productName" Type="String" />
                    <asp:Parameter Name="productDescription" Type="String" />
                    <asp:Parameter Name="productPrice" Type="Double" />
                    <asp:Parameter Name="productImage" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" DefaultValue="0" Name="productID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter Name="productName" Type="String" />
                    <asp:Parameter Name="productDescription" Type="String" />
                    <asp:Parameter Name="productPrice" Type="Double" />
                    <asp:Parameter Name="productImage" Type="String" />
                    <asp:Parameter Name="original_productID" Type="Int32" />
                    <asp:Parameter Name="original_categoryID" Type="Int32" />
                    <asp:Parameter Name="original_productName" Type="String" />
                    <asp:Parameter Name="original_productDescription" Type="String" />
                    <asp:Parameter Name="original_productPrice" Type="Double" />
                    <asp:Parameter Name="original_productImage" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
           <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource5" CssClass="table table-striped">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
        <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
        <asp:BoundField DataField="province" HeaderText="province" SortExpression="province" />
        <asp:BoundField DataField="postalCode" HeaderText="postalCode" SortExpression="postalCode" />
        <asp:BoundField DataField="grandTotal" HeaderText="grandTotal" SortExpression="grandTotal" />
        <asp:BoundField DataField="orderDate" HeaderText="orderDate" SortExpression="orderDate" />
    </Columns>
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Group2Database %>" DeleteCommand="DELETE FROM [Orders] WHERE [Id] = @original_Id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [address] = @original_address AND [city] = @original_city AND [province] = @original_province AND [postalCode] = @original_postalCode AND [grandTotal] = @original_grandTotal AND [orderDate] = @original_orderDate" InsertCommand="INSERT INTO [Orders] ([Id], [firstName], [lastName], [address], [city], [province], [postalCode], [grandTotal], [orderDate]) VALUES (@Id, @firstName, @lastName, @address, @city, @province, @postalCode, @grandTotal, @orderDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [firstName], [lastName], [address], [city], [province], [postalCode], [grandTotal], [orderDate] FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [firstName] = @firstName, [lastName] = @lastName, [address] = @address, [city] = @city, [province] = @province, [postalCode] = @postalCode, [grandTotal] = @grandTotal, [orderDate] = @orderDate WHERE [Id] = @original_Id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [address] = @original_address AND [city] = @original_city AND [province] = @original_province AND [postalCode] = @original_postalCode AND [grandTotal] = @original_grandTotal AND [orderDate] = @original_orderDate">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_firstName" Type="String" />
                    <asp:Parameter Name="original_lastName" Type="String" />
                    <asp:Parameter Name="original_address" Type="String" />
                    <asp:Parameter Name="original_city" Type="String" />
                    <asp:Parameter Name="original_province" Type="String" />
                    <asp:Parameter Name="original_postalCode" Type="String" />
                    <asp:Parameter Name="original_grandTotal" Type="String" />
                    <asp:Parameter Name="original_orderDate" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="province" Type="String" />
                    <asp:Parameter Name="postalCode" Type="String" />
                    <asp:Parameter Name="grandTotal" Type="String" />
                    <asp:Parameter Name="orderDate" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="province" Type="String" />
                    <asp:Parameter Name="postalCode" Type="String" />
                    <asp:Parameter Name="grandTotal" Type="String" />
                    <asp:Parameter Name="orderDate" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_firstName" Type="String" />
                    <asp:Parameter Name="original_lastName" Type="String" />
                    <asp:Parameter Name="original_address" Type="String" />
                    <asp:Parameter Name="original_city" Type="String" />
                    <asp:Parameter Name="original_province" Type="String" />
                    <asp:Parameter Name="original_postalCode" Type="String" />
                    <asp:Parameter Name="original_grandTotal" Type="String" />
                    <asp:Parameter Name="original_orderDate" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource6" CssClass="table table-striped">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
    </Columns>
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Group2Database %>" DeleteCommand="DELETE FROM [Users] WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Email] = @original_Email AND [Password] = @original_Password" InsertCommand="INSERT INTO [Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (@Id, @FirstName, @LastName, @Email, @Password)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [Password] = @Password WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Email] = @original_Email AND [Password] = @original_Password">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />

        </div>
    </form>
</body>
</html>
