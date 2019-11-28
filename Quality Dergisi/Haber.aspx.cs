using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class WebForm6 : System.Web.UI.Page
    {
       SagTarafKlas sagreklamlar = new SagTarafKlas();



    fonk baglanti = new fonk();
    string HaberId = "";
    string KategoriId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "";
       




            if (RouteData.Values["HaberID"] != null)
            {




                url = RouteData.Values["HaberID"].ToString();
            }
            HaberId = url;




            sagreklamlar.HaberHit(url);

            SqlCommand haberoku = new SqlCommand("select FORMAT(haberler.tarih , 'dd.MM.yyyy') as itarih  , haberler.tur_id, tur_ad,renk,baslik,foto,metin,convert(varchar, tarih, 104) as ytarih from haberler inner join turlerHaber on turlerHaber.tur_id = haberler.tur_id where id=@id", baglanti.baglanti());
            haberoku.Parameters.AddWithValue("@id", url);
            SqlDataReader okur = haberoku.ExecuteReader();
            string habermetin = "";
            string kategorilink = "";
            string galeriId = "";
            string foto = "";
            string baslik = "";
        string kategoriadi = "";
            while (okur.Read())
            {
                sayfakategori.InnerText = okur["tur_id"].ToString();
                kategorilink = "<a class='category-tp-1' style='font-size:16px;border:0px;background-color:" + okur["renk"].ToString() + "' >" + okur["tur_ad"].ToString() + " </a>";
                kategori.InnerHtml = kategorilink;
                 baslik = okur["baslik"].ToString();
                foto = okur["foto"].ToString();
                tarih.Text = okur["itarih"].ToString();

                haberbaslik.InnerHtml = baslik;
                haberbuyukresim.Src = baglanti.siteadres() + foto;
                KategoriId = okur["tur_id"].ToString();
            kategoriadi = okur["tur_ad"].ToString();
                habermetin = System.Net.WebUtility.HtmlDecode(okur["metin"].ToString());
 
            }
            baglanti.son();



            dostdiv.InnerHtml = sagreklamlar.HabericiReklam(Convert.ToInt32(KategoriId));

            haberetiketleri.InnerHtml = "<h4>Haber Etiketleri</h4>" + sagreklamlar.TagGetir(url);

        if (KategoriId == "6")
        {
            sagbolme.Text = topmekanlar()+ sagreklamlar.SagTarafSiraOku();



        }
        else
        {

            sagbolme.Text = sagreklamlar.SagTarafSiraOku();

        }



        string haberresim = "http://qualitydergisi.com"  +baglanti.siteadres()+ foto;
        string habericerikkisa = baslik;
        string haberid = url;
         string link ="http://qualitydergisi.com"+ Request.RawUrl.ToString();

 
        string etiketler = "<title>" +baslik+" - Quality Dergisi -Sosyete Ve Magazinin Kalbi </title><meta itemprop='image' content='" + haberresim + "' /> <meta property='og:site_name' content='qualitydergisi.com' /> <meta property='og:title' content='" + haberbaslik.InnerHtml + "' /> <meta property='og:type' content='article' /> <meta property='article:id' content='" + haberid + "' /> <meta property='article:section' content='" + kategoriadi + "' /> <meta property='article:section:type' content='Detail Page' /> <meta property='article:section:list' content='" + kategoriadi + "' /> <meta property='article:tag' content='" + habericerikkisa + "' /> <meta property='literal-category' content='" + kategoriadi + "' /> <meta property='og:url' content='" + link + "' /> <link rel='canonical' href='" + link + "' /> <meta property='og:image' content='" + haberresim + "' /> <meta name='twitter:card' content='summary_large_image' /> <meta name='twitter:site' content='@qualitydergisi' /> <meta name='twitter:title' content='" + haberbaslik.InnerHtml + " - " + kategoriadi + "' /> <meta name='twitter:description' content='" + haberbaslik.InnerHtml + "' /> <meta name='twitter:image' content='" + haberresim + "' /> <link rel='image_src' href='" + haberresim + "' />";



      
           
            siteaciklamalar.Text = etiketler;




            icerik.Text = habermetin;

            string galeri1 = "  <div class='slider js-img-slider'>";
            string galeri1div = "</div>";
            if (galeriId == "")
            { }
            else
            {


                SqlCommand galeri = new SqlCommand("select * from galeriFotograf where galeriID=" + galeriId + "", baglanti.baglanti());
                SqlDataReader okugaleri = galeri.ExecuteReader();
                string GaleriDiv = "";
                int sayi = 0;
                while (okugaleri.Read())
                {
                    string resim = ResolveUrl("/galeri/" + galeriId + "/" + okugaleri["ad"].ToString());

                    GaleriDiv += "<div class='item'> <figure class='post-img-1'><img src='" + resim + "' height='384' width='50%' alt='" + okugaleri["aciklama"].ToString() + "' class=''/></figure>" + okugaleri["aciklama"].ToString() + "</div>";
                    sayi++;

                }


                Slayt.InnerHtml = galeri1 + GaleriDiv + galeri1div + "<div style='text-align: center;' class='navs js-custom-navs'> <div class='slide-count js-slide-count'><span class='js-current'>" + sayi + "</span> of <span class='js-total'>" + sayi + "</span> </div> </div>";


            }
            baglanti.son();

            BenzerIcerik(HaberId);
 
    }

    public void BenzerIcerik(string haberid)
    {

        if (KategoriId == "8")
        {

            BenzerTab.Visible = false;

        }

        SqlCommand benzer = new SqlCommand("select top(9)* from haberler where tur_id=" + KategoriId + " and id not in(" + haberid + ") and akt=1 order by id desc", baglanti.baglanti());
        SqlDataReader benzeroku = benzer.ExecuteReader();

        string baslik = "";
        string resim = "";
        string id = "";
        string sonuc = "";
        string url = "";

        while (benzeroku.Read())
        {

            baslik = benzeroku["spot"].ToString();
            resim = benzeroku["foto"].ToString();
            id = benzeroku["id"].ToString();
            url = baglanti.basliktemizlesimdi(baslik);
            if (baslik.Length > 35)
            {

                baslik = baslik.Substring(0, 34) + "..";

            }



            sonuc += "<div data-id='" + id + "' class='one-third'> <article class='post post-tp-30'> <figure> <a href='" + @"/Haberi/" + id + "/" + url + "'  > <img src='" + baglanti.siteadres() + resim + "'   height='150' width='222' alt='" + baslik + "' class='adaptive' /> </a>   </figure> <h3 class='title-6'><a  href='" + @"/Haberi/" + id + "/" + url + "'>" + baslik + "</a></h3> </article> </div>";


        }
        baglanti.son();
        benzerhaber.InnerHtml = sonuc;

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
    }
}