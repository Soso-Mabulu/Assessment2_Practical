using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assessment2_Practical
{
    public partial class Profile : System.Web.UI.Page
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
                // Check if the user is logged in
                if (Request.Cookies["UserID"] != null)
                {
                    // Retrieve and display user details
                    string userID = Request.Cookies["UserID"].Value;
                    RetrieveUserDetails(userID);
                }
                else
                {
                    // User is not logged in, redirect to login page
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void RetrieveUserDetails(string userID)
        {
            // Retrieve user details from the database
            string query = "SELECT UserID, Name, Surname, Email, Password FROM Users WHERE UserID = @UserID";

            using (connection)
            {
                connection.Open();
                command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserID", userID);
                reader = command.ExecuteReader();

                if (reader.Read())
                {
                    lblID.Text = reader["UserID"].ToString();
                    lblName.Text = reader["Name"].ToString();
                    lblSurname.Text = reader["Surname"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                    lblPassword.Text = reader["Password"].ToString();

                    // Set the welcome message with the user's full name
                    string fullName = reader["Name"].ToString() + " " + reader["Surname"].ToString();
                    lblFullName.Text = fullName;
                }

                reader.Close();
                connection.Close();
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            // Redirect to the edit profile page
            Response.Redirect("EditProfile.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
