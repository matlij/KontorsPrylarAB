using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLLibraryKontorsPrylarAB
{
    public class OrderHistory
    {
        int aid;
        int oid;
        string articleName;
        string description;
        int price;

        public OrderHistory(int aid, int oid, string articleName, string description, int price)
        {
            this.aid = aid;
            this.oid = oid;
            ArticleName = articleName;
            Description = description;
            Price = price;
        }

        public int Aid { get => aid; }
        public int Oid { get => oid; }
        public string ArticleName { get => articleName; set => articleName = value; }
        public string Description { get => description; set => description = value; }
        public int Price { get => price; set => price = value; }
    }
}
