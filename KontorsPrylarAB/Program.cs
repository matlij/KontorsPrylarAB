using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLLibraryKontorsPrylarAB;

namespace KontorsPrylarAB
{
    class Program
    {
        static void Main(string[] args)
        {
            SQLStuff stuffSQL = new SQLStuff();

            List<Article> articles = stuffSQL.ReadAllArticles();
            List<Order> orders = stuffSQL.ReadAllOrders();
            List<Customer> customers = stuffSQL.ReadAllCustomers();

            foreach (var order in orders)
                Console.WriteLine(order.ID1);
               
            foreach (var customer in customers)
                Console.WriteLine(customer.UserName);

            //Article newArticle = stuffSQL.AddArticle("Skrivhäfte", "Beskrivning Skrivhäfte", 100);
            //Console.WriteLine("Du har lagt till produkt: " + newArticle.ArticleName);

            //Customer newCustomer = stuffSQL.RegisterCustomer("Username-MatLij", "ML@gmail.com","Password", "Stockholm", "Folkungagatan");

            //Order newOrder = stuffSQL.RegisterOrder(5);

            stuffSQL.AddArticleToOrder(1, 1);
            stuffSQL.AddArticleToOrder(1, 2);

        }
    }
}
