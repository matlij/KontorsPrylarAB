using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using SQLLibraryKontorsPrylarAB;

namespace KontorsprylarAB.services
{
    public partial class articleLiteral : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLStuff sqlStuff = new SQLStuff();

            if (Request["action"] == "loadArticles")
            {
                string jsonString = JsonConvert.SerializeObject(sqlStuff.ReadAllArticles());

                literalArticles.Text = jsonString;
            }

            else if (Request["action"] == "readCart")
            {
                int cid = Convert.ToInt32(Request["cid"]);

                string jsonString = JsonConvert.SerializeObject(sqlStuff.ReadCart(cid));

                literalArticles.Text = jsonString;
            }

            else if (Request["action"] == "readOrderHistory")
            {
                if (Request["cid"] != null)
                {
                    int cid = Convert.ToInt32(Request["cid"]);

                    string jsonString = JsonConvert.SerializeObject(sqlStuff.ReadAllOrdersFromCID(cid));

                    literalArticles.Text = jsonString;
                }
            }

            else if (Request["action"] == "addToCart")
            {
                SQLStuff stuffSQL = new SQLStuff();
                int aid = Convert.ToInt32(Request["aid"]);
                int cid = Convert.ToInt32(Request["cid"]);

                Article addToCartArticle = sqlStuff.ReadAllArticles().FirstOrDefault(x => x.ID1 == aid);

                int result = stuffSQL.AddArticleToCart(cid, addToCartArticle);

                if (result > 0)
                    literalArticles.Text = "ok";
                else
                    literalArticles.Text = "error";
            }

            else if (Request["action"] == "removeFromCart")
            {
                int CartID = Convert.ToInt32(Request["CartID"]);
                int cid = Convert.ToInt32(Request["cid"]);

                int result = sqlStuff.RemoveItemFromCart(cid, CartID);

                if (result > 0)
                {

                    literalArticles.Text = "ok";
                }

                else
                {
                    literalArticles.Text = "error";
                }
            }

            else if (Request["action"] == "deleteAID")
            {
                int aid = Convert.ToInt32(Request["aid"]);

                int result = sqlStuff.RemoveArticle(aid);

                if (result == 0)
                {
                    literalArticles.Text = "error";
                }
                else
                {
                    literalArticles.Text = "ok";
                }
            }

            else if (Request["action"] == "checkUserName")
            {
                if (Session["customer"] != null)
                {
                    Customer customer = (Customer)Session["customer"];
                    literalArticles.Text = customer.UserName;
                }

            }

            else if (Request["action"] == "checkCustomerID")
            {
                if (Session["customer"] != null)
                {
                    Customer customer = (Customer)Session["customer"];
                    literalArticles.Text = customer.ID1.ToString();
                }

            }
        }
    }
}