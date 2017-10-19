<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="KontorsprylarAB.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JavaScript/MyJavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ViewArticles" runat="server">

    
    <h1>Orderhistorik</h1>

    <asp:Label ID="LabelCustomerPage" runat="server" Text="" Font-Size="Larger"></asp:Label>

    <table style="width: 60%;" class="table table-striped">
        <thead>
            <tr>
                <th>Ordernr</th>
                <th>Artikelnummer</th>
                <th>Artikel</th>
                <th>Beskrivning</th>
                <th>Pris</th>
            </tr>
        </thead>
        <tbody id="myTbOrderHistory">
        </tbody>
    </table>

    <input id="loadButtonOrderHistory" type="button" value="Visa orderhistorik" />


</asp:Content>