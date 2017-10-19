﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLLibraryKontorsPrylarAB
{
    public class Customer
    {
        int ID;
        string userName;
        string eMail;
        string password;
        string deliveryStreet;
        string deliveryCity;

        public Customer(int ID, string userName, string eMail, string password, string deliveryStreet, string deliveryCity)
        {
            this.ID = ID;
            UserName = userName;
            EMail = eMail;
            Password = password;
            DeliveryStreet = deliveryStreet;
            DeliveryCity = deliveryCity;
        }

        public int ID1 { get => ID; }
        public string UserName { get => userName; set => userName = value; }
        public string EMail { get => eMail; set => eMail = value; }
        public string Password { get => password; set => password = value; }
        public string DeliveryStreet { get => deliveryStreet; set => deliveryStreet = value; }
        public string DeliveryCity { get => deliveryCity; set => deliveryCity = value; }
    }
}
