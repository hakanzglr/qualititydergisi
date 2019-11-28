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
    public partial class WebForm8 : System.Web.UI.Page
    {
         SagTarafKlas sagreklamlar = new SagTarafKlas();

    fonk baglanti = new fonk();
    string Katid = "";
    string spot3test = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (RouteData.Values["KatID"] != null)
            {

                Katid = RouteData.Values["KatID"].ToString();
                kategoriID.Text = Katid;
            }
            SagTarafKlas sagreklamlar = new SagTarafKlas();


            if (Katid == "6")
            {


                sagbolme.Text = topmekanlar() + sagreklamlar.SagTarafSiraOku();

            }
            else
            {

                sagbolme.Text = sagreklamlar.SagTarafSiraOku();

            }




            SqlCommand kategoriadicmd = new SqlCommand("select tur_ad from turlerHaber where tur_id=" + Convert.ToInt16(Katid) + "", baglanti.baglanti());
            SqlDataReader kategoriadioku = kategoriadicmd.ExecuteReader();

            while (kategoriadioku.Read())
            {

                BuyukKategoriadi.InnerText = kategoriadioku[0].ToString();

            }
            baglanti.son();




            SqlCommand son4cmd = new SqlCommand("select top(6)*  from haberler where tur_id=" + Katid + " and akt=1 order by id desc", baglanti.baglanti());
            SqlDataReader son4cmdoku = son4cmd.ExecuteReader();
            int sayac = 0;
            int[] array1 = new int[6];

            while (son4cmdoku.Read())
            {
                array1[sayac] = Convert.ToInt32(son4cmdoku["id"].ToString());
                sayac++;


            }
            baglanti.son();

            m1.Text = array1[0].ToString();
            m2.Text = array1[1].ToString();
            m3.Text = array1[2].ToString();
            m4.Text = array1[3].ToString();
            m5.Text = array1[4].ToString();
            m6.Text = array1[5].ToString();









            baglanti.son();
            HaberListesi();
         }
        catch
        {
            Response.Redirect("/anasayfa");

        }
        siteaciklamalar.Text = " <meta  property='og:title' content='" + BuyukKategoriadi.InnerText + " Quality Dergisi - Sosyete ve Magazinin Kalbi' /><title>" + BuyukKategoriadi.InnerText + "  Quality Dergisi - Sosyete ve Magazinin Kalbi" + "</title>";

        slayt();
    }


 

    

    



    public void HaberListesi()
    {
        SqlCommand katlistcmd = new SqlCommand("select top(10)* from haberler where akt=1 and tur_id=" + Katid + " and id<" + m6.Text + " order by tarih desc", baglanti.baglanti());
        SqlDataReader katlistoku = katlistcmd.ExecuteReader();
        string strsonuc = "";
        string sonid = "";
        string id = "";
        while (katlistoku.Read())
        {
            string spotbaslik = katlistoku["spot"].ToString();

            string baslik = katlistoku["baslik"].ToString();
            id = katlistoku["id"].ToString();
            string resim = katlistoku["foto"].ToString();

            if (baslik.Length > 45)
            {

                baslik = baslik.Substring(0, 44) + "..";

            }

            strsonuc += "<div data-id='" + id + "' class='col-half'> <article class='post post-tp-8'><figure><a  href='" + @"/Haberi/" + id + "/" + baglanti.basliktemizlesimdi(baslik) + "' > <img src='" + baglanti.siteadres() + resim + "' height='242' width='345' alt='" + baslik + "' class='adaptive' /> </a> </figure> <h3 class='title-5'><a href='" + @"/Haberi/" + id + "/" + baglanti.basliktemizlesimdi(baslik) + "'>" + spotbaslik + "</a></h3> </article></div>";
            sonid = id;


        }

        sonyuklenenid.InnerText = sonid;

        baglanti.son();
        liste.InnerHtml = strsonuc;


    }


    public string topmekanlar()
    {
        string mekanlar = ""; 
        SqlCommand mekancmd = new SqlCommand("select * from Mekanlar", baglanti.baglanti());

        SqlDataReader mekanokur = mekancmd.ExecuteReader();

        while (mekanokur.Read())
        {
            mekanlar += "<li>" + mekanokur["isim"].ToString() + "</li>";


        }
        string sonuc = "<div id='mekanlartop10' > <div class='pst-block'> <div class='pst-block-head'> <h2 class='title-4'><strong>Top 10 Mekanlar</strong> </h2> </div> <div class='pst-block-main'><ul class='mekanlar'>" + mekanlar + "</ul></div></div></div>";
        return sonuc;


    }


    public void slayt()
    {

        string SlidebuyukresimHtml1 = "<div class='swiper-slide'> <article class='post post-tp-28 mb-height'> ";
        string SlidebuyukresimHtml2 = "</h2> <div class='meta-tp-4'></div>   </article> </div>";
        string SlaytResimleri = "";
        int sayac = 1;
        //SlideTumbGetirme
        string tumbHtml1 = "<div class='one-sixth sm-one-sixth mb-ls-one-third mb-pt-half js-thumbs-img'> <div class='thumbs-img'> <figure>";


        string tumbHtml2 = "</figure> </div> </div>";
        string TumbResim = "";
        string KucukResimler = "";

        SqlCommand slaytResimSorgulama = new SqlCommand("select top(6) * from haberler  where tur_id=" + Katid + " and akt=1 order by id desc ", baglanti.baglanti());
        SqlDataReader slaytResimOku = slaytResimSorgulama.ExecuteReader();
        while (slaytResimOku.Read())
        {
            string basliktemiz = slaytResimOku["baslik"].ToString();
            string spot = slaytResimOku["spot"].ToString();
            string baslik = baglanti.basliktemizlesimdi(basliktemiz);
            SlaytResimleri += SlidebuyukresimHtml1 + "<div> <a href='" + @"/Haberi/" + slaytResimOku["id"].ToString() + "/" + baslik + "'  ><img src='" + @"/img/haber/" + slaytResimOku["foto"].ToString() + "' height='400' width='100%' class='' alt='" + basliktemiz + "' ></img>" + " </a> </div> <div class='ptp-28-overlay'> <h2 class='title-18'>" + spot + SlidebuyukresimHtml2;
            TumbResim += tumbHtml1 + "<p class='resimno'>" + sayac + "</p>" + tumbHtml2;
            KucukResimler += tumbHtml1 + "<img src = '" + @"/img/haber/" + slaytResimOku["foto"] + "'  alt = '" + Regex.Replace(slaytResimOku["spot"].ToString(), @"\'", string.Empty) + "' class='adaptive'/>" + tumbHtml2;
            sayac++;
        }

        baglanti.son();
        SlayBuyukResimler.Text = SlaytResimleri;
        SlaytThumblar.InnerHtml = KucukResimler;
        SlaytRakamlar.InnerHtml = TumbResim;
        baglanti.son();

    }
    }
}