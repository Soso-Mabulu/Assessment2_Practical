using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assessment2_Practical
{
    public partial class TaskDetail : System.Web.UI.Page
    {
        // Global Declaration
        public SqlConnection connection;
        public SqlDataAdapter adapter;
        public SqlDataReader reader;
        public System.Data.DataSet ds;
        public SqlCommand command;
        public static string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assignment2_Database.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(connStr);
            if (!IsPostBack)
            {
                // Populate the ListBox with tasks from the database
                PopulateTaskList();
            }
        }
        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected TaskID from the ListBox
            string selectedTaskID = lstTasks.SelectedValue;

            // Get the selected status from the DropDownList
            string selectedStatus = ddlStatus.SelectedValue;

            // Update the status in the database
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("UPDATE Tasks SET Status = @Status WHERE TaskID = @TaskID", connection);
                command.Parameters.AddWithValue("@Status", selectedStatus);
                command.Parameters.AddWithValue("@TaskID", selectedTaskID);
                command.ExecuteNonQuery();
            }

            // Display the updated status
            lblStatus.Text = "Status updated to: " + selectedStatus;
        }
        protected void lstTasks_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Retrieve the selected task details from the database
            string selectedTaskID = lstTasks.SelectedValue;
            Task task = RetrieveTaskFromDatabase(selectedTaskID);

            // Display the task details on the page
            lblTaskID.Text = task.TaskID;
            lblTitle.Text = task.Title;
            lblStatus.Text = task.Status;
            lblDescription.Text = task.Description;

            // Set the selected status in the DropDownList
            ddlStatus.SelectedValue = task.Status;
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            // Update the status of the selected task in the database
            string selectedTaskID = lstTasks.SelectedValue;
            string newStatus = ddlStatus.SelectedValue;
            UpdateTaskStatusInDatabase(selectedTaskID, newStatus);

            // Refresh the task details on the page
            lstTasks_SelectedIndexChanged(sender, e);
        }

        private void PopulateTaskList()
        {
            connection.Open();

            // Retrieve tasks from the database and populate the ListBox
            string query = "SELECT TaskID, Title, Status, Description FROM Tasks";
            command = new SqlCommand(query, connection);
            adapter = new SqlDataAdapter(command);
            ds = new System.Data.DataSet();
            adapter.Fill(ds);
            lstTasks.DataSource = ds.Tables[0];
            lstTasks.DataTextField = "Title";
            lstTasks.DataValueField = "TaskID";
            lstTasks.DataBind();

            connection.Close();
        }

        private Task RetrieveTaskFromDatabase(string taskID)
        {
            connection.Open();

            // Retrieve the task details from the database based on the taskID
            string query = "SELECT TaskID, Title, Status, Description FROM Tasks WHERE TaskID = @TaskID";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@TaskID", taskID);
            reader = command.ExecuteReader();
            Task task = new Task();

            if (reader.Read())
            {
                task.TaskID = reader["TaskID"].ToString();
                task.Title = reader["Title"].ToString();
                task.Status = reader["Status"].ToString();
                task.Description = reader["Description"].ToString();
            }

            reader.Close();
            connection.Close();

            return task;
        }
       

        private void RemoveTaskFromDatabase(string taskID)
        {
            connection.Open();

            // Remove the task from the database based on the taskID
            string query = "DELETE FROM Tasks WHERE TaskID = @TaskID";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@TaskID", taskID);
            command.ExecuteNonQuery();

            connection.Close();
        }

        private void ClearTaskDetails()
        {
            lblTaskID.Text = string.Empty;
            lblTitle.Text = string.Empty;
            lblStatus.Text = string.Empty;
            lblDescription.Text = string.Empty;
            ddlStatus.SelectedIndex = -1;
        }


        private void UpdateTaskStatusInDatabase(string taskID, string newStatus)
        {
            connection.Open();

            // Update the status of the task in the database based on the taskID
            string query = "UPDATE Tasks SET Status = @Status WHERE TaskID = @TaskID";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Status", newStatus);
            command.Parameters.AddWithValue("@TaskID", taskID);
            command.ExecuteNonQuery();

            connection.Close();
        }
        public class Task
        {
            public string TaskID { get; set; }
            public string Title { get; set; }
            public string Status { get; set; }
            public string Description { get; set; }
        }

        protected void btnGoToHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnRemoveTask_Click(object sender, EventArgs e)
        {
            // Get the selected TaskID from the ListBox
            string selectedTaskID = lstTasks.SelectedValue;

            // Remove the task from the database
            RemoveTaskFromDatabase(selectedTaskID);

            // Refresh the task list
            PopulateTaskList();

            // Clear the task details on the page
            ClearTaskDetails();
        }
    }
}
