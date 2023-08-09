using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assessment2_Practical
{
    public partial class AddTask : System.Web.UI.Page
    {
        //Global Declaration
        public SqlConnection connection = new SqlConnection(connStr);
        public SqlDataAdapter adapter;
        public SqlDataReader reader;
        public System.Data.DataSet ds;
        public SqlCommand command;
        public static string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assignment2_Database.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {
            try
            {
                // Generate a random TaskID (you can modify this logic if you want sequential keys)
                Random random = new Random();
                int taskID = random.Next(1000, 9999);

                // Get the input values from the form
                string title = txtTitle.Text;
                string priority = ddlPriority.SelectedValue;
                DateTime dueDate = Convert.ToDateTime(txtDueDate.Text);
                string status = ddlStatus.SelectedValue;
                string description = txtDescription.Text;

                // Connect to the database
                connection.Open();

                // Check if the generated TaskID already exists in the database
                string checkIDQuery = "SELECT COUNT(*) FROM Tasks WHERE TaskID = @TaskID";
                command = new SqlCommand(checkIDQuery, connection);
                command.Parameters.AddWithValue("@TaskID", taskID);
                int count = (int)command.ExecuteScalar();

                if (count > 0)
                {
                    // TaskID already exists, generate a new one and try again
                    // You can modify this logic based on your requirements
                    // For now, let's display an error message
                    lblError.Text = "Error: Failed to add task. Please try again.";
                }
                else
                {
                    // TaskID is unique, insert the task into the database
                    string insertQuery = "INSERT INTO Tasks (TaskID, Title, Priority, DueDate, Status,Description) VALUES (@TaskID, @Title, @Priority, @DueDate, @Status,@Desciption)";
                    command = new SqlCommand(insertQuery, connection);
                    command.Parameters.AddWithValue("@TaskID", taskID);
                    command.Parameters.AddWithValue("@Title", title);
                    command.Parameters.AddWithValue("@Priority", priority);
                    command.Parameters.AddWithValue("@DueDate", dueDate);
                    command.Parameters.AddWithValue("@Status", status);
                    command.Parameters.AddWithValue("@Desciption", description);
                    command.ExecuteNonQuery();

                    // Close the database connection
                    connection.Close();

                    // Redirect to the overview page
                    Response.Redirect("Home.aspx");
                }
            }
            catch (SqlException ex)
            {
                lblError.Text = "Error: " + ex.ToString();
            }
        }
    }
}
