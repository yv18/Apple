using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProjectFinal
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populatedropdown();
            }

        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {

            if (Session["client"] == null && Session["clientEmail"] == null && Session["clientPassword"] == null)
            {
                Response.Write("<script>alert('Oops! You need to Login First.')</script>");
                Response.Write("<script>window.location.href='Login.aspx'</script>");
            }

            //when addToCart button is clicked, we are fetching name of product, its price and selected quantity
            Button btnAddToCart = (Button)sender;
            string[] args = btnAddToCart.CommandArgument.Split('|');
            string productName = args[0];
            double productPrice = Convert.ToDouble(args[1]);

            TextBox txtQuantity = (TextBox)btnAddToCart.Parent.FindControl("txtQuantity");

            int quantity;
            if (int.TryParse(txtQuantity.Text, out quantity))
            {
                //making a string of name, quantity and total and adding it to session
                double total = quantity * productPrice;
                string Item = $"{productName} - Qty {quantity} - ${total}";

                //if cart will be empty it will create new list otherwise add to existing cart list
                List<string> cartItem = Session["CartItem"] as List<string> ?? new List<string>();
                cartItem.Add(Item);
                Session["CartItem"] = cartItem;
            }
            else
            {
                Error.Text = "Please enter a valid quantity.";
            }
        }

        private void populatedropdown()
        {
            DropDownList1.DataBind();
            
        }



        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}