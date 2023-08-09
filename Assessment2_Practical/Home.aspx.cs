using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assessment2_Practical
{
    public partial class Home : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                Calendar1.SelectionChanged += Calendar1_SelectionChanged1;
            }
            try
            {
                //Connect to data base
                connection = new SqlConnection(connStr);

                //Open and display all the data in the grid view

                connection.Open();
                //Sql string
                string sql = "SELECT TaskID,Title, Priority, DueDate, Status FROM Tasks";

                ds = new System.Data.DataSet();
                adapter = new SqlDataAdapter();
                command = new SqlCommand(sql, connection);

                adapter.SelectCommand = command;
                adapter.Fill(ds);

                // Check if there are no tasks for the selected date
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblError.Text = "No Tasks Have Been set as yet";
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
                else
                {
                    // Bind the GridView with the filtered data
                    lblError.Text = "";
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }

                connection.Close();

                
            }
            catch (SqlException ex)
            {
                lblError.Text = "Error: " + ex.ToString();
            }
        }
        
        protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
        {
            DateTime selectedDate = Calendar1.SelectedDate;

            try
            {
                // Connect to the database
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    // Open the connection
                    connection.Open();

                    // SQL query to filter tasks based on the selected date
                    string sql = "SELECT TaskID, Title, Priority, DueDate, Status FROM Tasks WHERE DueDate = @SelectedDate";

                    // Create a SqlCommand object
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        // Add a parameter for the selected date
                        command.Parameters.AddWithValue("@SelectedDate", selectedDate);

                        // Create a DataSet and fill it with the filtered data
                        ds = new System.Data.DataSet();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(ds);
                        }

                        // Check if there are no tasks for the selected date
                        if (ds.Tables[0].Rows.Count == 0)
                        {
                            lblError.Text = "No tasks have been set for the selected date.";
                            GridView1.DataSource = null;
                            GridView1.DataBind();
                        }
                        else
                        {
                            // Bind the GridView with the filtered data
                            lblError.Text = "";
                            GridView1.DataSource = ds;
                            GridView1.DataBind();
                        }
                        
                    }
                }
            }
            catch (SqlException ex)
            {
                lblError.Text = "Error: " + ex.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddTask.aspx");
        }

        protected void btnViewTaskDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("TaskDetail.aspx");
        }
    }
}