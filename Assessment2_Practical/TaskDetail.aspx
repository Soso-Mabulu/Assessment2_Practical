<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskDetail.aspx.cs" Inherits="Assessment2_Practical.TaskDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Detail</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .task-container {
            width: 100%;
            max-width: 500px;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .task-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .task-container label {
            font-weight: bold;
        }

        .task-container p {
            margin-top: 10px;
        }

        .task-container .status-container {
            margin-top: 20px;
            display: flex;
            align-items: center;
        }

        .task-container .status-container label {
            margin-right: 10px;
        }

        .task-container .status-container select {
            margin-right: 10px;
            padding: 5px;
        }

        .task-container .btn-container {
            margin-top: 20px;
            text-align: center;
        }

        .task-container .btn-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        .task-container .btn-container button:hover {
            background-color: #45a049;
        }

        .listbox-container {
            margin-bottom: 20px;
        }

        .listbox-container label {
            display: block;
            font-weight: bold;
        }

        .listbox-container .listbox {
            width: 100%;
            height: 200px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }

        .btn-back {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .btn-container {
        margin-top: 20px;
        text-align: center;
    }

    .btn-container .btn-remove-task {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
        font-size: 16px;
    }

    .btn-container .btn-remove-task:hover {
        background-color: #45a049;
    }

    .btn-container .btn-go-home {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #337ab7;
        color: white;
        cursor: pointer;
        font-size: 16px;
    }

    .btn-container .btn-go-home:hover {
        background-color: #286090;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="task-container">
                <h2>Task Detail</h2>
                <div class="listbox-container">
                    <label>Select a Task:</label>
                    <asp:ListBox ID="lstTasks" runat="server" CssClass="listbox" AutoPostBack="true" OnSelectedIndexChanged="lstTasks_SelectedIndexChanged"></asp:ListBox>
                </div>
                <label>Task ID:</label>
                <p><asp:Label ID="lblTaskID" runat="server" Text=""></asp:Label></p>
                <label>Title:</label>
                <p><asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></p>
                <label>Status:</label>
                <p>
                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                        <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                    </asp:DropDownList>
                </p>
                <label>Description:</label>
                <p><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></p>
                <div class="btn-container">
                    <asp:Button ID="btnRemoveTask" runat="server" Text="Remove Task" OnClick="btnRemoveTask_Click" OnClientClick="return confirmRemoveTask();" CssClass="btn-remove-task" />
                    <asp:Button ID="btnGoToHomePage" runat="server" Text="Go to Home Page" OnClick="btnGoToHomePage_Click" OnClientClick="goToHomePage();" CssClass="btn-go-home" style="margin-left: 10px; margin-right: 10px;" />
                </div>
                
            </div>
        </div>
        <script>
            function confirmRemoveTask() {
                return confirm("Are you sure you want to remove this task?");
            }

            function goToHomePage() {
                window.location.href = "Home.aspx"; // Replace "Home.aspx" with the actual URL of your home page
            }
        </script>
    </form>
</body>
</html>
