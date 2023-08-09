using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assessment2_Practical
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in, if yes, redirect to the home page
            if (Session["username"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {

        }

        private bool IsUserExists(string email)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assignment2_Database.mdf;Integrated Security=True"; // Replace with your SQL Server connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private bool AddUserToDatabase(string userID, string name, string surname, string email, string password)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Assignment2_Database.mdf;Integrated Security=True"; // Replace with your SQL Server connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO Users (UserID, Name, Surname, Email, Password) VALUES (@ID, @Name, @Surname, @Email, @Password)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ID", userID);
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Surname", surname);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    int rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
        }

        private string GenerateRandomUserID()
        {
            // Generate a random 6-digit user ID
            Random random = new Random();
            int userID = random.Next(100000, 999999);
            return userID.ToString();
        }

        protected void btnSignUp_Click1(object sender, EventArgs e)
        {
            // Retrieve user input
            string name = txtName.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // Check if the user already exists in the database
            if (IsUserExists(email))
            {
                // User already exists, display an error message
                lblErrorMessage.Text = "User with this email already exists.";
                return;
            }

            // Generate a random user ID
            string userID = GenerateRandomUserID();

            // Add the user to the database
            if (AddUserToDatabase(userID, name, surname, email, password))
            {
                // Set the user ID cookie
                HttpCookie cookie = new HttpCookie("UserID", userID);
                cookie.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(cookie);

                // User added successfully, redirect to the home page
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Error occurred while adding the user, display an error message
                lblErrorMessage.Text = "Error occurred while signing up. Please try again.";
            }
        }
    }
}
