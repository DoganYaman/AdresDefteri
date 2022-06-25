using AdresDefteri.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AdresDefteri.DataLayer
{
    public class AddressDataHelper
    {
        
        private SqlConnection GetConnection()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["AdresDefteriDB"].ConnectionString;
            var con = new SqlConnection(connectionString);

            return con;
        }
        public int AddAddress(Address address)
        {
            var conn = GetConnection();

            var command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = @"INSERT INTO [dbo].[Kisiler]
                                       ([Ad]
                                       ,[Soyad]
                                       ,[TakmaAd]
                                       ,[DogumTarihi]
                                       ,[Cinsiyet]
                                       ,[Telefon1]
                                       ,[Telefon2]
                                       ,[Faks]
                                       ,[Eposta]
                                       ,[Adres]
                                       ,[Not])
                                 VALUES
                                      ( @Ad
                                       ,@Soyad
                                       ,@TakmaAd
                                       ,@DogumTarihi
                                       ,@Cinsiyet
                                       ,@Telefon1
                                       ,@Telefon2
                                       ,@Faks
                                       ,@Eposta
                                       ,@Adres
                                       ,@Not)";

            command.Parameters.Add(new SqlParameter("@Ad", address.Name));
            command.Parameters.Add(new SqlParameter("@Soyad", address.SurName));
            command.Parameters.Add(new SqlParameter("@TakmaAd", address.Nick));
            command.Parameters.Add(new SqlParameter("@DogumTarihi", address.BirthDate));
            command.Parameters.Add(new SqlParameter("@Cinsiyet", address.Gender));
            command.Parameters.Add(new SqlParameter("@Telefon1", address.MobileNumber));
            command.Parameters.Add(new SqlParameter("@Telefon2", address.HomeNumber));
            command.Parameters.Add(new SqlParameter("@Faks", address.Fax));
            command.Parameters.Add(new SqlParameter("@Eposta", address.Email));
            command.Parameters.Add(new SqlParameter("@Adres", address.UserAddress));
            command.Parameters.Add(new SqlParameter("@Not", address.Note));

            conn.Open();
            var retVal = command.ExecuteNonQuery();
            conn.Close();

            conn.Dispose();

            return retVal;
        }
        public List<Address> GetAddresses()
        {
            var retVal = new List<Address>();
            var conn = GetConnection();
            var command = new SqlCommand("SELECT * FROM Kisiler", conn);
            conn.Open();
            var reader = command.ExecuteReader();

            while (reader.Read())
            {
                retVal.Add(new Address
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = reader["Ad"].ToString(),
                    SurName = reader["Soyad"].ToString(),
                    Nick = reader["TakmaAd"].ToString(),
                    BirthDate = Convert.ToDateTime(reader["DogumTarihi"]),
                    Gender = reader["Cinsiyet"].ToString() == "0",
                    MobileNumber = reader["Telefon1"].ToString(),
                    HomeNumber = reader["Telefon2"].ToString(),
                    Fax = reader["Faks"].ToString(),
                    Email = reader["Eposta"].ToString(),
                    UserAddress = reader["Adres"].ToString(),
                    Note = reader["Not"].ToString()

                });
            }
            conn.Close();
            conn.Dispose();

            return retVal;
        }
        public Address GetAddress(int id)
        {
            var conn = GetConnection();
            var command = new SqlCommand("SELECT * FROM Kisiler WHERE Id=@id", conn);
            command.Parameters.AddWithValue("@id", id);

            conn.Open();
            var reader = command.ExecuteReader();
            Address address = new Address();
            while (reader.Read())
            {
                address = new Address
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = reader["Ad"].ToString(),
                    SurName = reader["Soyad"].ToString(),
                    Nick = reader["TakmaAd"].ToString(),
                    BirthDate = Convert.ToDateTime(reader["DogumTarihi"]),
                    Gender = reader["Cinsiyet"].ToString() == "0",
                    MobileNumber = reader["Telefon1"].ToString(),
                    HomeNumber = reader["Telefon2"].ToString(),
                    Fax = reader["Faks"].ToString(),
                    Email = reader["Eposta"].ToString(),
                    UserAddress = reader["Adres"].ToString(),
                    Note = reader["Not"].ToString()

                };
            }
            conn.Close();
            conn.Dispose();

            return address;
        }
        public int UpdateAddress(Address address)
        {
            if (address.Id <=0)
            {
                return 0;
            }
            var conn = GetConnection();

            var command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = @"UPDATE [dbo].[Kisiler]
                                   SET [Ad] = @Ad
                                      ,[Soyad] = @Soyad
                                      ,[TakmaAd] = @TakmaAd
                                      ,[DogumTarihi] = @DogumTarihi
                                      ,[Cinsiyet] = @Cinsiyet
                                      ,[Telefon1] = @Telefon1
                                      ,[Telefon2] = @Telefon2
                                      ,[Faks] = @Faks
                                      ,[Eposta] = @Eposta
                                      ,[Adres] = @Adres
                                      ,[Not] = @Not
                                     WHERE [Id]=@id";

            command.Parameters.Add(new SqlParameter("@id", address.Id));
            command.Parameters.Add(new SqlParameter("@Ad", address.Name));
            command.Parameters.Add(new SqlParameter("@Soyad", address.SurName));
            command.Parameters.Add(new SqlParameter("@TakmaAd", address.Nick));
            command.Parameters.Add(new SqlParameter("@DogumTarihi", address.BirthDate));
            command.Parameters.Add(new SqlParameter("@Cinsiyet", address.Gender));
            command.Parameters.Add(new SqlParameter("@Telefon1", address.MobileNumber));
            command.Parameters.Add(new SqlParameter("@Telefon2", address.HomeNumber));
            command.Parameters.Add(new SqlParameter("@Faks", address.Fax));
            command.Parameters.Add(new SqlParameter("@Eposta", address.Email));
            command.Parameters.Add(new SqlParameter("@Adres", address.UserAddress));
            command.Parameters.Add(new SqlParameter("@Not", address.Note));

            conn.Open();
            var retVal = command.ExecuteNonQuery();
            conn.Close();

            conn.Dispose();

            return retVal;
        }
        public int DeleteAddress(int id)
        {
            var conn = GetConnection();
            var command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = @"DELETE FROM [dbo].[Kisiler] WHERE Id=@id";
            command.Parameters.AddWithValue("@id", id);

            conn.Open();
            var reader = command.ExecuteNonQuery();
            conn.Close();
            conn.Dispose();
            return reader;

        }

        public List<Address> GetAddress(string keyword)
        {
            var allAddresses = GetAddresses();

            var data = allAddresses.Where(
                x =>
                    x.Name.Contains(keyword) ||
                    x.SurName.Contains(keyword) ||
                    x.Nick.Contains(keyword) ||
                    x.MobileNumber.Contains(keyword) ||
                    x.Email.Contains(keyword)
                    ).ToList();

            return data;
        }
    }
}