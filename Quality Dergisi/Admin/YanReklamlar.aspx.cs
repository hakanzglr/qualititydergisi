using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {


 
 
        }

     

    

        protected void sagkaydet(object sender, EventArgs e)
        {
            if (sagfile.HasFile == true)
            {

                SqlCommand yenisorgu = new SqlCommand("update reklamlar set resim=@resim,adres=@adres where baslik like 'sagdost'", baglanti.baglanti());
                yenisorgu.Parameters.AddWithValue("@resim", sagresimadres.Value.ToString()); 
                yenisorgu.Parameters.AddWithValue("@adres", sagadres.Value.ToString());
                yenisorgu.ExecuteNonQuery();
                Response.Redirect("YanReklamlar.aspx");
            }
            else
            {

                hata();
            }
        }

        protected void solkaydet(object sender, EventArgs e)
        {
            if (solfile.HasFile == true)
            {
                SqlCommand yenisorgu = new SqlCommand("update reklamlar set resim=@resim,adres=@adres where baslik like 'soldost'", baglanti.baglanti());
                yenisorgu.Parameters.AddWithValue("@resim",solresimadres.Value.ToString());
                yenisorgu.Parameters.AddWithValue("@adres", soladres.Value.ToString());
                yenisorgu.ExecuteNonQuery();
                Response.Redirect("YanReklamlar.aspx");

            }
            else
            {

                hata();
            }
        }

   


        public void hata()
        {


            Response.Write("<script> alert('Dosya Seçmediniz');</script>");

        }
    }
}