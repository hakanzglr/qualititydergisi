using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class YazarDetayDuzenle : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        string yazar_id = "";
        bool yetki;
        int aktvalue, yetkis;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                yazar_id = Request.QueryString["yazar_id"].ToString();
                if (Page.IsPostBack)
                {


                }
                else
                {
                  
                    SqlCommand haberdetaysorgu = new SqlCommand("select * from yazarlar where yazar_id=" + yazar_id + "", baglanti.baglanti());
                    SqlDataReader yazardetayokur = haberdetaysorgu.ExecuteReader();
                    while (yazardetayokur.Read())
                    {
                       yetki= yazardetayokur["kullanici_yetki"].ToString() == "1" ? yetki = true : yetki = false;
                           
                        kullanici_ad.Value = yazardetayokur["kullanici_ad"].ToString();
                        kullanici_sifre.Value = yazardetayokur["kullanici_sifre"].ToString();
                        ad.Value = yazardetayokur["ad"].ToString();
                        unvan.Value = yazardetayokur["ad"].ToString();
                        //resim.Page = "../Admin/img/galeri/thumbnail/" + yazardetayokur["resim"].ToString();
                        bolum_ad.Value = yazardetayokur["bolum_ad"].ToString();
                        email.Value = yazardetayokur["email"].ToString();
                        web.Value = yazardetayokur["web"].ToString();
                        akt.Checked = yazardetayokur["akt"].GetType().IsValueType;
                        kullanici_yetki.Checked = yetki;
                        ord.Value = yazardetayokur["ord"].ToString(); 

                }

                    baglanti.son();
                   

                }
                
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string filename = "";
            yazar_id = Request.QueryString["yazar_id"].ToString();
           
        filename = $"user_{kullanici_ad.Value}.{resim.PostedFile.ContentType.Split('/')[1]}"; //resmin içeriğine göre kaydedilme formatını ayarlıyorz.fotografn adı user_onunidsi olacak şekilde düzenledk
        string resim1 = Server.MapPath($"~/Admin/img/galeri/thumbnail/{filename}");  //resmn nereye kaydedileciğini belirttik burada
        resim.PostedFile.SaveAs(resim1);
            
            if (akt.Checked)
            {
                aktvalue = 1;
            }
            else
                aktvalue = 0;
            if (kullanici_yetki.Checked)
                yetkis = 1;
            else
                yetkis = 0;
            SqlCommand guncelle = new SqlCommand("update yazarlar set kullanici_ad=@kullanici_ad,kullanici_sifre=@kullanici_sifre,ad=@ad,unvan=@unvan,resim=@resim,bolum_ad=@bolum_ad,email=@email,ord=@ord,web=@web,akt=@akt,kullanici_yetki=@kullanici_yetki  where yazar_id='"+yazar_id+"'", baglanti.baglanti());

            guncelle.Parameters.AddWithValue("@kullanici_ad", kullanici_ad.Value);
            guncelle.Parameters.AddWithValue("@kullanici_sifre", kullanici_sifre.Value);
            guncelle.Parameters.AddWithValue("@ad", ad.Value);
            guncelle.Parameters.AddWithValue("@unvan", unvan.Value);
            guncelle.Parameters.AddWithValue("@resim", filename);
            guncelle.Parameters.AddWithValue("@bolum_ad", bolum_ad.Value);
            guncelle.Parameters.AddWithValue("@email", email.Value);
            guncelle.Parameters.AddWithValue("@ord", ord.Value);
            guncelle.Parameters.AddWithValue("@web", web.Value);
            guncelle.Parameters.AddWithValue("@akt", Convert.ToInt16(aktvalue));
            guncelle.Parameters.AddWithValue("@kullanici_yetki", Convert.ToInt16(yetkis));
            guncelle.ExecuteNonQuery();
            baglanti.son();
            Response.Redirect("Yazarlar.aspx?id=ok");
        }
    }
}