<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Assessment2_Practical.SignUp" %>

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
        .auto-style9 {
            text-align: center;
            height: 26px;
        }
        .auto-style10 {
            height: 26px;
        }
        .auto-style11 {
            text-align: center;
            height: 23px;
        }
        .auto-style12 {
            height: 23px;
        }
        .auto-style13 {
            width: 546px;
        }
        .auto-style14 {
            text-align: center;
            height: 25px;
            width: 546px;
        }
        .auto-style15 {
            text-align: center;
            width: 546px;
        }
        .auto-style16 {
            text-align: center;
            height: 23px;
            width: 546px;
        }
        .auto-style17 {
            text-align: center;
            height: 26px;
            width: 546px;
        }
        .auto-style18 {
            text-align: center;
            height: 22px;
        }
        .auto-style19 {
            text-align: center;
            height: 22px;
            width: 546px;
        }
        .auto-style20 {
            height: 22px;
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
                        <asp:Label ID="Label1" runat="server" Text="Sign In"></asp:Label>
                    </h2>
                </td>
            </tr>
            <tr>
                <td> </td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtName" runat="server" Width="240px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"> </td>
                <td class="auto-style15">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblSurname" runat="server" Text="Surname: "></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="auto-style4" Width="240px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSurname" ErrorMessage="Please enter your surname:"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="lblUsername0" runat="server" Text="EmailAddress:"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtEmail" runat="server" Width="240px"></asp:TextBox>
                </td>
                <td class="auto-style20">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid emailAddress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"> </td>
                <td class="auto-style15">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style4" Width="240px"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="auto-style4" Width="240px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Please confirm your password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td> </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="btnSignUp" runat="server" Height="30px" OnClick="btnSignUp_Click1" Text="SignUp" Width="180px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Already have an account ,  "></asp:Label>
                    <asp:HyperLink ID="hplLogin" runat="server" NavigateUrl="~/Authentication.aspx"> click here to login</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

