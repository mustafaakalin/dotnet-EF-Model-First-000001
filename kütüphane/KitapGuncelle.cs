using System.Windows.Forms;

namespace kütüphane_modelFirst
{
    public partial class KitapGuncelle : Form
    {
        public KitapGuncelle()
        {
            InitializeComponent();
        }

        Model1Container1 db = new Model1Container1();

        private void button1_Click(object sender, System.EventArgs e)
        {
            int bookNo = Convert.ToInt32(textBox1.Text);
            var update = db.Books.Where(x => x.BookNo == bookNo).FirstOrDefault();
            
            db.SaveChanges();
        }
    }
}
