using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLLibraryKontorsPrylarAB
{
    public class Order
    {
        int ID;
        int CID;

        public Order(int ID, int CID)
        {
            this.ID = ID;
            CID1 = CID;
        }

        public int ID1 { get => ID; }
        public int CID1 { get => CID; set => CID = value; }
    }
}
