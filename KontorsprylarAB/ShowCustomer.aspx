<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ShowCustomer.aspx.cs" Inherits="KontorsprylarAB.ShowCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JavaScript/MyJavaScript.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content_Customer" runat="server">

    <asp:Label ID="customerform_h2" runat="server" Text="" Font-Size="X-Large" Font-Bold="True"></asp:Label>
    <br />
    <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
    <br />
    <div class="form-group">
        <label for="textboxUserName" style="font-size: large">Användarnamn:</label>
        <br />
        <asp:TextBox ID="textboxUserName" runat="server" Font-Size="Large" BackColor="#FFE0C1" Height="25px" Width="298px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ControlToValidate="textboxUserName" EnableClientScript="False" ErrorMessage="Vänligen fyll i användarnamn" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <label for="textboxEmail" style="font-size: large">E-post:</label>
        <br />
        <asp:TextBox ID="textboxEmail" runat="server" Font-Size="Large" Height="25px" Width="294px" BackColor="#FFE0C1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="textboxEmail" EnableClientScript="False" ErrorMessage="Vänligen fyll i e-post" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <label for="textboxPassword" style="font-size: large">Lösenord:</label>
        <br />
        <asp:TextBox ID="textboxPassword" runat="server" Font-Size="Large" Width="290px" BackColor="#FFE0C1" Height="24px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="textboxPassword" EnableClientScript="False" ErrorMessage="Vänligen fyll i Lösenord" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <label for="textboxStreet" style="font-size: large">Postadress:</label>
        <br />
        <asp:TextBox ID="textboxStreet" runat="server" Font-Size="Large" Width="290px" BackColor="#FFE0C1" Height="24px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorStreet" runat="server" ControlToValidate="textboxStreet" EnableClientScript="False" ErrorMessage="Vänligen fyll i postadress" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <label for="textboxCity" style="font-size: large">Postort:</label>
        <br />
        <asp:TextBox ID="textboxCity" runat="server" Font-Size="Large" Width="290px" BackColor="#FFE0C1" Height="24px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ControlToValidate="textboxCity" EnableClientScript="False" ErrorMessage="Vänligen fyll i postort" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <br />

    <%--    Knapp för att submitta ändringar/lägga till--%>
    <asp:Button ID="buttonSubmitCustomer" runat="server" Text="SPARA" OnClick="buttonSubmitCustomer_Click" Font-Size="X-Large" Height="49px" Width="101px" BackColor="#FF9999" BorderStyle="Double" Font-Bold="True" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ViewDetails" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ViewCart" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ViewLogin" runat="server">
</asp:Content>
