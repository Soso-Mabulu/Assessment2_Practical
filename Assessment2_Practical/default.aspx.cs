using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assessment2_Practical
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Authentication.aspx");
        }

        protected void btnTime_Click(object sender, EventArgs e)
        {

        }

        protected void btnActivity_Click(object sender, EventArgs e)
        {
            // Here you can perform any actions you want when the "Learn More" button for Activity Planning is clicked.
            // For example, you could display additional information, navigate to another page, or open a modal.
            // For demonstration purposes, let's display a simple alert using JavaScript.

            // Register a JavaScript snippet to show an alert
            string script = "alert('Activity Planning details will be shown here.');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, true);
        }

        protected void btnTask_Click(object sender, EventArgs e)
        {
            // Here you can perform any actions you want when the "Learn More" button for Task Management is clicked.
            // For example, you could display additional information, navigate to another page, or open a modal.
            // For demonstration purposes, let's display a simple alert using JavaScript.

            // Register a JavaScript snippet to show an alert
            string script = "alert('Task Management details will be shown here.');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Authentication.aspx");
        }
    }
}