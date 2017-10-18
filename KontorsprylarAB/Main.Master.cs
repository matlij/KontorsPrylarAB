using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLLibraryKontorsPrylarAB;

namespace KontorsprylarAB
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Customer customer;

            if (Request["logout"] != null)
            {
                Session["customer"] = null;
            }

            if (Session["customer"] == null)
            {
                HyperLinkAccount.Text = "<span class=\"glyphicon glyphicon-user\">&nbsp;Registrera kund</span>";
                HyperLinkAccount.ToolTip = "Klicka här för att registrera en ny kund";
                HyperLinkAccount.NavigateUrl = "#";

                HyperLinkLoginState.Text = "<span class=\"glyphicon glyphicon-log-in\">&nbsp;Logga in</span>";
                HyperLinkLoginState.ToolTip = "Klicka här för att logga in";
                HyperLinkLoginState.NavigateUrl = "/login.aspx";
            }
            else
            {
                customer = (Customer)Session["customer"];

                HyperLinkAccount.Text = "<span class=\"glyphicon glyphicon-user\">&nbsp;" + customer.UserName + "</span>";
                //HyperLinkAccount.ToolTip = "Inloggad som " + customer.UserName;
                HyperLinkAccount.ToolTip = customer.UserName + ", " + customer.DeliveryStreet + ", " + customer.DeliveryCity;
                HyperLinkAccount.NavigateUrl = "#";

                HyperLinkLoginState.Text = "<span class=\"glyphicon glyphicon-log-out\">&nbsp;Logga ut</span>";
                HyperLinkLoginState.ToolTip = "Klicka här för att logga ut";
                HyperLinkLoginState.NavigateUrl = "/index.aspx";
            }
        }
    }
}
