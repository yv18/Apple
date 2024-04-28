<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="index.aspx.cs" Inherits="GroupProjectFinal.index" %>
<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

    <main>
        <div>
            <div>

            </div>

            <div>
                <div style="margin:20px; margin-left:30px;">
                <asp:DropDownList ID="DropDownList1" CssClass="btn btn-dark dropdown-toggle" runat="server" DataSourceID="SqlDataSource1" DataTextField="categoryName" DataValueField="categoryID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Group2Database %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
                  <asp:Label ID="Error" ForeColor="Red" runat="server" Text=""></asp:Label>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div style="padding:20px; background-color:white; margin:20px; border-radius:20px;">
                       <div class="row singlepdt" style=" height:350px; width:100%; display:flex;  justify-content:center; align-items:center;">
                            <div class="col-md-4 m-auto">
                                <asp:Image ID="img" runat="server" CssClass="img-fluid img" ImageUrl='<%# Eval("productImage") %>' />
                            </div>
                            <div class="col-md-8 text-center">
                             <div class="namelbl text-center">
                                 <asp:Label ID="name" runat="server" Text='<%# Eval("productName") %>' CssClass=""></asp:Label>
                            </div>
                            <br />
                            <div class="desclbl text-justify">
                                <asp:Label ID="desc" runat="server" Text='<%# Eval("productDescription") %>' CssClass="text-justify"></asp:Label>
                            </div>
                            <br />
                            <div class="pricelbl text-center">
                                 <asp:Label ID="pricelbl" runat="server" Text='<%# Eval("productPrice", "{0:$#,##0.00}") %>' CssClass="rounded"></asp:Label>
                            </div>

                            <div class="quantity text-center mt-3">
                                <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" AssociatedControlID="txtQuantity"></asp:Label>
                                <asp:TextBox ID="txtQuantity" TextMode="Number" runat="server" CssClass="form-control" Text="1" oninput="validateQuantity(this)" ToolTip="Enter Quantity (0-10)"></asp:TextBox>
                            </div>
                            <div class="add-to-cart text-center mt-3 cartbtn">
                                 <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" Width="175px" CssClass="btn btn-warning " CommandArgument='<%# Eval("productName") + "|" + Eval("productPrice") %>' OnClick="AddToCart_Click"> </asp:Button>
                     
                            </div>
                    </div>
                </div>
               </div>

                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Group2Database %>" SelectCommand="SELECT * FROM [Products] WHERE ([categoryID] = @categoryID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="categoryID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />

            </div>




        </div>

    </main>

</asp:Content>

