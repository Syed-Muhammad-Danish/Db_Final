using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIDproject.BL
{
    public class doctor:user
    {
        private string department;
        private string qualification;
        private string workinghour;
        private string expertise;
        private string oncallavailalbity;
        private int charges;
        public doctor()
        {

        }
        public doctor(string email, string password, string firstName, string lastName, string role, string gender, address add, string department, string qualification, string workinghour, string expertise, string oncallavailalbity)
        {
            this.Email = email;
            this.Password = password;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Role = role;
            this.Gender = gender;
            this.Addr = add;
            this.Department = department;
            this.Qualification = qualification;
            this.Workinghour = workinghour;
            this.Expertise = expertise;
            this.Oncallavailalbity = oncallavailalbity;
        }

        public string Department { get => department; set => department = value; }
        public string Qualification { get => qualification; set => qualification = value; }
        public string Workinghour { get => workinghour; set => workinghour = value; }
        public string Expertise { get => expertise; set => expertise = value; }
        public string Oncallavailalbity { get => oncallavailalbity; set => oncallavailalbity = value; }
        public int Charges { get => charges; set => charges = value; }
    }
}
