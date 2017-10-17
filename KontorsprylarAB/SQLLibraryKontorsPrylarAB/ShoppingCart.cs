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
        public ShoppingCart(int ID, int CID, int AID)
        {
            this.ID = ID;
            CID1 = CID;
            AID1 = AID;
        }

        public int ID1 { get => ID; }
        public int CID1 { get => CID; set => CID = value; }
        public int AID1 { get => AID; set => AID = value; }
    }
}
