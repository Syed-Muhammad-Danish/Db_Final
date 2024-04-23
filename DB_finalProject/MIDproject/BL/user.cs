using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace MIDproject.BL
{
    public class user
    {
        private int id;
        private string email;
        private string password;
        private string firstName;
        private string lastName;
        private string role;
        private string status;
        private string gender;
        private address add;
        public user()
        {

        }
        public user(string email, string password, string firstName, string lastName, string role, string status, string gender, address add)
        {
            this.Email = email;
            this.Password = password;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Role = role;
            this.Status = status;
            this.Gender = gender;
            this.Addr = add;
        }
        public user(string email, string password, String role)
        {
            this.Email = email;
            this.Password = password;
            this.Role = role;
        }
        public int Id { get => id; set => id = value; }
        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string Role { get => role; set => role = value; }
        public string Status { get => status; set => status = value; }
        public string Gender { get => gender; set => gender = value; }
        public address Addr { get => add; set => add = value; }
    }
    public class address
    {
        private int id;
        private string loation;
        private string city;
        private string country;
        public address()
        {

        }
        public address(string loation, string city, string country)
        {
            this.Loation = loation;
            this.City = city;
            this.Country = country;
        }

        public int Id { get => id; set => id = value; }
        public string Loation { get => loation; set => loation = value; }
        public string City { get => city; set => city = value; }
        public string Country { get => country; set => country = value; }
    }

}
