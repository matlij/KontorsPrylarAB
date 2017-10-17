using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace SQLLibraryKontorsPrylarAB
{
    public class SQLStuff
    {
        SqlConnection sqlConnection = new SqlConnection(@"Data Source=.;Initial Catalog=KontorsprylarAB;Integrated Security=True");

        public List<Article> ReadAllArticles()
        {
            List<Article> articles = new List<Article>();
            SqlCommand sqlCommand = new SqlCommand("select * from Article", sqlConnection);

            try
            {
                sqlConnection.Open();

                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    int id = Convert.ToInt32(sqlDataReader["ID"]);
                    string articleName = sqlDataReader["articleName"].ToString();
                    string description = sqlDataReader["description"].ToString();
                    int price = Convert.ToInt32(sqlDataReader["price"]);

                    articles.Add(new Article(id, articleName, description, price));
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnection.Close();
            }

            return articles;
        }

        public List<Order> ReadAllOrders()
        {
            List<Order> orders = new List<Order>();
            SqlCommand sqlCommand = new SqlCommand("select * from [Order]", sqlConnection);

            try
            {
                sqlConnection.Open();

                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    int id = Convert.ToInt32(sqlDataReader["id"]);
                    int cid = Convert.ToInt32(sqlDataReader["cid"]);

                    orders.Add(new Order(id, cid));
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnection.Close();
            }

            return orders;
        }

        public List<Customer> ReadAllCustomers()
        {
            List<Customer> customers = new List<Customer>();
            SqlCommand sqlCommand = new SqlCommand("select * from Customer", sqlConnection);

            try
            {
                sqlConnection.Open();

                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    int id = Convert.ToInt32(sqlDataReader["ID"]);
                    string userName = sqlDataReader["userName"].ToString();
                    string email = sqlDataReader["email"].ToString();
                    string password = sqlDataReader["password"].ToString();
                    string deliveryStreet = sqlDataReader["deliveryStreet"].ToString();
                    string deliveryCity = sqlDataReader["deliveryCity"].ToString();

                    customers.Add(new Customer(id, userName, email, password, deliveryStreet, deliveryCity));
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnection.Close();
            }

            return customers;
        }

        public Article AddArticle(string articleName, string description, int price)
        {
            Article newArticle;
            SqlCommand sqlCommand = new SqlCommand("AddArticle", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter paramArticleName = new SqlParameter("@articleName", SqlDbType.VarChar);
            paramArticleName.Value = articleName;
            sqlCommand.Parameters.Add(paramArticleName);

            SqlParameter paramPrice = new SqlParameter("@price", SqlDbType.Int);
            paramPrice.Value = price;
            sqlCommand.Parameters.Add(paramPrice);

            SqlParameter paramDescription = new SqlParameter("@description", SqlDbType.VarChar);
            paramDescription.Value = description;
            sqlCommand.Parameters.Add(paramDescription);

            SqlParameter paramAID = new SqlParameter("@aid", SqlDbType.Int);
            paramAID.Direction = ParameterDirection.Output;
            sqlCommand.Parameters.Add(paramAID);

            try
            {
                sqlConnection.Open();

                sqlCommand.ExecuteNonQuery();

                int id = int.Parse(paramAID.Value.ToString());

                newArticle = new Article(id, articleName, description, price);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnection.Close();
            }

            return newArticle;
        }

        public Customer RegisterCustomer(string userName, string eMail, string password, string deliveryCity, string deliveryStreet)
        {
            Customer newCustomer;
            SqlCommand sqlCommand = new SqlCommand("RegisterCustomer", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter paramUserName = new SqlParameter("@userName", SqlDbType.VarChar);
            paramUserName.Value = userName;
            sqlCommand.Parameters.Add(paramUserName);

            SqlParameter paramEmail = new SqlParameter("@email", SqlDbType.VarChar);
            paramEmail.Value = eMail;
            sqlCommand.Parameters.Add(paramEmail);

            SqlParameter paramPassword = new SqlParameter("@password", SqlDbType.VarChar);
            paramPassword.Value = password;
            sqlCommand.Parameters.Add(paramPassword);

            SqlParameter paramStreet = new SqlParameter("@deliveryStreet", SqlDbType.VarChar);
            paramStreet.Value = deliveryStreet;
            sqlCommand.Parameters.Add(paramStreet);

            SqlParameter paramCity = new SqlParameter("@deliveryCity", SqlDbType.VarChar);
            paramCity.Value = deliveryCity;
            sqlCommand.Parameters.Add(paramCity);

            SqlParameter paramCID = new SqlParameter("@cid", SqlDbType.Int);
            paramCID.Direction = ParameterDirection.Output;
            sqlCommand.Parameters.Add(paramCID);

            try
            {
                sqlConnection.Open();

                sqlCommand.ExecuteNonQuery();

                int id = int.Parse(paramCID.Value.ToString());

                newCustomer = new Customer(id, userName, eMail, password, deliveryCity, deliveryStreet);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnection.Close();
            }

            return newCustomer;

        }

        public Order RegisterOrder(int CID)
        {
            Order newOrder;
            SqlCommand sqlCommand = new SqlCommand("RegisterOrder", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter paramCID = new SqlParameter("@cid", SqlDbType.Int);
            paramCID.Value = CID;
            sqlCommand.Parameters.Add(paramCID);

            SqlParameter paramOID = new SqlParameter("@oid", SqlDbType.Int);
            paramOID.Direction = ParameterDirection.Output;
            sqlCommand.Parameters.Add(paramOID);

            try
            {
                sqlConnection.Open();

                sqlCommand.ExecuteNonQuery();

                int id = int.Parse(paramOID.Value.ToString());

                newOrder = new Order(id, CID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnection.Close();
            }

            return newOrder;
        }

        public int AddArticleToOrder(int OID, int AID)
        {
            //Retunera antalet artiklar som lagts till i ordern via results variabeln
            int result = 0;

            SqlCommand sqlCommand = new SqlCommand("AddArticleToOrder", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter paramOID = new SqlParameter("@oid", SqlDbType.Int);
            paramOID.Value = OID;
            sqlCommand.Parameters.Add(paramOID);

            SqlParameter paramAID = new SqlParameter("@aid", SqlDbType.Int);
            paramAID.Value = AID;
            sqlCommand.Parameters.Add(paramAID);

            try
            {
                sqlConnection.Open();
                result = sqlCommand.ExecuteNonQuery();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnection.Close();
            }

            return result;
        }
    }
}
