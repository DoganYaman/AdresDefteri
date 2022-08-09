using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdresDefteri.Model
{
    public class Address
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string SurName { get; set; }
        public string Nick { get; set; }
        public DateTime BirthDate { get; set; }
        public bool Gender { get; set; }
        public string MobileNumber { get; set; }
        public string HomeNumber { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string UserAddress { get; set; }
        public string Note { get; set; }
    }
}