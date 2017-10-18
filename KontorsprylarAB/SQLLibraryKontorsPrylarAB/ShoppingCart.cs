using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLLibraryKontorsPrylarAB
{
    public class ShoppingCart
    {
        int ID;
        int CID;
        int AID;
        string articleName;
        string description;
        int price;

        public ShoppingCart(int ID, int CID, int AID, string articleName, string description, int price)
        {
            this.ID = ID;
            CID1 = CID;
            AID1 = AID;
            ArticleName = articleName;
            Description = description;
            Price = price;
        }

        public int ID1 { get => ID; }
        public int CID1 { get => CID; set => CID = value; }
        public int AID1 { get => AID; set => AID = value; }
        public string ArticleName { get => articleName; set => articleName = value; }
        public string Description { get => description; set => description = value; }
        public int Price { get => price; set => price = value; }
    }
}
