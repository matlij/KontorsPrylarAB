using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLLibraryKontorsPrylarAB
{
    public class Article
    {
        int ID;
        string articleName;
        string description;
        int price;

        public Article(int ID, string articleName, string description, int price)
        {
            this.ID = ID;
            ArticleName = articleName;
            Description = description;
            Price = price;
        }

        public int ID1 { get => ID; }
        public string ArticleName { get => articleName; set => articleName = value; }
        public string Description { get => description; set => description = value; }
        public int Price { get => price; set => price = value; }

    }
}
