using System.Linq;
using System.Windows.Forms;

namespace kütüphane_modelFirst
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        Model1Container1 db = new Model1Container1();



        private void Form1_Load(object sender, System.EventArgs e)
        {
            dataGridView1.DataSource = db.Books.ToList();
            dataGridView2.DataSource = db.Members.ToList();
            dataGridView3.DataSource = db.Actions.ToList();


            dataGridView1.Columns[dataGridView1.Columns.Count - 1].Visible = false;

            dataGridView2.Columns[dataGridView2.Columns.Count - 1].Visible = false;

            dataGridView3.Columns[dataGridView3.Columns.Count - 1].Visible = false;

            dataGridView3.Columns[dataGridView3.Columns.Count - 2].Visible = false;

        }

        private void button3_Click(object sender, System.EventArgs e)
        {
            KitapEkle kitapEkle = new KitapEkle();
            kitapEkle.Show();
            this.Hide();
        }



        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            if (e.ColumnIndex == 0)
            {
                KitapGuncelle kitapGuncelle = new KitapGuncelle();
                kitapGuncelle.Show();
                kitapGuncelle.textBox1.Text = satir.Cells["bookNo"].Value.ToString();
                kitapGuncelle.textBox2.Text = satir.Cells["bookName"].Value.ToString();
                kitapGuncelle.textBox3.Text = satir.Cells["writer"].Value.ToString();
                kitapGuncelle.textBox4.Text = satir.Cells["printDate"].Value.ToString();


            }
            if (e.ColumnIndex == 1)
            {
                KitapSil kitapSil = new KitapSil();
                kitapSil.Show();
                kitapSil.label1.Text = satir.Cells["bookName"].Value.ToString();
                kitapSil.label1.Tag = satir.Cells["bookNo"].Value.ToString();
                this.Hide();
            }

        }
    }
}
