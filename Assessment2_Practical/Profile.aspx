<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assessment2_Practical.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #87CEEB, #fff);
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        table th {
            text-align: left;
        }

        .btn-container {
            text-align: center;
        }

        .btn-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Welcome, <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label>!</h2>
            <table>
                <tr>
                    <th>ID:</th>
                    <td><asp:Label ID="lblID" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <th>Name:</th>
                    <td><asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <th>Surname:</th>
                    <td><asp:Label ID="lblSurname" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <th>Password:</th>
                    <td><asp:Label ID="lblPassword" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
            <div class="btn-container">
                <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" OnClick="btnEditProfile_Click" CssClass="btn-edit-profile" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnHome" runat="server" OnClick="btnHome_Click" Text="Home" Width="86px" />
            </div>
        </div>
    </form>
</body>
</html>
