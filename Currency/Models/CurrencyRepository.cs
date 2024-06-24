using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace Currency.Models
{
    public class CurrencyRepository
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CurrencyDBConnectionString"].ConnectionString;

        public List<CurrencyRate> GetCurrencyRates()
        {
            List<CurrencyRate> rates = new List<CurrencyRate>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT CurrencyCode, Rate FROM CurrencyRates", connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    rates.Add(new CurrencyRate
                    {
                        CurrencyCode = reader["CurrencyCode"].ToString(),
                        Rate = Convert.ToDecimal(reader["Rate"])
                    });
                }
            }

            return rates;
        }
    }
}
