using Guna.UI2.WinForms;
using Mid_project;
using MIDproject.BL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace MIDproject
{
    public partial class Form1 : Form
    {
        public doctor collecteduser;
        public user Userdata;
        
        public Form1()
        {
            InitializeComponent();
            loginpanel.Visible = true;
            adminSignUppanel.Visible = false;
            signup_patient.Visible = false;
            doctor_signin.Visible = false;
            adminpassword.UseSystemPasswordChar = true;
            guna2TextBox9.UseSystemPasswordChar = true;
            doctor_signup1.Visible = false;
            doctor_signup2.Visible = false;
            patient_signin.Visible = false;
            adddataintodepCOmbobox();    // code to add data into combo box of dcotor sign up
        }
        public void adddataintodepCOmbobox()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT Name FROM Department", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt); // Fill the DataTable with data from the database
            foreach (DataRow row in dt.Rows)
            {
                string val = row["Name"].ToString();
                if (!guna2ComboBox4.Items.Contains(val))
                {
                    guna2ComboBox4.Items.Add(val);
                }
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
     
        }

        private void Admin_Btn_Click(object sender, EventArgs e)
        {
            loginpanel.Visible = false;
            adminSignUppanel.Visible = true;
            adminSignUppanel.BringToFront();
        }


        private void Doc_btn_Click(object sender, EventArgs e)
        {
            loginpanel.Visible = false;
            doctor_signin.Visible = true;
        }

        private void Pat_btn_Click(object sender, EventArgs e)
        {
            patient_signin.Visible = true;
            loginpanel.Visible = false;
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            loginpanel.Visible = true;
            adminSignUppanel.Visible = false;
            signup_patient.Visible = false;
            doctor_signin.Visible = false;
        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            loginpanel.Visible = true;
            adminSignUppanel.Visible = false;
            signup_patient.Visible=false;
            doctor_signin.Visible=false;
        }
        public void adddataintouser(user data ) // add data for patient 
        {
            //  add address
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Insert into Address (@location, @city, @country)", con);
            cmd.Parameters.AddWithValue("@location", data.Addr.Loation);
            cmd.Parameters.AddWithValue("@city", data.Addr.City);
            cmd.Parameters.AddWithValue("@Country", data.Addr.Country);
            cmd.ExecuteNonQuery();

            //  id of addresss
            var con1 = Configuration.getInstance().getConnection();
            SqlCommand cmd1 = new SqlCommand("SELECT AddressID FROM Address WHERE Location = @location and City = @city and Country = @country", con1);
            cmd1.Parameters.AddWithValue("@location", data.Addr.Loation);
            cmd1.Parameters.AddWithValue("@city", data.Addr.City);
            cmd1.Parameters.AddWithValue("@Country", data.Addr.Country);
            object result = cmd1.ExecuteScalar();
            int addressid = Convert.ToInt32(result);

            // add data into user
            var con2 = Configuration.getInstance().getConnection();
            SqlCommand cmd2 = new SqlCommand("Insert into [User] values (@email, @password, @firstName, @lastName, @role, @status,@address,@gender)", con2);
            cmd2.Parameters.AddWithValue("@email", data.Email);
            cmd2.Parameters.AddWithValue("@password", data.Password);
            cmd2.Parameters.AddWithValue("@firstName", data.FirstName);
            cmd2.Parameters.AddWithValue("@lastName", data.LastName);
            cmd2.Parameters.AddWithValue("@role", 2);
            cmd2.Parameters.AddWithValue("@status", 6);
            cmd2.Parameters.AddWithValue("@address", addressid);
            cmd2.Parameters.AddWithValue("@gender", data.Gender == "Male" ? 9 : 10);
            cmd2.ExecuteNonQuery();
        }
        private void guna2GradientButton3_Click(object sender, EventArgs e)
        {
            //   sign up button for patient
            if (string.IsNullOrEmpty(guna2TextBox1.Text.Trim()))
            {
                errorProvider1.SetError(guna2TextBox1, "First Name is required");
            }
            else
            {
                errorProvider1.SetError(guna2TextBox1, string.Empty);
                if (string.IsNullOrEmpty(guna2TextBox4.Text.Trim()))
                {
                    errorProvider1.SetError(guna2TextBox4, "Email is required");
                }
                else
                {
                    errorProvider1.SetError(guna2TextBox4, string.Empty);
                    if (getvalidationforemail(guna2TextBox4))  // email validation 
                    {
                        errorProvider1.SetError(guna2TextBox4, "Email is already in use");
                    }
                    else
                    {
                        errorProvider1.SetError(guna2TextBox4, string.Empty);
                        if (string.IsNullOrEmpty(guna2TextBox2.Text.Trim()) && guna2TextBox2.Text.Length >= 8)
                        {
                            errorProvider1.SetError(guna2TextBox2, "Password is required and must be atleast 8 digit long");
                        }
                        else
                        {
                            errorProvider1.SetError(guna2TextBox2, string.Empty);
                            if (string.IsNullOrEmpty(guna2TextBox5.Text.Trim()))
                            {
                                errorProvider1.SetError(guna2TextBox5, "Location is required");
                            }
                            else
                            {
                                errorProvider1.SetError(guna2TextBox5, string.Empty);
                                if (string.IsNullOrEmpty(guna2TextBox7.Text.Trim()))
                                {
                                    errorProvider1.SetError(guna2TextBox7, "City is required");
                                }
                                else
                                {
                                    errorProvider1.SetError(guna2TextBox7, string.Empty);
                                    if (string.IsNullOrEmpty(guna2TextBox6.Text.Trim()))
                                    {
                                        errorProvider1.SetError(guna2TextBox6, "Country is required");
                                    }
                                    else
                                    {
                                        errorProvider1.SetError(guna2TextBox6, string.Empty);
                                        if (guna2ComboBox1.SelectedIndex == 0)
                                        {
                                            errorProvider1.SetError(guna2ComboBox1, "Gender is required");
                                        }
                                        else
                                        {
                                            errorProvider1.SetError(guna2ComboBox1, string.Empty);
                                            //   query for signup
                                            address data = new address(guna2TextBox5.Text, guna2TextBox7.Text, guna2TextBox6.Text);
                                            Userdata = new user(guna2TextBox4.Text, guna2TextBox2.Text, guna2TextBox1.Text, guna2TextBox3.Text, "Patient", "Active", guna2ComboBox1.Text, data);
                                            adddataintouser(Userdata);
                                            MessageBox.Show("Patient has been added successfully.");
                                            signup_patient.Visible = false;
                                            loginpanel.Visible = true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private void label9_Click(object sender, EventArgs e)
        {
            doctor_signin.Visible = true;
            signup_patient.Visible = false; 
            loginpanel.Visible = false;
            adminSignUppanel.Visible = false;

        }

        private void label7_Click(object sender, EventArgs e)
        {
            doctor_signin.Visible = false;
            doctor_signup1.Visible = true;
        }

        private void guna2GradientButton4_Click(object sender, EventArgs e)
        {
            loginpanel.Visible = true;
            adminSignUppanel.Visible = false;
            signup_patient.Visible = false;
            doctor_signin.Visible = false;
        }

        private void label12_Click(object sender, EventArgs e)
        {
            doctor_signin.Visible = true;
            signup_patient.Visible = false;
            loginpanel.Visible = false;
            adminSignUppanel.Visible = false;
        }

        private void guna2ControlBox1_Click(object sender, EventArgs e)
        {

        }

        private void guna2ToggleSwitch1_CheckedChanged(object sender, EventArgs e)
        {
            if (guna2ToggleSwitch1.Checked == true)
            {
                adminpassword.UseSystemPasswordChar = false;
            }
            if (guna2ToggleSwitch1.Checked == false)
            {
                adminpassword.UseSystemPasswordChar = true;
            }
        }

        private void guna2GradientButton5_Click(object sender, EventArgs e)
        {

        }

        private void guna2ToggleSwitch2_CheckedChanged(object sender, EventArgs e)
        {
            if (guna2ToggleSwitch2.Checked == true)
            {
                guna2TextBox9.UseSystemPasswordChar = false;
            }
            if (guna2ToggleSwitch2.Checked == false)
            {
                guna2TextBox9.UseSystemPasswordChar = true;
            }
        }

        private void guna2GradientButton4_Click_1(object sender, EventArgs e)
        {
            doctor_signin.Visible = false;
            loginpanel.Visible = true;
        }

        private void guna2GradientButton6_Click(object sender, EventArgs e)
        {
            doctor_signup1.Visible = false;
            loginpanel.Visible = true;
        }

        private void label26_Click(object sender, EventArgs e)
        {
            doctor_signin.Visible = true;
            doctor_signup1.Visible = false;
        }

        private void label30_Click(object sender, EventArgs e)
        {
           
        }

        private void guna2GradientButton8_Click(object sender, EventArgs e)
        {
            doctor_signup1.Visible = true;
            doctor_signup2.Visible = false;
        }

        private void label37_Click(object sender, EventArgs e)
        {
            signup_patient.Visible = true;
            patient_signin.Visible = false;
        }

        private void guna2GradientButton10_Click(object sender, EventArgs e)
        {
            patient_signin.Visible = false;
            loginpanel.Visible = true;
        }

        private void guna2GradientButton7_Click(object sender, EventArgs e)
        {
            //  next button of doctor signup
            if (string.IsNullOrEmpty(guna2TextBox16.Text.Trim()))
            {
                errorProvider1.SetError(guna2TextBox16, "First Name is required");
            }
            else
            {
                errorProvider1.SetError(guna2TextBox16, string.Empty);
                if (string.IsNullOrEmpty(guna2TextBox14.Text.Trim()))
                {
                    errorProvider1.SetError(guna2TextBox14, "Email is required");
                }
                else
                {
                    errorProvider1.SetError(guna2TextBox14, string.Empty);
                    if(getvalidationforemail(guna2TextBox14))  // email validation 
                    {
                        errorProvider1.SetError(guna2TextBox14, "Email is already in use");
                    }
                    else
                    {
                        errorProvider1.SetError(guna2TextBox14, string.Empty);
                        if (string.IsNullOrEmpty(guna2TextBox17.Text.Trim()) && guna2TextBox17.Text.Length >= 8)
                        {
                            errorProvider1.SetError(guna2TextBox17, "Password is required and must be atleast 8 digit long");
                        }
                        else
                        {
                            errorProvider1.SetError(guna2TextBox17, string.Empty);
                            if (string.IsNullOrEmpty(guna2TextBox13.Text.Trim()))
                            {
                                errorProvider1.SetError(guna2TextBox13, "Location is required");
                            }
                            else
                            {
                                errorProvider1.SetError(guna2TextBox13, string.Empty);
                                if (string.IsNullOrEmpty(guna2TextBox12.Text.Trim()))
                                {
                                    errorProvider1.SetError(guna2TextBox12, "City is required");
                                }
                                else
                                {
                                    errorProvider1.SetError(guna2TextBox12, string.Empty);
                                    if (string.IsNullOrEmpty(guna2TextBox11.Text.Trim()))
                                    {
                                        errorProvider1.SetError(guna2TextBox11, "Country is required");
                                    }
                                    else
                                    {
                                        errorProvider1.SetError(guna2TextBox11, string.Empty);
                                        if (guna2ComboBox2.SelectedIndex == 0)
                                        {
                                            errorProvider1.SetError(guna2ComboBox2, "Gender is required");
                                        }
                                        else
                                        {
                                            errorProvider1.SetError(guna2ComboBox2, string.Empty);
                                            //   query for signup
                                            doctor_signup1.Visible = false;
                                            doctor_signup2.Visible = true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        public bool getvalidationforemail(Guna2TextBox textbox)  //check whether email is int use or not
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT COUNT([User].ID) FROM [User] WHERE email = @email", con);
            cmd.Parameters.AddWithValue("@email", textbox.Text);
            object result = cmd.ExecuteScalar();
            int count = Convert.ToInt32(result);
            if (count == 0)
            {
                return false;
            }
            return true;
        }
        private void adminSignUp_Click(object sender, EventArgs e)
        {
            // sign in button  of admin
            if (string.IsNullOrEmpty(adminusername.Text.Trim()))
            {
                errorProvider1.SetError(adminusername, "email is required");
            }
            else
            {
                errorProvider1.SetError(adminusername, string.Empty);
                if (string.IsNullOrEmpty(adminpassword.Text.Trim()))
                {
                    errorProvider1.SetError(adminpassword, "Password is required");
                }
                else
                {
                    errorProvider1.SetError(adminpassword, string.Empty);
                    user admindata = new user(adminusername.Text, adminpassword.Text, "Admin");
                    //   check query for whether admin exist for not
                    var con = Configuration.getInstance().getConnection();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT([User].ID) FROM [User] JOIN Lookup ON Lookup.ID = [User].Role WHERE email = @email and Password = @Password and Lookup.Name = 'Admin'", con);
                    cmd.Parameters.AddWithValue("@email", adminusername.Text);
                    cmd.Parameters.AddWithValue("@Password", adminpassword.Text);
                    object result = cmd.ExecuteScalar();
                    int count = Convert.ToInt32(result);
                    if(count != 0)
                    {
                        MessageBox.Show("Login successful of admin");
                    }
                    else
                    {
                        MessageBox.Show("Incorrect Credientials");
                    }
                }
            }
        }

        private void guna2GradientButton11_Click(object sender, EventArgs e)
        {
            // patient sign in 
            if (string.IsNullOrEmpty(guna2TextBox19.Text.Trim()))
            {
                errorProvider1.SetError(guna2TextBox19, "email is required");
            }
            else
            {
                errorProvider1.SetError(guna2TextBox19, string.Empty);
                if (string.IsNullOrEmpty(guna2TextBox18.Text.Trim()))
                {
                    errorProvider1.SetError(guna2TextBox18, "Password is required");
                }
                else
                {
                    errorProvider1.SetError(guna2TextBox18, string.Empty);
                    user admindata = new user(guna2TextBox19.Text, guna2TextBox18.Text, "Patient");
                    //   check query for whether patient exist for not
                    var con = Configuration.getInstance().getConnection();
                    SqlCommand cmd = new SqlCommand("SELECT ([User].ID) FROM [User] JOIN Lookup ON Lookup.ID = [User].Role WHERE email = @email and Password = @Password and Lookup.Name = 'Patient'", con);
                    cmd.Parameters.AddWithValue("@email", adminusername.Text);
                    cmd.Parameters.AddWithValue("@Password", adminpassword.Text);
                    object result = cmd.ExecuteScalar();
                    string count = Convert.ToString(result);
                    if (count != null)
                    {
                        MessageBox.Show($"Login successful of patient and id is {count}");
                    }
                    else
                    {
                        MessageBox.Show("Incorrect Credientials");
                    }
                }
            }
        }
        
        public void codetoadddataintoDcotr(doctor data)    //   add data into doctor
        {
            //  add address
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Insert into Address (@location, @city, @country)", con);
            cmd.Parameters.AddWithValue("@location", data.Addr.Loation);
            cmd.Parameters.AddWithValue("@city", data.Addr.City);
            cmd.Parameters.AddWithValue("@Country", data.Addr.Country);
            cmd.ExecuteNonQuery();

            //  id of addresss
            var con1 = Configuration.getInstance().getConnection();
            SqlCommand cmd1 = new SqlCommand("SELECT AddressID FROM Address WHERE Location = @location and City = @city and Country = @country", con1);
            cmd1.Parameters.AddWithValue("@location", data.Addr.Loation);
            cmd1.Parameters.AddWithValue("@city", data.Addr.City);
            cmd1.Parameters.AddWithValue("@Country", data.Addr.Country);
            object result = cmd1.ExecuteScalar();
            int addressid = Convert.ToInt32(result);

            // add data into user
            var con2 = Configuration.getInstance().getConnection();
            SqlCommand cmd2 = new SqlCommand("Insert into [User] values (@email, @password, @firstName, @lastName, @role, @status,@address,@gender)", con2);
            cmd2.Parameters.AddWithValue("@email", data.Email);
            cmd2.Parameters.AddWithValue("@password", data.Password);
            cmd2.Parameters.AddWithValue("@firstName", data.FirstName);
            cmd2.Parameters.AddWithValue("@lastName", data.LastName);
            cmd2.Parameters.AddWithValue("@role", 3);
            cmd2.Parameters.AddWithValue("@status", 8);
            cmd2.Parameters.AddWithValue("@address", addressid);
            cmd2.Parameters.AddWithValue("@gender", data.Gender == "Male" ? 9 : 10);
            cmd2.ExecuteNonQuery();

            // get id of user
            var con3 = Configuration.getInstance().getConnection();
            SqlCommand cmd3 = new SqlCommand("SELECT ID FROM [User] WHERE email = @email", con3);
            cmd3.Parameters.AddWithValue("@email", data.Email);
            object result1 = cmd1.ExecuteScalar();
            int userid = Convert.ToInt32(result1);

            // add data into doctor
            var con4 = Configuration.getInstance().getConnection();
            SqlCommand cmd4 = new SqlCommand("Insert into Doctor values (@id, @depid, @qualification, @workinghour, @expertise, @Oncallavailability)", con4);
            cmd4.Parameters.AddWithValue("@id", userid);
            cmd4.Parameters.AddWithValue("@depid", getdepartmentid(data.Department));
            cmd4.Parameters.AddWithValue("@qualification", data.Qualification);
            cmd4.Parameters.AddWithValue("@workinghour", data.Workinghour);
            cmd4.Parameters.AddWithValue("@expertise", data.Expertise);
            cmd4.Parameters.AddWithValue("@Oncallavailability", data.Oncallavailalbity == "Available" ? 4 : 5);
            cmd4.ExecuteNonQuery();
            MessageBox.Show("The record of doctor added and wait for admin to approves your request.");
        }
        public int getdepartmentid(string name) //  get department id
        {
            var con1 = Configuration.getInstance().getConnection();
            SqlCommand cmd1 = new SqlCommand("SELECT ID FROM Department Name = @name", con1);
            cmd1.Parameters.AddWithValue("@name", name);
            object result = cmd1.ExecuteScalar();
            int id = Convert.ToInt32(result);
            return id;
        }
        private void guna2GradientButton9_Click(object sender, EventArgs e)
        {
            //  final signb up button of doctor
            if (guna2ComboBox4.SelectedIndex == 0)
            {
                errorProvider1.SetError(guna2ComboBox4, "Department is required");
            }
            else
            {
                errorProvider1.SetError(guna2ComboBox4, string.Empty);
                if (string.IsNullOrEmpty(guna2TextBox21.Text.Trim()))
                {
                    errorProvider1.SetError(guna2TextBox21, "Qualification is required");
                }
                else
                {
                    errorProvider1.SetError(guna2TextBox21, string.Empty);
                    if (guna2ComboBox5.SelectedIndex == 0)
                    {
                        errorProvider1.SetError(guna2ComboBox5, "Working hour schedule is required");
                    }
                    else
                    {
                        errorProvider1.SetError(guna2ComboBox5, string.Empty);
                        if (string.IsNullOrEmpty(guna2TextBox20.Text.Trim()))
                        {
                            errorProvider1.SetError(guna2TextBox20, "Expertise are required");
                        }
                        else
                        {
                            errorProvider1.SetError(guna2TextBox20, string.Empty);
                            if (guna2ComboBox3.SelectedIndex == 0)
                            {
                                errorProvider1.SetError(guna2ComboBox3, "OnCallAvailability is required");
                            }
                            else
                            {
                                errorProvider1.SetError(guna2ComboBox3, string.Empty);
                                //   query for sign up of doctor
                                address ad = new address(guna2TextBox13.Text, guna2TextBox12.Text, guna2TextBox11.Text);
                                collecteduser = new doctor(guna2TextBox16.Text, guna2TextBox17.Text, guna2TextBox16.Text, guna2TextBox15.Text, "Doctor", guna2ComboBox2.Text, ad,guna2ComboBox4.Text,guna2TextBox21.Text,guna2ComboBox5.Text,guna2TextBox20.Text,guna2ComboBox3.Text);
                                codetoadddataintoDcotr(collecteduser);
                                doctor_signup2.Visible = false;
                                loginpanel.Visible = true;
                            }
                        }
                    }
                }
            }
        }
    }
}
