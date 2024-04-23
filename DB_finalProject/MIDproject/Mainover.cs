using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MIDproject
{
    public partial class Mainover : Form
    {
        public Mainover()
        {
            InitializeComponent();
        }

        //private void guna2ControlBox1_Click(object sender, EventArgs e)
        //{
        //    Environment.Exit(0);
        //}

        private void Mainover_Load(object sender, EventArgs e)
        {
            guna2ShadowForm1.SetShadowForm(this);
            label_val.Text = "Main Page";

            container(new Form2());
        }
        private void container(object _form)
        {

            if (guna2Panel_container.Controls.Count > 0) guna2Panel_container.Controls.Clear();

            Form fm = _form as Form;
            fm.TopLevel = false;
            fm.FormBorderStyle = FormBorderStyle.None;
            fm.Dock = DockStyle.Fill;
            guna2Panel_container.Controls.Add(fm);
            guna2Panel_container.Tag = fm;
            fm.Show();

        }
        private void guna2Panel_container_Paint(object sender, PaintEventArgs e)
        {

        }



        private void guna2Button3_Click_1(object sender, EventArgs e)
        {
            guna2ShadowForm1.SetShadowForm(this);
            label_val.Text = "Student CRUD";

          //  container(new Student());
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            guna2ShadowForm1.SetShadowForm(this);
            label_val.Text = "Attendence";

            //container(new Attendence());
        }

        private void guna2Button8_Click(object sender, EventArgs e)
        {
            guna2ShadowForm1.SetShadowForm(this);
            label_val.Text = "Attendence";

            //container(new CLOS());
        }

        private void guna2Button5_Click(object sender, EventArgs e)
        {
            guna2ShadowForm1.SetShadowForm(this);
            label_val.Text = "Rubrics";

            //container(new Rubrics());
        }

        private void guna2Button6_Click(object sender, EventArgs e)
        {
            guna2ShadowForm1.SetShadowForm(this);
            label_val.Text = "Rubrics Level";

            //container(new RubricLvl());
        }
    }
}
