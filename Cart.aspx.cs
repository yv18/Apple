using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProjectFinal
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //checking if user is logged in or not
                if (Session["client"] == null && Session["clientEmail"] == null && Session["clientPassword"] == null)
                {
                    Response.Write("<script>alert('Oops! You need to Login First.')</script>");
                    Response.Write("<script>window.location.href='Login.aspx'</script>");
                }

                // On Load this function populates the cart list
                List<string> item = Session["CartItem"] as List<string> ?? new List<string>();
                PopulateCartList(item);

                //if the cart is empty, checkout button will be disabled
                if (item.Count == 0)
                {
                    lblEmptyCartMessage.Visible = true;
                    totaltext.Visible = false;
                    btnCheckout.CssClass = "btn btn-checkout-empty";
                }
                //if not then it will calculate total
                else
                {
                    double total = CalculateTotalPrice(item);
                    totaltext.Text = $"Total: ${total:F2}";
                    lblEmptyCartMessage.Visible = false;
                    totaltext.Visible = true;
                    btnCheckout.CssClass = "btn btn-checkout";
                }

                // If the list is empty the checkout button will be disabled
                btnCheckout.Enabled = item.Count > 0;
            }
        }


        // function to add items into list when page loads
        private void PopulateCartList(List<string> items)
        {
            rptCartItems.DataSource = items;
            rptCartItems.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Getting the index of the item to delete from the CommandArgument of the button
            int index = int.Parse(((Button)sender).CommandArgument);

            // Removing the item at the specified index from the cart
            List<string> cartItems = Session["CartItem"] as List<string>;
            if (cartItems != null && cartItems.Count > index)
            {
                cartItems.RemoveAt(index);
                Session["CartItem"] = cartItems;

                // Repopulating cart list and updating total price
                PopulateCartList(cartItems);

                if (cartItems.Count == 0)
                {
                    lblEmptyCartMessage.Visible = true;
                    totaltext.Visible = false;
                }
                else
                {
                    double total = CalculateTotalPrice(cartItems);
                    totaltext.Text = $"Total: ${total:F2}";
                    lblEmptyCartMessage.Visible = false;
                    totaltext.Visible = true;
                }

                // Disabling checkout button if cart is empty
                btnCheckout.Enabled = cartItems.Count > 0;
            }
        }

        private double CalculateTotalPrice(List<string> item)
        {
            double total = 0;

            foreach (string cartItem in item)
            {
                string[] parts = cartItem.Split(new[] { " - " }, StringSplitOptions.None);

                // making sure item string is in the correct format
                if (parts.Length >= 2)
                {
                    string priceString = parts.Last().Replace("$", "").Trim();
                    double price;
                    if (double.TryParse(priceString, out price))
                    {
                        total += price;

                    }
                    else
                    {
                        // error log message
                        Console.WriteLine($"Invalid price format in cart item: {cartItem}");
                    }
                }
                else
                {
                    // error log
                    Console.WriteLine($"Invalid item format in cart item: {cartItem}");
                }
            }
            //storing total in a session for checkout page
            Session["grandTotal"] = total;
            return total;
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            //redirecting to checkout when button is clicked
            Response.Redirect("Checkout.aspx");
        }


        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            // Clearing the cart
            Session["CartItem"] = new List<string>();
            PopulateCartList(new List<string>());
            lblEmptyCartMessage.Visible = true;
            totaltext.Visible = false;
            totaltext.Text = "Total: $0.00";
            btnCheckout.Enabled = false;
        }

      
    }
}