using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProjectFinal
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["client"] == null && Session["clientEmail"] == null && Session["clientPassword"] == null)
            {
                Response.Write("<script>alert('Oops! You need to Login First.')</script>");
                Response.Write("<script>window.location.href='Login.aspx'</script>");
            }
            else
            {
                if (Session["clientEmail"] != null)
                {
                    emailId.Text = Session["clientEmail"].ToString();
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}