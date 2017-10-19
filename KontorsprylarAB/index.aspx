<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="KontorsprylarAB.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JavaScript/MyJavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ViewArticles" runat="server">

    <h1>Välkommen till Kontorsprylar AB!</h1>
    <h4 id="indexWelcomeText">Klicka på bilden för att se vårt sortiment</h4>
    <div id="indexPic"><img src="Img/kontorsprylarABMainPic.png" /></div>

    <table style="width: 60%;" class="table table-striped">
        <thead>
            <tr>
                <th>Artikelnummer</th>
                <th>Artikel</th>
                <th>Beskrivning</th>
                <th>Pris exkl moms (SEK)</th>
            </tr>
        </thead>
        <tbody id="myTableBody">
        </tbody>
    </table>

</asp:Content>
