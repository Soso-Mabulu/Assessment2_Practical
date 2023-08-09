<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authentication.aspx.cs" Inherits="Assessment2_Practical.Authentication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            height: 29px;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        .auto-style5 {
            text-align: center;
            height: 30px;
        }
        .auto-style6 {
            text-align: center;
            height: 6px;
        }
        .auto-style7 {
            text-align: center;
            height: 25px;
        }
        .auto-style8 {
            height: 25px;
        }
        .auto-style21 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image1" runat="server" Height="221px" ImageAlign="Top" ImageUrl="~/images/beach.jpg" Width="514px" />
                        <br />
                            <asp:Label ID="lblMainTitle" runat="server" CssClass="auto-style1" Font-Bold="True" Font-Size="XX-Large" Font-Strikeout="False" Height="60px" Text="TASK-MASTER"></asp:Label>
                        </td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="3">
                    <h2 class="auto-style2">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="auto-style21" ForeColor="Red"></asp:Label>
                    </h2>
                    <h2 class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label>
                    </h2>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblUsername" runat="server" Text="Username: "></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtUsername" runat="server" Width="229px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please Enter A valid EmailAddress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style4" Width="225px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="btnLogin" runat="server" Height="35px" OnClick="btnLogin_Click" Text="Login" Width="193px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Don't have an account yet, "></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx"> click here to sign Up</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
