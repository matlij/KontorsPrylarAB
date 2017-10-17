<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="showCart.aspx.cs" Inherits="KontorsprylarAB.showCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ViewCart" runat="server">

      <h2> Din varukorg </h2>

    <br />
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Artnr</th>
                <th>Namn</th>
                <th>Pris</th>
                <th>Antal</th>
            </tr>
            </thead>

        <tbody id="CartTableBody">

        </tbody>
        <tfoot>
            <tr>
                <td> Moms: 25%</td>
                <td>&nbsp</td>
                <td> Pris SEK inkl moms: &nbsp <textarea id="SumCart" cols="1" rows="1"></textarea> </td>
            </tr>
        </tfoot>
    </table>

    <table>
        <tr>
            <td><input type="button" value="Makulera order" id="buttonDeleteOrder" /></td>
            <td><input type="button" value="Bekräfta order" id="buttonConfirmOrder" /></td>
        </tr>
    </table>

</asp:Content>
