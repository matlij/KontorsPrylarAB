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

        <tfoot>
            <tr>
                <th></th>
                <th></th>
                <th>Pris SEK EX moms: &nbsp</th>
                <th><textarea style="width: 85px" id="SumCart" cols="1" rows="1"></textarea></th>
                <th>&nbsp</th>
            </tr>
            <tr>
                <th></th>
                <th></th>
                <th>Pris SEK inkl moms 25%: &nbsp</th>
                <th><textarea style="width: 85px" id="SumCartInkTax" cols="1" rows="1"></textarea></th>
                <th>&nbsp</th>
            </tr>
        </tfoot>

        <tbody id="CartTableBody">
        </tbody>
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
