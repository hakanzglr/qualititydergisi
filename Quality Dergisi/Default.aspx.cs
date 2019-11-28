using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string icerik = "";
        fonk baglanti = new fonk();
        SagTarafKlas sagreklamlar = new SagTarafKlas();
        protected void Page_Load(object sender, EventArgs e)
        {

            guncelson6haber();
            Slayt();

            var img = "<meta   property=\"og:image\" content=\"" + baglanti.siteadres() + "img/logo01.png\" />";
            var title = "<meta  property=\"og:title\" content=\"" + baglanti.sitebaslik() + "\" />";
            var desc = "<meta  property=\"og:description\" content=\"Sosyetenin En Çok Okunan Dergisi\" />";
            siteaciklamalar.Text = img + title + desc;
            sagbolme.Text = sagreklamlar.SagTarafSiraOku();
            Page.Title = baglanti.sitebaslik();
            SiraOKu();
        }

        public void Son2Haber(string kategoriAdi, int kategoriID, string ReklamId)
        {
            //REKLAMLAR
            string reklam = "";
            string sonhalreklam = "";
            if (ReklamId == "")
            {
            }
            else
            {

                SqlCommand reklamCMD = new SqlCommand("SELECT * FROM Reklamlar where id=" + ReklamId + " and aktif=1", baglanti.baglanti());
                SqlDataReader reklamoku = reklamCMD.ExecuteReader();
                string imajurl = "";

                while (reklamoku.Read())
                {
                    string adres = reklamoku["adres"].ToString();
                    imajurl = reklamoku["resim"].ToString();

                    if (imajurl.Substring(0, 3) == "htt")
                    {


                        reklam = "<span class='pst-block-foot'><a target='blank' href='" + adres + "'> <img src='" + reklamoku["resim"].ToString() + "' alt=''  class='adaptive'   /></a> </span>";



                    }
                    else
                    {
                        reklam = "<span class='pst-block-foot'><a target='blank' href='" + adres + "'>  <img src='/dost/" + reklamoku["resim"].ToString() + "' alt='' class='adaptive'  /></a> </span>";


                    }


                }
                sonhalreklam = reklam;
            }
            //REKLAMLAR

            baglanti.son();


            SqlCommand guncelsorgusu = new SqlCommand("select top(6)* from haberler where tur_id=" + kategoriID + " and akt=1 order by tarih desc", baglanti.baglanti());
            SqlDataReader gunceloku = guncelsorgusu.ExecuteReader();
            string guncelhaberler = "";
            string resim = "";
            string baslik = "";
            string DisCepher1 = "<div class='pst-box'><div class='pst-block'> <div class='pst-box-head'> <div class='title-blc-1'> <h2 class='title-4'>" + kategoriAdi + " </h2> </div> <div class='navs js-pst-navs'></div> </div> <div class='pst-box-main'> <div class='pst-box-inner js-pst-block-2'>";
            string DisCepher2 = "</div>" + "<div class='mobilrdost'></div>" + sonhalreklam + "</div></div>";
            while (gunceloku.Read())
            {
                string baslik2 = gunceloku["baslik"].ToString();
                baslik = baglanti.basliktemizlesimdi(baslik2);
                string spot = gunceloku["spot"].ToString();
                resim = gunceloku["foto"].ToString();
                guncelhaberler += "<div class='one-third'> <article class='post post-tp-30'><figure><a href='Haberi/" + gunceloku["id"].ToString() + "/" + baslik + "'> <img src='img/haber/" + resim + "' height='150' width='222' alt='" + baslik + "' class='adaptive' /> </a> <div class='ptp-30-overlay'> </div> </figure> <h3 class='title-6'><a class='kalin600' href='Haberi/" + gunceloku["id"].ToString() + "/" + baslik + "'>" + spot + "</a></h3> </article> </div>";

            }
            baglanti.son();

            icerik += DisCepher1 + guncelhaberler + DisCepher2 + "</div>";



        }


        public void Slayt()
        {



            //Slide Büyük Resimleri Getirme



            string SlidebuyukresimHtml1 = "<div class='swiper-slide'> <article class='post post-tp-28 mb-height'> ";
            string SlidebuyukresimHtml2 = "</h2> <div class='meta-tp-4'></div>   </article> </div>";
            string SlaytResimleri = "";
            int sayac = 1;
            //SlideTumbGetirme
            string tumbHtml1 = "<div class='one-sixth sm-one-sixth mb-ls-one-third mb-pt-half js-thumbs-img'> <div class='thumbs-img'> <figure>";


            string tumbHtml2 = "</figure> </div> </div>";
            string TumbResim = "";
            string KucukResimler = "";



            SqlCommand mansetcmd = new SqlCommand("select * from SliderHaber order by id asc", baglanti.baglanti());
            SqlDataReader mansetoku = mansetcmd.ExecuteReader();

            while (mansetoku.Read())
            {

                string id = mansetoku["haberid"].ToString();

                SqlCommand slaytResimSorgulama = new SqlCommand("select top(10) * from haberler where id=" + id + " ", baglanti.baglanti());
                SqlDataReader slaytResimOku = slaytResimSorgulama.ExecuteReader();


                while (slaytResimOku.Read())
                {
                    string basliktemiz = slaytResimOku["baslik"].ToString();
                    string spot = slaytResimOku["spot"].ToString();
                    string baslik = baglanti.basliktemizlesimdi(basliktemiz);
                    SlaytResimleri += SlidebuyukresimHtml1 + "<div> <a href='Haberi/" + slaytResimOku["id"].ToString() + "/" + baslik + "'  ><img src='/img/haber/" + slaytResimOku["foto"].ToString() + "' height='425' width='100%' class='' alt='" + basliktemiz + "' ></img>" + " </a> </div> <div class='ptp-28-overlay'> <h2 class='title-18'>" + spot + SlidebuyukresimHtml2;
                    TumbResim += tumbHtml1 + "<p class='resimno'>" + sayac + "</p>" + tumbHtml2;
                    KucukResimler += tumbHtml1 + "<img src = '/img/haber/" + slaytResimOku["foto"] + "'  alt = '" + Regex.Replace(slaytResimOku["spot"].ToString(), @"\'", string.Empty) + "' class='adaptive'/>" + tumbHtml2;
                    sayac++;


                }

                baglanti.son();
            }
            SlayBuyukResimler.Text = SlaytResimleri;
            SlaytThumblar.InnerHtml = KucukResimler;
            SlaytRakamlar.InnerHtml = TumbResim;
            baglanti.son();

        }

        public void SiraOKu()
        {
            SqlCommand siraokuCMD = new SqlCommand("SELECT * FROM turlerHaber where Anasayfada=1 order by AnasayfaSira asc", baglanti.baglanti());
            SqlDataReader siraokuReader = siraokuCMD.ExecuteReader();

            string kategoriadi = "";
            int kategoriId = 0;
            string ReklamId = "";

            while (siraokuReader.Read())
            {


                kategoriadi = siraokuReader["tur_ad"].ToString();
                kategoriId = Convert.ToInt16(siraokuReader["tur_id"].ToString());

                ReklamId = siraokuReader["reklamId"].ToString();


                Son2Haber(kategoriadi, kategoriId, ReklamId);

            }
            baglanti.son();


            anaicerik.InnerHtml = icerik;

        }




        public void guncelson6haber()
        {

            SqlCommand guncelsorgusu = new SqlCommand("select top(6)* from haberler where tur_id=3 and akt=1 order by id desc", baglanti.baglanti());
            SqlDataReader gunceloku = guncelsorgusu.ExecuteReader();
            string guncelhaberler = "";
            while (gunceloku.Read())
            {
                string spot = gunceloku["spot"].ToString();
                string baslik2 = gunceloku["baslik"].ToString();
                string baslik = baglanti.basliktemizlesimdi(baslik2);
                string resim = gunceloku["foto"].ToString();
                string haberId = gunceloku["id"].ToString();
                string link = @"Haberi/" + haberId + "/" + baslik + "";
                guncelhaberler += "<div class='one-third'> <article class='post post-tp-30'><figure><a href='Haberi/" + haberId + "/" + baslik + "'><img src='img/haber/" + resim + "' height='150' width='222' alt='" + baslik2 + "' class='adaptive'/></a><div class='ptp-30-overlay'> </div> </figure> <h3 class='title-6'><a href='Haberi/" + gunceloku["id"].ToString() + "/" + baslik + "'>" + spot + "</a></h3> </article> </div>";
            }
            baglanti.son();

            guncelhaberdiv.InnerHtml = guncelhaberler;
        }
    }
}