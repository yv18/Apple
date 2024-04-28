using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProjectFinal
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                //checking if admin is logged in or not, if not then page won't be displayed and will redirect to index page
                Response.Write("<script>alert('Oops!! Only Admins can access this page.')</script>");
                Response.Write("<script>window.location.href='index.aspx'</script>");
            }
        }
    }
}