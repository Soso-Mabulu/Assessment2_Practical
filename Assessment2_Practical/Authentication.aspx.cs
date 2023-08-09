using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assessment2_Practical
{
    public partial class Authentication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Validate the username and password against the database
            if (ValidateUser(username, password))
            {
                // Redirect the user to the home page or a dashboard page
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Display an error message indicating invalid credentials
                lblErrorMessage.Text = "Invalid username or password. Please try again.";
            }
        }

        private bool ValidateUser(string username, string password)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assignment2_Database.mdf;Integrated Security=True"; // Replace with your SQL Server connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Username AND Password = @Password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    int result = (int)command.ExecuteScalar();
                    return result > 0;
                }
            }
        }
    }
}