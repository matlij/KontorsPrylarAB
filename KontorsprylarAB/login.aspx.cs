using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLLibraryKontorsPrylarAB;

namespace KontorsprylarAB
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string username = TextBoxUsername.Text;
                string password = TextBoxPassword.Text;

                Customer customer = SQLStuff.ValidateUser(username, password);

                if (customer != null)
                {
                    Session["customer"] = customer;
                    Response.Redirect("/index.aspx");

                }
                else
                    LabelInfo.Text = "Wrong username/password, try again.";
            }
        }
    }
}