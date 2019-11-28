using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        int aktvalue, yetki;

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Kaydet_Click1(object sender, EventArgs e)
        {

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string filename = "";
            if (akt.Checked)
            {
                aktvalue = 1;
            }
            else
                aktvalue = 0;
            if (kullanici_yetki.Checked)
                yetki = 1;
            else
                yetki = 0;
            if (resim != null &&   //gelen resmin içeriğinin kontrol edilmesi
               (resim.PostedFile.ContentType == "image/jpeg" ||
                resim.PostedFile.ContentType == "image/jp" ||
                resim.PostedFile.ContentType == "image/png"))
                
            {
                filename = $"user_{kullanici_ad.Value}.{resim.PostedFile.ContentType.Split('/')[1]}"; //resmin içeriğine göre kaydedilme formatını ayarlıyorz.fotografn adı user_onunidsi olacak şekilde düzenledk
               string resim1 = Server.MapPath($"~/Admin/img/galeri/thumbnail/{filename}");  //resmn nereye kaydedileciğini belirttik burada
                resim.PostedFile.SaveAs(resim1);
               
            }

           

            SqlCommand ordbul = new SqlCommand("select max(ord) ord from yazarlar",baglanti.baglanti());
            int ords = Convert.ToInt32(ordbul.ExecuteScalar());
            ords = ords+1;
            SqlCommand kayit = new SqlCommand("insert into yazarlar (kullanici_ad,kullanici_sifre,ad,unvan,resim,bolum_ad,email,ord,web,akt,kullanici_yetki) values(@kullanici_ad,@kullanici_sifre,@ad,@unvan,@resim,@bolum_ad,@email,@ord,@web,@akt,@kullanici_yetki)",baglanti.baglanti());
            kayit.Parameters.AddWithValue("@kullanici_ad", kullanici_ad.Value.ToString());
            kayit.Parameters.AddWithValue("@kullanici_sifre", kullanici_sifre.Value.ToString());
            kayit.Parameters.AddWithValue("@ad", ad.Value.ToString());
            kayit.Parameters.AddWithValue("@unvan", unvan.Value.ToString());
            kayit.Parameters.AddWithValue("@resim", filename);
            kayit.Parameters.AddWithValue("@bolum_ad", bolum_ad.Value.ToString());
            kayit.Parameters.AddWithValue("@email", email.Value.ToString());
            kayit.Parameters.AddWithValue("@ord", ords);
            kayit.Parameters.AddWithValue("@web", web.Value.ToString());
            kayit.Parameters.AddWithValue("@akt", Convert.ToInt16(aktvalue));
            kayit.Parameters.AddWithValue("@kullanici_yetki", Convert.ToInt16(yetki));
            kayit.ExecuteNonQuery();
            baglanti.son();

            Response.Redirect("Yazarlar.aspx?id=ok");



        }



    }
}