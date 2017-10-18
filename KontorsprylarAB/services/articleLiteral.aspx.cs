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

            if (Request["action"] == "readCart")
            {
                int cid = Convert.ToInt32(Request["cid"]);

                string jsonString = JsonConvert.SerializeObject(sqlStuff.ReadCart(cid));

                literalArticles.Text = jsonString;
            }

            if (Request["action"] == "addToCart")
            {
                SQLStuff stuffSQL = new SQLStuff();
                int aid = Convert.ToInt32(Request["aid"]);

                Article addToCartArticle = sqlStuff.ReadAllArticles().FirstOrDefault(x => x.ID1 == aid);

                //Kundnr är hårdkodat till ID 1, behöver ändras till kund som är inloggad
                int result = stuffSQL.AddArticleToCart(1, addToCartArticle);

                if (result > 0)
                    literalArticles.Text = "ok";
                else
                    literalArticles.Text = "error";
            }

            if (Request["action"] == "removeFromCart")
            {
                int CartID = Convert.ToInt32(Request["CartID"]);

                //Kundnr hårdkodat!
                int result = sqlStuff.RemoveItemFromCart(1, CartID);

                if (result > 0)
                {

                    literalArticles.Text = "Hurra!!!";
                }

                else
                {
                    literalArticles.Text = "Error";
                }
            }
        }
    }
}