using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        string url = "";
    int tur;
    SagTarafKlas sagreklamlar = new SagTarafKlas();
    fonk baglanti = new fonk();
    string HaberId = "";
    string KategoriId = "";
    protected void Page_Load(object sender, EventArgs e)
    {





        sagbolme.Text = sagreklamlar.SagTarafSiraOku();


        if (RouteData.Values["videoId"] != null)
        {

            url = RouteData.Values["videoId"].ToString();
        }
        HaberId = url;




 
       




        VideoDetayGetir();







    }


    public void VideoDetayGetir()
    {

        SqlCommand haberoku = new SqlCommand("select * from videolar where ID=@id", baglanti.baglanti());
        haberoku.Parameters.AddWithValue("@id", url);
        SqlDataReader okur = haberoku.ExecuteReader();
        string habermetin = "";
         string foto = "";
        string baslik = "";
        while (okur.Read())
        {


            habermetin = System.Net.WebUtility.HtmlDecode(okur["aciklama"].ToString());
            Page.Title = System.Net.WebUtility.HtmlDecode(okur["ad"].ToString()) + " -" + baglanti.sitebaslik();
            haberbaslik.InnerText = System.Net.WebUtility.HtmlDecode(okur["ad"].ToString());
            icerik.Text = System.Net.WebUtility.HtmlDecode(okur["aciklama"].ToString());
            videosection.InnerHtml = System.Net.WebUtility.HtmlDecode(okur["embedcode"].ToString());
          tur = Convert.ToInt32(okur["kategoriID"].ToString());
 
        }

        dostdiv.InnerHtml = sagreklamlar.VideoiciReklam(Convert.ToInt32(tur));

        turbulbenzergetir(tur,Convert.ToInt32(url));


        



         var img = "<meta   property=\"og:image\" content=\"" + baglanti.siteadres() + "/" + foto + "\" />";
        var title = "<meta  property=\"og:title\" content=\"" + baglanti.sitebaslik() + "\" />";
        var desc = "<meta  property=\"og:description\" content=\"" + baslik + "\" />";
        siteaciklamalar.Text = img + title + desc;




        icerik.Text = habermetin;





        sagreklamlar.VideoHit(url);

    }


    public void BenzerIcerik(string haberid)
    {

        SqlCommand benzer = new SqlCommand("select top(5)* from videolar where tur_id=" + KategoriId + " and id not in(" + haberid + ") order by id desc", baglanti.baglanti());
        SqlDataReader benzeroku = benzer.ExecuteReader();

        string baslik = "";
        string resim = "";
        string id = "";
        string sonuc = "";
        string url = "";

        while (benzeroku.Read())
        {

            baslik = benzeroku["baslik"].ToString();
            resim = benzeroku["foto"].ToString();
            id = benzeroku["id"].ToString();
            url = baglanti.basliktemizlesimdi(baslik);
            if (baslik.Length > 45)
            {

                baslik = baslik.Substring(0, 44) + "..";

            }



            sonuc += "<div data-id='" + id + "' class='one-third'> <article class='post post-tp-30'> <figure> <a href='../../Haberi/" + id + "/" + url + "'  > <img src='" + baglanti.siteadres() + resim + "'   height='150' width='222' alt='" + baslik + "' class='adaptive' /> </a>   </figure> <h3 class='title-6'><a  href='../../Haberi/" + id + "/" + url + "'>" + baslik + "</a></h3> </article> </div>";


        }
        benzerhaber.InnerHtml = sonuc;

    }





    public void turbulbenzergetir(int kategori, int galeriid)
    {





        SqlCommand benzer = new SqlCommand("select top(9)* from videolar where kategoriID=" + kategori + " and ID not in(" + galeriid + ") order by ID desc", baglanti.baglanti());
        SqlDataReader benzeroku = benzer.ExecuteReader();

        string baslik = "";
        string resim = "";
        string id = "";
        string sonuc = "";
        string url = "";

        while (benzeroku.Read())
        {

            baslik = benzeroku["ad"].ToString();
            resim = benzeroku["foto"].ToString();
            id = benzeroku["ID"].ToString();
            url = baglanti.basliktemizlesimdi(baslik);
            if (baslik.Length > 35)
            {

                baslik = baslik.Substring(0, 34) + "..";

            }



            sonuc += "<div data-id='" + id + "' class='one-third'> <article class='post post-tp-30'> <figure> <a href='" + @"/video/" + id + "/" + url + "'  > <img src='" + @"/img/video/" + resim + "'   height='150' width='222' alt='" + baslik + "' class='' /> </a>   </figure> <h3 class='title-6'><a  href='" + @"/video/" + id + "/" + url + "'>" + baslik + "</a></h3> </article> </div>";


        }



        baglanti.son();
        benzerhaber.InnerHtml = sonuc;



    }
    }
}