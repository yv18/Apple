using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProjectFinal
{
    public partial class Register : System.Web.UI.Page
    {

        SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Group2Database"].ConnectionString);

        }

        protected void btnRegister_Click1(object sender, EventArgs e)
        {
            string query = "INSERT INTO Users (Id, FirstName, LastName, Email, Password) VALUES (@Id, @FirstName, @LastName, @Email, @Password)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                Random rnd = new Random();

                // Generate a random number
                int randomId = rnd.Next();

                //adding parameters for insert query
                command.Parameters.AddWithValue("@Id", randomId);
                command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                command.Parameters.AddWithValue("@LastName", txtLastName.Text);
                command.Parameters.AddWithValue("@Email", txtEmail.Text);
                command.Parameters.AddWithValue("@Password", txtPassword.Text);

                //opening the connection
                connection.Open();

                //executing the query
                command.ExecuteNonQuery();

                //displaying message and redirecting to login page
                Response.Write("<script>alert('Registration successful')</script>");
                Response.Write("<script>window.location.href='Login.aspx'</script>");
            }

        }
    }
}