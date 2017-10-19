using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLLibraryKontorsPrylarAB;

namespace KontorsprylarAB
{
    public partial class ShowCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SQLStuff Sqlstuff = new SQLStuff();
            //Om man kommit in på detta form genom att klicka redigera, så skaa textboxarna fyllas i av artikelattribut från aktuellt artikelID

            if (Request["action"] == "update")
            {
                customerform_h2.Text = "Uppdatera dina uppgifter";

                int cid = Convert.ToInt32(Request.QueryString.Get("cid"));
                if (Request["cid"] != null)
                {
                    if (textboxUserName.Text.Trim().Length == 0)
                    {
                        Customer customer = Sqlstuff.ReadAllCustomers().FirstOrDefault(x => x.ID1 == cid); //SKapa denna metod i sqlstuff, eller använd firstordefault???
                        textboxUserName.Text = customer.UserName;
                        textboxEmail.Text = customer.EMail;
                        textboxPassword.Text = customer.Password.ToString();
                        textboxStreet.Text = customer.DeliveryStreet;
                        textboxCity.Text = customer.DeliveryCity;
                    }
                }
            }

            else if (Request["action"] == "add")
            {
                customerform_h2.Text = "Registrera dig som kund";
            }
        }

        protected void buttonSubmitCustomer_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                SQLStuff sqlstuff = new SQLStuff();
                string name = textboxUserName.Text;
                string email = textboxEmail.Text;
                string password = textboxPassword.Text;
                string street = textboxStreet.Text;
                string city = textboxCity.Text;

                if (Request["action"] == "add")
                {
                    //Lägger till en ny kund i tabellen Customer
                    Customer newCustomer = sqlstuff.RegisterCustomer(name, email, password, street, city);
                    if (newCustomer != null)
                    {
                        LabelStatus.Text = "Grattis! Du är nu registrerad som kund hos Kontorsprylar AB!";
                    }

                    textboxUserName.Text = "";
                    textboxEmail.Text = "";
                    textboxPassword.Text = "";
                    textboxStreet.Text = "";
                    textboxCity.Text = "";
                }

                else if (Request["action"] == "update")
                {
                    int cid = Convert.ToInt32(Request.QueryString.Get("cid"));
                    int result = 0;
                    result = sqlstuff.UpdateCustomer(cid, name, email, password, street, city); //Lägg till denna metod i sqlLibrary

                    if (result > 0)
                    {
                        LabelStatus.Text = "Du har nu uppdaterat dina uppgifter";
                    }
                }
            }
        }
    }
}