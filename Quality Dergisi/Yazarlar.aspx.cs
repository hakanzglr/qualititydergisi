using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class WebForm15 : System.Web.UI.Page
    {
         fonk baglanti = new fonk();

    SagTarafKlas sagreklamlar = new SagTarafKlas();
    string HaberId = ""; string yazaradics = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "";
        if (RouteData.Values["HaberID"] != null)
        {

            url = RouteData.Values["HaberID"].ToString();
        }
        HaberId = url;

        sonyazaryazisitxt.InnerText = url;



        YazarYazisi(url);


    }


    public void yazarindigeryazilari(string yazarid, string yazaradi)
    {
        string yazaryazisonuc = "";


        SqlCommand yazilarcmd = new SqlCommand("select * from yazaryazilar where yazar_id=" + yazarid + " order by id desc", baglanti.baglanti());
        SqlDataReader yazilarioku = yazilarcmd.ExecuteReader();
        string ullist = "<ul class='digeryazilari'>";
        int sayac = 0;
        while (yazilarioku.Read())
        {
            string yazibasliklink = baglanti.basliktemizlesimdi(yazilarioku["baslik"].ToString());
            string link = @"/Yazarlar/" + yazilarioku["id"].ToString() + "/" + baglanti.basliktemizlesimdi(yazaradi) + "/" + yazibasliklink;
            yazaryazisonuc += "<li data-id='" + yazilarioku["id"].ToString() + "'class='yazarlistli' ><a href='" + link + "'>" + yazilarioku["baslik"].ToString() + "</a></li>";
            sayac++;

        }
        baglanti.son();

        if (sayac == 1)
        {
            sagbolme.Text = sagreklamlar.SagTarafSiraOku();

        }
        else
        {

            yazaryazisonuc = "<h2 class='yazardigersitil'>" + yazaradi + " Diğer Yazıları</h2>" + ullist + yazaryazisonuc + "</ul>";
            sagbolme.Text = yazaryazisonuc + sagreklamlar.SagTarafSiraOku();

        }




    }



    public void YazarYazisi(string yazar)
    {
        string facebookicinyazarid = "";
        SqlCommand yazisorgula = new SqlCommand("SELECT * FROM yazaryazilar where id=" + yazar + "", baglanti.baglanti());
        SqlDataReader yazioku = yazisorgula.ExecuteReader();
       
        while (yazioku.Read())
        {



            string yazarID = yazioku["yazar_id"].ToString();
            facebookicinyazarid = yazioku["yazar_id"].ToString();
            
            icerikyazaryazisi.Text = System.Net.WebUtility.HtmlDecode(yazioku["metin"].ToString());
            yazaradics = baglanti.yazaradGetir(yazarID);
            yazarindigeryazilari(yazarID, yazaradics);

            yazarresim.InnerHtml = " <img alt='" + yazioku["baslik"].ToString() + "' src='../Admin/img/galeri/thumbnail/" + baglanti.yazarresimGetir(yazarID) + "' class='sayfaiciresimyazar' />";
            yazarisim.InnerHtml = "<br> <p style='float:left;text-align:left;'><h3 style='font-size:18px !important;'>" + yazaradics + "</h3><br>" + yazioku["baslik"].ToString() + "</p>";
            yazaridtxt.InnerText = yazarID;
            BenzerIcerik(yazarID);
        }

        Page.Title = haberbaslik.InnerHtml + " " + yazaradics + baglanti.sitebaslik();



        FacebookUstBilgi(baglanti.yazarresimGetir(facebookicinyazarid)," Quality Yazarlarından " +yazaradics +" " + haberbaslik.InnerText);


        baglanti.son();
    }

    public void FacebookUstBilgi(string resim, string baslik)
    {

        var img = "<meta   property=\"og:image\" content=\"" + baglanti.siteadres() + "/" + resim + "\" />";
        var title = "<meta  property=\"og:title\" content=\"" + baglanti.sitebaslik() + "\" />";
        var desc = "<meta  property=\"og:description\" content=\"" + baslik + "\" />";
        siteaciklamalar.Text = img + title + desc;







    }

    public void BenzerIcerik(string yazarid)
    {



        SqlCommand benzer = new SqlCommand("select * from yazarlar where  yazar_id not in(" + yazarid + ") and akt=1 order by ord asc", baglanti.baglanti());
        SqlDataReader benzeroku = benzer.ExecuteReader();

        string baslik = "";
        string resim = "";
        string yazarids = "";
        string sonuc = "";
        string url = "";

        while (benzeroku.Read())
        {

            baslik = benzeroku["ad"].ToString();
            resim = benzeroku["resim"].ToString();
            yazarids = benzeroku["yazar_id"].ToString();
            url = baglanti.basliktemizlesimdi(baslik);
            if (baslik.Length > 35)
            {

                baslik = baslik.Substring(0, 34) + "..";

            }



            sonuc += "<div data-id='" + yazarids + "' class='one-third'> <article class='post post-tp-30'> <figure> <a href='" + @"/Yazarlar/" + yazarlarinsonyazilari(yazarids) + "/" + url + "'  > <img src='" + @"/img/yazarlar/" + resim + "'   height='150' width='222' alt='" + baslik + "' class='adaptive' /> </a>   </figure> <h3 class='title-6'><a  href='" + @"/Yazarlar/" + yazarlarinsonyazilari(yazarids) + "/" + url + "'>" + baslik + "</a></h3> </article> </div>";


        }
        baglanti.son();
        benzerhaber.InnerHtml = sonuc;

    }

    public string yazarlarinsonyazilari(string yazar)
    {
        string sonuc = "";

        SqlCommand yazarsonyazicmd = new SqlCommand("select top(1)* from yazarYazilar where yazar_id=" + yazar + " order by tarih desc", baglanti.baglanti());

        SqlDataReader yazarsonyaziokur = yazarsonyazicmd.ExecuteReader();

        while (yazarsonyaziokur.Read())
        {

            sonuc += yazarsonyaziokur["id"].ToString();


        }
        baglanti.son();
        return sonuc;



    }
    }
}