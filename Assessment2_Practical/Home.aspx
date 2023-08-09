<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Assessment2_Practical.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Basic styling for the navbar */
        ul.navbar {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #f1f1f1;
        }

        ul.navbar li {
            float: left;
        }

        ul.navbar li a {
            display: block;
            color: #333;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        ul.navbar li a:hover {
            background-color: #ddd;
        }
        
        /* Styling for the Task Master name */
        .taskmaster {
            font-size: 24px;
            font-weight: bold;
            padding: 10px;
            text-align: center;
        }
        .auto-style1 {
            text-align: center;
        }
        .calendar {
            width: 100%;
            max-width: 400px; /* Adjust the maximum width as needed */
            margin: 0 auto; /* Center the calendar horizontally */
        }
        .gridview {
            width: 100%;
            max-width: 600px; /* Adjust the maximum width as needed */
            margin: 0 auto; /* Center the GridView horizontally */
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="taskmaster">
                 <h1 style="background-color: #C0C0C0">Task Master
            </h1>
            </div>
            
            <ul class="navbar">
                <li><a href="#">Home</a></li>
                <li><a href="TaskDetail.aspx">Task Details</a></li>
                <li><a href="Profile.aspx">Profile</a></li>
                <li style="float:right"><a href="default.aspx">Logout</a></li>
            </ul>

        </div>
    <p>
        &nbsp;</p>
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <h2 class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Overview "></asp:Label>
                    </h2>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <p class="auto-style1">
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <table style="width: 100%; text-align: center;">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" CssClass="gridview"></asp:GridView>
                </td>
            </tr>
        </table>

        <p>
        </p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <br />
                    <asp:Button ID="btnAddTask" runat="server" Height="37px" Text="Add New Activity" Width="114px" OnClick="Button1_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnViewTaskDetails" runat="server" Height="37px" OnClick="btnViewTaskDetails_Click" Text="View Task Details" Width="114px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
        </table>
        <table style="width: 100%; text-align: center;">
            <tr>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" CssClass="calendar" OnSelectionChanged="Calendar1_SelectionChanged1"></asp:Calendar>
                </td>
            </tr>
        </table>
    </form>
    </body>
</html>
