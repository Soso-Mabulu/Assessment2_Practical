using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assessment2_Practical
{
    public partial class EditProfile : System.Web.UI.Page
    {
        // Global Declaration
        public SqlConnection connection = new SqlConnection(connStr);
        public SqlDataAdapter adapter;
        public SqlDataReader reader;
        public System.Data.DataSet ds;
        public SqlCommand command;
        public static string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assignment2_Database.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Redirect back to the profile page
            Response.Redirect("Profile.aspx");
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            // Retrieve user input
            string name = txtName.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // Update the user's profile in the database
            if (UpdateUserProfile(name, surname, email, password))
            {
                // Profile updated successfully, redirect to the profile page
                Response.Redirect("Profile.aspx");
            }
            else
            {
                // Error occurred while updating the profile, display an error message
                lblErrorMessage.Text = "Error occurred while updating the profile. Please try again.";
            }
        }

        private bool UpdateUserProfile(string name, string surname, string email, string password)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assignment2_Database.mdf;Integrated Security=True"; // Replace with your SQL Server connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE Users SET Name = @Name, Surname = @Surname, Password = @Password WHERE Email = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Surname", surname);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    int rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
        }
    }
}
