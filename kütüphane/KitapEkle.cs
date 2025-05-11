using System;
using System.Data;
using System.Globalization;
using System.Windows.Forms;

namespace kütüphane_modelFirst
{
    public partial class KitapEkle : Form
    {

        public void cleanMethod()
        {
            foreach (Control control in this.Controls)
            {
                //if (x is TextBox)
                //{
                //    x.TextBox = "";
                //}

                if (control != null)
                {
                    control.Dispose();
                }
            }

        }
        public KitapEkle()
        {
            InitializeComponent();
        }

        Model1Container1 db = new Model1Container1();

        private void button1_Click(object sender, System.EventArgs e)
        {
            Books save  = new Books();
            save.bookNo=Convert.ToInt32(this.textBox1.Text);
            save.bookName = Convert.ToString(this.textBox2.Text);
            save.writer= Convert.ToString(this.textBox3.Text);
            save.printDate = Convert.ToInt16(this.textBox4.Text);

            db.Books.Add(save);
            db.SaveChanges();

            MessageBox.Show("BOOK ADD SUCCESSFULY");
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Close();
        }
    }
}
