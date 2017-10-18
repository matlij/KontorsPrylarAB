<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="KontorsprylarAB.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JavaScript/MyJavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ViewArticles" runat="server">

    <asp:Label ID="LabelAddToCart" runat="server" Text="" Font-Size="Larger"></asp:Label>

    <table style="width: 60%;" class="table table-striped">
        <thead>
            <tr>
                <th>Artikelnummer</th>
                <th>Artikel</th>
                <th>Beskrivning</th>
                <th>Pris</th>
            </tr>
        </thead>
        <tbody id="myTableBody">
        </tbody>
    </table>

    <input id="loadButton" type="button" value="Visa artiklar" />

</asp:Content>
