using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using SQLLibraryKontorsPrylarAB;

namespace KontorsprylarAB
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["action"] == "addToCart")
            {
                SQLStuff stuffSQL = new SQLStuff();
                int aid = Convert.ToInt32(Request["aid"]);

                //Kundnr är hårdkodat till ID 1, behöver ändras till kund som är inloggad
                ShoppingCart articleToCart = stuffSQL.AddArticleToCart(1, aid);

                LabelAddToCart.Text = $"Artikel med ID {articleToCart.AID1.ToString()} har lagts till i varukorgen";

            }
        }
    }
}