<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="KontorsprylarAB.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JavaScript/MyJavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ViewLogin" runat="server">
    <div style="text-align: center; align-content: center; display: block;">
            <div style="text-align: center; align-content: center;">
                <table class="table table-condensed table-bordered" style="width: 300px;">
                    <tr>
                        <td>Username</td>
                        <td>
                            <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="text-align: right;">
                            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" /></td>
                    </tr>
                </table>
                <asp:Label ID="LabelInfo" runat="server" Text="" ForeColor="Red"></asp:Label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please provide username" ControlToValidate="TextBoxUsername" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please provide password" EnableClientScript="False" ForeColor="Red" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator><br />
            </div>
        </div>
</asp:Content>
