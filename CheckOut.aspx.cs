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
    public partial class CheckOut : System.Web.UI.Page
    {
        SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            //on loading page we are assigning our connection string to sqlConnection variable and displaying grand total
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Group2Database"].ConnectionString);
            total.InnerText += Session["grandTotal"].ToString();


            if (Session["client"] == null && Session["clientEmail"] == null && Session["clientPassword"] == null)
            {
                Response.Write("<script>alert('Oops! You need to Login First.')</script>");
                Response.Write("<script>window.location.href='Login.aspx'</script>");
            }
            else
            {
                if (Session["clientEmail"] != null)
                {
                    txtEmail.Text = Session["clientEmail"].ToString(); // Assign value here
                }
            }

          
        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {

            string clientEmail = null; // Declare clientEmail variable outside if block

            if (Session["client"] == null && Session["clientEmail"] == null && Session["clientPassword"] == null)
            {
                Response.Write("<script>alert('Oops! You need to Login First.')</script>");
                Response.Write("<script>window.location.href='Login.aspx'</script>");
            }
            else
            {
                if (Session["clientEmail"] != null)
                {
                    clientEmail = Session["clientEmail"].ToString(); // Assign value here
                }
            }

            //getting today's date
            DateTime orderDate = DateTime.Today;

            //query to insert data in orders table
            string query = "INSERT INTO Orders (Id, firstName, lastName, email, mobileNumber, address, city, province, postalCode, cardNumber, cardHolderName, expiryDate, securityCode, grandTotal, orderDate) VALUES (@Id, @firstName, @lastName, @email, @mobileNumber, @address, @city, @province, @postalCode, @cardNumber, @cardHolderName, @expiryDate, @securityCode, @grandTotal, @orderDate)";

            Random rnd = new Random();

            // Generate a random number
            int randomId = rnd.Next();

            using (SqlCommand command = new SqlCommand(query, connection))
            {

                //adding parameteres for query
                command.Parameters.AddWithValue("@Id", randomId);
                command.Parameters.AddWithValue("@firstName", txtFirstName.Text);
                command.Parameters.AddWithValue("@lastName", txtLastName.Text);
                command.Parameters.AddWithValue("@email", clientEmail);
                command.Parameters.AddWithValue("@mobileNumber", txtMobileNumber.Text);
                command.Parameters.AddWithValue("@address", txtAddress.Text);
                command.Parameters.AddWithValue("@city", txtCity.Text);
                command.Parameters.AddWithValue("@province", txtProvince.Text);
                command.Parameters.AddWithValue("@postalCode", txtPostalCode.Text);
                command.Parameters.AddWithValue("@cardNumber", txtCardNumber.Text);
                command.Parameters.AddWithValue("@cardHolderName", txtCardHolderName.Text);
                command.Parameters.AddWithValue("@expiryDate", txtExpiryDate.Text);
                command.Parameters.AddWithValue("@securityCode", txtSecurityCode.Text);
                command.Parameters.AddWithValue("@grandTotal", Session["grandTotal"].ToString());
                command.Parameters.AddWithValue("@orderDate", orderDate.ToString("d"));

                //opening connection
                connection.Open();

                //executing the query
                command.ExecuteNonQuery();

                //emptying the session variables
                Session.Remove("CartItem");
                Session.Remove("grandTotal");

                //showing alert and redirecting to index page
                Response.Write("<script>alert('Order Placed Successfully.')</script>");
                Response.Write("<script>window.location.href='index.aspx'</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}