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

    public partial class Login : System.Web.UI.Page
    {
        SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Group2Database"].ConnectionString);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string username = email.Text.Trim();
            string userpassword = password.Text.Trim();


            string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                //adding parameters for query
                command.Parameters.AddWithValue("@Email", username);
                command.Parameters.AddWithValue("@Password", userpassword);

                connection.Open();

                
                int count = (int)command.ExecuteScalar();

                if (count > 0)
                {
                   
                    if (username == "admin@gmail.com" && userpassword == "Raj@2329")
                    {
                        Session["admin"] = true;
                        Response.Write("<script>alert('Welcome Admin.')</script>");
                        Response.Write("<script>window.location.href='Admin.aspx'</script>");
                    }
                    else
                    {
                        Session["client"] = true;
                        Session["clientEmail"] = username;
                        Session["clientPassword"] = userpassword;
                        Response.Write("<script>alert('Logged In Successfully.')</script>");
                        Response.Write("<script>window.location.href='index.aspx'</script>");
                    }
                }
                else
                {
                    Error.Text = "Invalid username or password. Please try again.";
                }
            }


        }
    }
}