<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ShowCustomer.aspx.cs" Inherits="KontorsprylarAB.ShowCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JavaScript/MyJavaScript.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content_Customer" runat="server">


    <h1>Din sida</h1>

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

    <h2 id="customerform_h2"></h2>
    <asp:Label ID="LabelStatus" runat="server" Text="Label"></asp:Label>

    <div class="form-group">
        <label for="textboxUserName" style="font-size: large">Användarnamn:</label>
        <br />
        <asp:TextBox ID="textboxUserName" runat="server" Font-Size="Large" BackColor="#FFE0C1" Height="25px" Width="298px"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="textboxEmail" style="font-size: large">E-post:</label>
        <br />
        <asp:TextBox ID="textboxEmail" runat="server" Font-Size="Large" Height="25px" Width="294px" BackColor="#FFE0C1"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="textboxPassword" style="font-size: large">Lösenord:</label>
        <br />
        <asp:TextBox ID="textboxPassword" runat="server" Font-Size="Large" Width="290px" BackColor="#FFE0C1" Height="24px"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="textboxStreet" style="font-size: large">Postadress:</label>
        <br />
        <asp:TextBox ID="textboxStreet" runat="server" Font-Size="Large" Width="290px" BackColor="#FFE0C1" Height="24px"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="textboxCity" style="font-size: large">Postord:</label>
        <br />
        <asp:TextBox ID="textboxCity" runat="server" Font-Size="Large" Width="290px" BackColor="#FFE0C1" Height="24px"></asp:TextBox>
    </div>

    <br />

    <%--    Knapp för att submitta ändringar/lägga till--%>
    <asp:Button ID="buttonSubmitCustomer" runat="server" Text="OK" OnClick="buttonSubmitCustomer_Click" Font-Size="X-Large" Height="49px" Width="101px" BackColor="#FF9999" BorderStyle="Double" Font-Bold="True" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ViewDetails" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ViewCart" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ViewLogin" runat="server">
</asp:Content>
