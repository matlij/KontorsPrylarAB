﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLLibraryKontorsPrylarAB;

namespace KontorsprylarAB
{
    public partial class showArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLStuff Sqlstuff = new SQLStuff();
            //Om man kommit in på detta form genom att klicka redigera, så skaa textboxarna fyllas i av artikelattribut från aktuellt artikelID

            if (Page.IsPostBack)
            {
                LabelStatus.Text = "Postback!";
            }

            if (Request["action"] == "Update")
            {
                int aid = Convert.ToInt32(Request.QueryString.Get("aid"));
                if (Request["aid"] != null)
                {
                    if (textboxArtName.Text.Trim().Length == 0)
                    {
                        Article article = Sqlstuff.ReadAllArticles().FirstOrDefault(x => x.ID1 == aid); //SKapa denna metod i sqlstuff, eller använd firstordefault???
                        textboxArtName.Text = article.ArticleName;
                        textboxArtDescription.Text = article.Description;
                        textboxArtPrice.Text = article.Price.ToString();
                    }
                }
            }
        }

        protected void buttonSubmitArticle_Click(object sender, EventArgs e)
        {
            SQLStuff sqlstuff = new SQLStuff();
            string name = textboxArtName.Text;
            string description = textboxArtDescription.Text;
            string priceString = textboxArtPrice.Text;
            int price = int.Parse(priceString);

            if (Request["action"] == "Add")
            {
                //Lägger till en ny artikel i tabellen Article
                Article newArticle = sqlstuff.AddArticle(name, description, price);
                if (newArticle != null)
                {
                    LabelStatus.Text = "Ny produkt tillagd!";
                }
            }

            else if (Request["action"] == "Update")
            {
                int aid = Convert.ToInt32(Request.QueryString.Get("aid"));

                int result = sqlstuff.UpdateArticle(aid, name, description, price);

                if (result > 0)
                {
                    LabelStatus.Text = "Produkt uppdaterad";
                }
            }

        }
    }
}