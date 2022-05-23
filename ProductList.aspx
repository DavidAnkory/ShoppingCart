<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
    CodeBehind="ProductList.aspx.cs" Inherits="ShoppingCart.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                  <h2><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="productList" runat="server"
                DataKeyNames="id" GroupItemCount="4"
                ItemType="ShoppingCart.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                     <table >
                         <tr>
                            <td>No data was returned.</td>
                        </tr>
                     </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                     <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                     <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                     </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a
                                        href="ProductDetails.aspx?productID=<%#:Item.id%>">
                                        <a href=Item.image></a>
                                        <img src ="<%#:Item.image%>"
                                             width="100" height="75" style="border:
                                                                                 solid"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a
                                        href="ProductDetails.aspx?productID=<%#:Item.id%>">
                                        <span>
                                            <%#:Item.id%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Title: </b><%#:Item.title %>
                                    </span>
                                    <br />
                                    <span>
                                        <b>Category: </b><%#:Item.category %>
                                    </span>
                                    <br />
                                    <span>
                                        <b>My rate is: </b><%#:Item.rating.rate %>
                                    </span>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}",
                                                              Item.price) %>
                                    </span>
                                    <br />
                                    <span>
                                        <asp:Button style="background-color: aquamarine" runat="server" Text= "Add To Cart:"> </asp:Button>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                        <tr>
                            <td>
                                <table id="groupPlaceholderContainer"
                                       runat="server" style="width:100%">
                                    <tr id="groupPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>