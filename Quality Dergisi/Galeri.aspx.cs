using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        SagTarafKlas sagreklamlar = new SagTarafKlas();

    fonk baglanti = new fonk();
    string HaberId = "";
     string url = "";
    int tur;
    string sosyalresim = "<div class='tb-social'><ul class='tb-social-list'> <li class='fb'><i class='fa fa-facebook'></i></li><li class='tw'><i class='fa fa-twitter'></i></li><li class='gp'><i class='fa fa-google-plus'></i></li></ul></div>";
    protected void Page_Load(object sender, EventArgs e)
    {





        if (RouteData.Values["galeriId"] != null)
        {

            url = RouteData.Values["galeriId"].ToString();
        }
        HaberId = url;


        //çerez'e haber id yazmak
        //HttpCookie haber = new HttpCookie("Haber");
        //haber.Value = url;
        //haber.Expires = DateTime.Now.AddHours(1);
        //Response.Cookies.Add(haber);
        sagbolme.Text = sagreklamlar.SagTarafSiraOku();



        SqlCommand haberoku = new SqlCommand("select * from galeri where ID=@id", baglanti.baglanti());
        haberoku.Parameters.AddWithValue("@id", url);
        SqlDataReader okur = haberoku.ExecuteReader();
        string habermetin = "";
         string foto = "";
         while (okur.Read())
        {


            habermetin = System.Net.WebUtility.HtmlDecode(okur["ad"].ToString());
            Page.Title = okur["ad"].ToString() + " -" + baglanti.sitebaslik();
            haberbaslik.InnerHtml = okur["ad"].ToString();
            tur = Convert.ToInt32(okur["kategoriID"].ToString()) ;
            foto = okur["resim"].ToString();
        }


        baglanti.son();

        var img = "<meta property=\"og:image\" content=\"" +"http://qualitydergisi.com/img/galeri/thumbnail/" + foto + "\"/>";
        var title = "<meta property=\"og:title\" content=\"" + haberbaslik.InnerText + "\" />";
        var desc = "<meta property=\"og:description\" content=\"" + haberbaslik.InnerText + "\" />";

        var resimboyut = "<meta property='og:image:type' content='image/jpeg' /> <meta property='og:image:width' content='400'/> <meta property='og:image:height' content='300'/>";


         siteaciklamalar.Text = img +resimboyut+ title + desc;




        icerik.Text = habermetin;

        GaleriGetir();

        turbulbenzergetir(tur,Convert.ToInt32(url));
        ReklamGetir();
    }





    public void GaleriGetir()
    {


        SqlCommand galeri = new SqlCommand("select * from galeriFotograf where galeriID=" + url + "", baglanti.baglanti());
        SqlDataReader okugaleri = galeri.ExecuteReader();
        string GaleriDiv = "";
        int sayi = 1;
        while (okugaleri.Read())
        {
            string resim = ResolveUrl(baglanti.galeriFOTOadres() + url + "/" + okugaleri["ad"].ToString());
            string hrefurl = baglanti.basliktemizlesimdi(okugaleri["aciklama"].ToString());



            GaleriDiv += "<div data-q='" + sayi + "' data-isim='" + hrefurl + "'  class='rakam'><div data-q='" + sayi + "'  class='resimcerceve'><div   class='resimnumarasi'>" + sayi + "</div><a class='llink' href='" + resim + "' alt='" + hrefurl + "' data-q='" + sayi+"' title='" + okugaleri["aciklama"].ToString() + "'><img class='lightimage' data-q='" + sayi + "'  src='" + resim + "'   alt='" + hrefurl + "'/></a> <div data-q='" + sayi + "'  class='resimisimler'><span data-q='" + sayi + "'  class='isimler'> " + okugaleri["aciklama"].ToString() + "</span><span data-q='" + sayi + "'  class='paylas'>" + sosyalresim + "</span></div></div></div></br></br>";
            sayi++;
            if (sayi % 3 == 0)
            {

                GaleriDiv += "<div  data-isim='" + hrefurl + "'  class='lightimage'> " + ReklamGetir()+"</div></br></br>";

            }


        }


        icerik.Text = GaleriDiv;


        baglanti.son();





      
    }

    public void turbulbenzergetir(int kategori,int galeriid)
    {

 

        

        SqlCommand benzer = new SqlCommand("select top(9)* from galeri where kategoriID=" + kategori + " and ID not in(" + galeriid + ") and aktif=1 order by ID desc", baglanti.baglanti());
        SqlDataReader benzeroku = benzer.ExecuteReader();

        string baslik = "";
        string resim = "";
        string id = "";
        string sonuc = "";
        string url = "";

        while (benzeroku.Read())
        {

            baslik = benzeroku["ad"].ToString();
            resim = benzeroku["resim"].ToString();
            id = benzeroku["ID"].ToString();
            url = baglanti.basliktemizlesimdi(baslik);
            if (baslik.Length > 35)
            {

                baslik = baslik.Substring(0, 34) + "..";

            }



            sonuc += "<div data-id='" + id + "' class='one-third'> <article class='post post-tp-30'> <figure> <a href='" + @"/galeri/" + id + "/" + url + "'  > <img src='" + @"/img/galeri/thumbnail/"+ resim + "'   height='150' width='222' alt='" + baslik + "' class='' /> </a>   </figure> <h3 class='title-6'><a  href='" + @"/galeri/" + id + "/" + url + "'>" + baslik + "</a></h3> </article> </div>";


        }
        baglanti.son();
        benzerhaber.InnerHtml = sonuc;



    }


    public string  ReklamGetir()
    {

        string turid = "";
        SqlCommand videoturbulcmd = new SqlCommand("select tur_id from turlerVideo where tur_id="+tur+"",baglanti.baglanti());
        SqlDataReader videookur = videoturbulcmd.ExecuteReader();
        while (videookur.Read())
        {

            turid = videookur["tur_id"].ToString();

        }
        baglanti.son();

     return   sagreklamlar.GaleriiciReklam(Convert.ToInt32(turid));
    }
    }
}