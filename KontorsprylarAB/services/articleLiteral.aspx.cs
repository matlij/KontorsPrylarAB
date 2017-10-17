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
            


            if (Request["action"] == "addToCart")
            {
                int aid = Convert.ToInt32(Request["aid"]);

                int result = sqlStuff.AddArticleToOrder(2, aid);

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