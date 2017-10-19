<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="showArticle.aspx.cs" Inherits="KontorsprylarAB.showArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ViewDetails" runat="server">
    <h2 id="articleform_h2"></h2>
    <asp:Label ID="LabelStatus" runat="server" Text="" Font-Size="X-Large"></asp:Label>
    <div class="form-group">
        <label for="textboxArtName" style="font-size: large">Artikelnamn:</label>
        <br />
        <asp:TextBox ID="textboxArtName" runat="server" Font-Size="Large" BackColor="#FFE0C1" Height="25px" Width="298px"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="textboxArtDescription" style="font-size: large">Beskrivning:</label>
        <br />
        <asp:TextBox ID="textboxArtDescription" runat="server" Font-Size="Large" Height="58px" Width="294px" BackColor="#FFE0C1"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="textboxArtPrice" style="font-size: large">Pris SEK:</label>
        <br />
        <asp:TextBox ID="textboxArtPrice" runat="server" Font-Size="Large" Width="290px" BackColor="#FFE0C1" Height="24px"></asp:TextBox>
    </div>

    <%--Ska vi ha två separata knappar här - en för lägg till och en för uppdatera, eller enbart en knapp som heter OK--%>
    <br />


    <asp:Button ID="buttonSubmitArticle" runat="server" Text="OK" OnClick="buttonSubmitArticle_Click" Font-Size="X-Large" Height="49px" Width="101px" BackColor="#FF9999" BorderStyle="Double" Font-Bold="True" />


    <%--<asp:Button ID="buttonAddform" runat="server" Text="Delete" />--%>
</asp:Content>
