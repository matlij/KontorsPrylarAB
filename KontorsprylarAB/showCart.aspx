<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="showCart.aspx.cs" Inherits="KontorsprylarAB.showCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JavaScript/MyJavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ViewCart" runat="server">

    <h2>Din varukorg </h2>
    <input id="buttonShowCart" type="button" value="Visa varukorg" />

    <br />
    <table style="width: 40%;" class="table table-striped">
        <thead>
            <tr>
                <th>Artnr</th>
                <th>Namn</th>
                <th>Beskrivning</th>
                <th>Pris</th>
                <th>&nbsp</th>
            </tr>
        </thead>

        <tbody id="CartTableBody">
        </tbody>
        <tfoot>
            <tr>
                <td>Moms: 25%</td>
                <td>&nbsp</td>
                <td>Pris SEK inkl moms: &nbsp</td>
                <td><textarea id="SumCart" cols="1" rows="1"></textarea></td>
                <td>&nbsp</td>
            </tr>
        </tfoot>
    </table>

    <table>
        <tr>
            <td>
                <input type="button" value="Makulera order" id="buttonDeleteOrder" /></td>
            <td>
                <input type="button" value="Bekräfta order" id="buttonConfirmOrder" /></td>
        </tr>
    </table>

</asp:Content>
