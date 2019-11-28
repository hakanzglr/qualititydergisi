using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        SagTarafKlas banner = new SagTarafKlas();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand habergetir = new SqlCommand("select * from Reklamlar", baglanti.baglanti());

            SqlDataReader haberoku = habergetir.ExecuteReader();
            string sonuc = "";
            while (haberoku.Read())
            {

                string baslik = haberoku["baslik"].ToString();
                string resim = haberoku["resim"].ToString();
                string tarih = haberoku["tarih"].ToString();
                string adres = haberoku["adres"].ToString();
                string aktif = haberoku["aktif"].ToString();
                string id = haberoku["id"].ToString();

                string kisatlink = haberoku["adres"].ToString();

                int baslikuzunluk = adres.Length;


                if (baslikuzunluk > 7)
                {

                    baslik = baslik.Substring(0, 7);

                }
                try
                {

                    if (resim.Substring(0, 3) == "htt")
                    {



                    }
                    else
                    {
                        resim = "../../dost/" + resim;

                    }
                }
                catch
                {
                }
                string durum1 = "<div id='DC" + id + "' class='switch'><label style='padding-left:0px !important;' data-img='" + resim + "'><input id='C" + id + "' type='checkbox'";
                if (aktif == "1")
                {
                    durum1 += "checked='checked'><span class='lever'/> </label> </div><img id='RC" + id + "'  style='display:none;'  src='yukleme.gif' />";


                }
                else
                {
                    durum1 += "><span class='lever'/></label></div><img  id='RC" + id + "'  style='display:none;'  src='yukleme.gif' />";


                }

                string tur = haberoku["reklamtur"].ToString();
                string metinhtml = haberoku["metinhtml"].ToString();
                string reklamtur = "";

                if (tur == "1")
                {


                    reklamtur = "<img class='rimg' src='" + resim + "'/>";

                }
                else
                {

                    reklamtur = "<div class='rimg' data-reklamid='" + id + "'>" + System.Net.WebUtility.HtmlDecode(metinhtml) + "</div>";


                }





                string kisatarih = tarih.Substring(0, 10);


                sonuc += "<div class='sayfaiciyazar'><div class='col-md-2  col-xs-2'>" + baslik + "</div>" + "<div class='col-md-3  col-xs-3'>" + reklamtur + "</div><div class='col-md-2  col-xs-2'>" + kisatarih + "</div><div class='col-md-3  col-xs-3'><a href='" + adres + "' target='blank'>Reklam URL</a></div><div class='col-md-1  col-xs-1'>" + durum1 + "</div> <div style='font-size:20px;' class='col-md-1'> <div class='duzenlelink'>  <a class='Sil' name='" + id + "'> <i class='icon-trash'></i> </a></div> </div></div>";

            }

            reklamlist.InnerHtml = sonuc;




            baglanti.son();
            TurlerHaberReklamTanimlari();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string sorguparametresi = kriter.SelectedValue.ToString();

            string kriterq = "";
            if (sorguparametresi == "b")
            {

                kriterq = kelime.Text + "%";


            }
            else if (sorguparametresi == "s")
            {

                kriterq = "%" + kelime.Text;

            }
            else
            {

                kriterq = "%" + kelime.Text + "%";

            }



            SqlCommand habergetir = new SqlCommand("select * from Reklamlar where baslik like '" + kriterq + "' order by tarih desc ", baglanti.baglanti());

            SqlDataReader haberoku = habergetir.ExecuteReader();
            string sonuc = "";
            while (haberoku.Read())
            {

                string baslik = haberoku["baslik"].ToString();
                string resim = haberoku["resim"].ToString();
                string id = haberoku["id"].ToString();
                string tarih = haberoku["tarih"].ToString();
                string adres = haberoku["adres"].ToString();
                string aktif = haberoku["aktif"].ToString();
                string kisatlink = haberoku["adres"].ToString();

                int baslikuzunluk = adres.Length;


                if (baslikuzunluk > 10)
                {

                    baslik = baslik.Substring(0, 10);

                }

                if (resim.Substring(0, 3) == "htt")
                {
                }
                else
                {
                    resim = "../../img/" + resim;

                }

                string tur = haberoku["reklamtur"].ToString();
                string metinhtml = haberoku["metinhtml"].ToString();
                string reklamtur = "";

                if (tur == "1")
                {


                    reklamtur = "<img style='width:50 height:50' src='" + resim + "'/>";

                }
                else
                {

                    reklamtur = "<div style='width:50 height:50' data-reklamid='" + id + "'>" + System.Net.WebUtility.HtmlDecode(metinhtml) + "</div>";

                }


                sonuc += "<div style='height:50px'; ><div class='col-md-3'>" + baslik + "</div>" + "<div class='col-md-3'>" + reklamtur + "</div><div class='col-md-2'>" + tarih + "</div><div class='col-md-3'><a href='" + adres + "' target='blank'>" + baslik + "</a></div><div class='col-md-1'>" + aktif + "</div></div>";

            }

            reklamlist.InnerHtml = sonuc;




            baglanti.son();
        }




        public void TurlerHaberReklamTanimlari()
        {
            SqlCommand reklamcmd = new SqlCommand("select * from turlerHaber", baglanti.baglanti());
            SqlDataReader reklamoku = reklamcmd.ExecuteReader();
            string sonuc = "";
            while (reklamoku.Read())
            {
                sonuc += "<li class='turlistli' data-reklamid='" + reklamoku["reklamId"].ToString() + "' data-turid='" + reklamoku["tur_id"].ToString() + "'>" + reklamoku["tur_ad"].ToString() + "</li> ";

            }
            baglanti.son();
            SagReklamTanimlari();
            BolumlerHaberReklamTanimlari();
            slaytalti.InnerHtml = "<ul class='turlerListesi'>" + sonuc + "</ul>";
        }


        public void BolumlerHaberReklamTanimlari()
        {
            SqlCommand reklamcmd = new SqlCommand("select * from turlerHaber", baglanti.baglanti());
            SqlDataReader reklamoku = reklamcmd.ExecuteReader();
            string sonuc = "";
            while (reklamoku.Read())
            {
                sonuc += "<li class='bolumlistli' data-reklamid='" + reklamoku["icerikreklamid"].ToString() + "' data-turid='" + reklamoku["tur_id"].ToString() + "'>" + reklamoku["tur_ad"].ToString() + "</li> ";

            }
            baglanti.son();


            bolumlerlistesi.InnerHtml = "<ul class='ULbolumlerlistesi'>" + sonuc + "</ul>";


            VideoBolumlerHaberReklamTanimlari();
        }


        public void SagReklamTanimlari()
        {
            SqlCommand reklamcmd = new SqlCommand("select * from SagTarafSiralama", baglanti.baglanti());
            SqlDataReader reklamoku = reklamcmd.ExecuteReader();
            string sonuc = "";
            while (reklamoku.Read())
            {
                sonuc += "<li class='sagturlistli'  data-reklamid='" + reklamoku["reklamID"].ToString() + "' data-turid='" + reklamoku["kategoriid"].ToString() + "'>" + reklamoku["isim"].ToString() + "</li> ";

            }
            baglanti.son();

            SagturlerListesi.InnerHtml = "<ul class='ULSagturlerListesi'>" + sonuc + "</ul>";
        }


        public void VideoBolumlerHaberReklamTanimlari()
        {
            SqlCommand reklamcmd = new SqlCommand("select * from turlerVideo", baglanti.baglanti());
            SqlDataReader reklamoku = reklamcmd.ExecuteReader();
            string sonuc = "";
            while (reklamoku.Read())
            {
                sonuc += "<li class='videobolumlistli' data-reklamid='" + reklamoku["icerikreklamid"].ToString() + "' data-turid='" + reklamoku["tur_id"].ToString() + "'>" + reklamoku["tur_ad"].ToString() + "</li> ";

            }
            baglanti.son();


            VideoBolumlerListesi.InnerHtml = "<ul class='ULVideoBolumlerListesi'>" + sonuc + "</ul>";

            GaleriBolumlerHaberReklamTanimlari();

        }
        public void GaleriBolumlerHaberReklamTanimlari()
        {
            SqlCommand reklamcmd = new SqlCommand("select * from turlerGaleri", baglanti.baglanti());
            SqlDataReader reklamoku = reklamcmd.ExecuteReader();
            string sonuc = "";
            while (reklamoku.Read())
            {
                sonuc += "<li class='Galeribolumlistli' data-reklamid='" + reklamoku["icerikreklamid"].ToString() + "' data-turid='" + reklamoku["tur_id"].ToString() + "'>" + reklamoku["tur_ad"].ToString() + "</li> ";

            }
            baglanti.son();


            GaleriBolumlerListesi.InnerHtml = "<ul class='ULGaleriBolumlerListesi'>" + sonuc + "</ul>";



        }
    }
}