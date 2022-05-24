<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
        CodeBehind="ProductDetails.aspx.cs" 
Inherits="ShoppingCart.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server"
                  ItemType="ShoppingCart.Models.Product" SelectMethod ="GetProduct"
                  RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1><%#:Item.title %></h1>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <a href=Item.image></a>
                        <img src ="<%#:Item.image%>"
                             width="700" height="650" style="border:/&gt; <%#:Item.title %>">
                    </td>
                    <td>&nbsp;</td>
                    <td style="vertical-align: top; text-align:left;">
                        <b>Description:</b><br /><%#:Item.description %><br/>
                        <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.price) %></span>
                        <br/>
                        <span>
                            <b>Product Number:</b>
                            &nbsp;<%#:Item.id %>
                        </span>
                        <br />
                        <a
                            href="/AddToCart.aspx?productID=<%#:Item.id %>">
                            <span class="ProductListItem">
                                <b>Add To Cart<b>
                            </span>
                        </a>

                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
