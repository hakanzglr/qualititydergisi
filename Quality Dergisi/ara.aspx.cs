using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  Quality_Dergisi;

namespace Quality_Dergisi
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       
       
     fonk baglanti=new fonk();
        
    protected void Page_Load(object sender, EventArgs e)
    {
        string aranacakkelime = "";
       
            
            aranacakkelime = RouteData.Values["kelime"].ToString();


        webkelimesonucsayfasi.Value =aranacakkelime;
        HaberdeAra(aranacakkelime);
    }


    public void HaberdeAra(string kelime)
    {
        butonclasstemizle();

      icerikbtn.CssClass = "active";
        SqlCommand yeni = new SqlCommand("select top (50)* from haberler where baslik like '%"+kelime+"%' order by id desc",baglanti.baglanti());
        
        SqlDataReader sqloku = yeni.ExecuteReader();
         string sonucbir = "";
        string icerikstr = "";
        while (sqloku.Read())
        {
            string resim = sqloku["foto"].ToString();
            string baslik = sqloku["baslik"].ToString();
            icerikstr = System.Net.WebUtility.HtmlDecode(sqloku["metin"].ToString());
            string kategoriad = HaberKategoriGetir(Convert.ToInt64(sqloku["tur_id"].ToString()));
            string tarih = sqloku["tarih"].ToString();
            Int64 Haber = Convert.ToInt64(sqloku["id"].ToString());
            if (icerikstr.Length > 60)
            {

                icerikstr = icerikstr.Substring(0,59);
            }
            string haberlink = "../Haberi/" + sqloku["id"].ToString() + "/" + baglanti.basliktemizlesimdi(baslik) + "";
            sonucbir += "<article class='post post-tp-24'> <figure> <a href='"+haberlink+"'> <img src='/img/haber/" + resim + "' style='height:190px;width:270px;' alt='" + baslik + "' class='adaptive'> </a> <div class='ptp-24-overlay'> </div></figure> <h3 class='title-14'><a href='"+haberlink+"'><b>" + baslik + "</b></a></h3> <p class='p'>" + icerikstr + "</p> <div class='meta-tp-2'> <div class='date'><span>" + tarih + "</span></div> <div class='category'>" + kategoriad + "</span> </div> </div> </article>";

        }
        baglanti.son();
        icerik.Text = sonucbir;
        

    }

    protected void icerikbtn_Click(object sender, EventArgs e)
    {
        HaberdeAra(webkelimesonucsayfasi.Value);
    }

    protected void galeribtn_Click(object sender, EventArgs e)
    {
        butonclasstemizle();

       galeribtn.CssClass = "active";
        SqlCommand yeni = new SqlCommand("SELECT TOP (50)* FROM galeri where ad like '%" + webkelimesonucsayfasi.Value + "%' order by ID desc", baglanti.baglanti());

        SqlDataReader sqloku = yeni.ExecuteReader();
        string sonucbir = "";
        while (sqloku.Read())
        {
            string baslik = sqloku["ad"].ToString();
             string tarih = sqloku["tarih"].ToString();
            string ID = sqloku["ID"].ToString();
            string kategoriadi = GaleriKategoriGetir(Convert.ToInt64(sqloku["kategoriID"].ToString()));
            string resim = sqloku["resim"].ToString();

            string haberlink = "/galeri/"+ ID + "/" + baglanti.basliktemizlesimdi(baslik);

            sonucbir += "<article class='post post-tp-24'> <figure> <a href='" + @haberlink+ "'> <img src='/img/galeri/thumbnail/" + resim + "' style='width:270px;' alt='" + baslik + "' class='adaptive'> </a> <div class='ptp-24-overlay'> </div></figure> <h3 class='title-14'><a href='" + @haberlink + "'><b>" + baslik + "</b></a></h3> <p class='p'></p> <div class='meta-tp-2'> <div class='date'><span>" + tarih + "</span></div> <div class='category'>" + kategoriadi + "</span></a> </div> </div> </article>";

        }
        baglanti.son();
        icerik.Text = sonucbir;




    }



    protected void videobtn_Click(object sender, EventArgs e)
    {
        butonclasstemizle();
        videobtn.CssClass = "active";
        SqlCommand yeni = new SqlCommand("SELECT TOP (50)* FROM videolar where ad like '%" + webkelimesonucsayfasi.Value + "%' order by ID desc", baglanti.baglanti());

        SqlDataReader sqloku = yeni.ExecuteReader();
         string sonucbir = "";
        string embededvideo = "";
        while (sqloku.Read())
        {
            string baslik = sqloku["ad"].ToString();
            string id = sqloku["ID"].ToString();
            string aciklama = sqloku["aciklama"].ToString();
            embededvideo = System.Net.WebUtility.HtmlDecode(sqloku["embedcode"].ToString());
            string tarih = sqloku["tarih"].ToString();
            string kategori = videoKategoriGetir(Convert.ToInt64(sqloku["kategoriID"].ToString()));

            string link = "/video/" + id + "/" + baglanti.basliktemizlesimdi(baslik);
            if (aciklama.Length > 60)
            {

                aciklama = aciklama.Substring(0, 59);
            }

            sonucbir += "<article class='post post-tp-24'> <figure class='videoadres'> "+embededvideo+" </figure> <h3 class='title-14'><a href='"+link+"'><b>" + baslik + "</b></a></h3> <p class='p'>" + aciklama + "</p> <div class='meta-tp-2'> <div class='date'><span>" + tarih + "</span></div> <div class='category'>" + kategori + "</span></a> </div> </div> </article>";
           
        }
        baglanti.son();
        icerik.Text = sonucbir;
    }

    protected void yazarlarbtn_Click(object sender, EventArgs e)
    {
        butonclasstemizle();
      yazarlarbtn.CssClass = "active";
        SqlCommand yeni = new SqlCommand("SELECT TOP (50)* FROM yazaryazilar where baslik like '%" + webkelimesonucsayfasi.Value + "%' order by id desc", baglanti.baglanti());

        SqlDataReader sqloku = yeni.ExecuteReader();
        string sonuc;
        sonuc = "";
        string sonucbir = "";
        string icerikstr = "";
        while (sqloku.Read())
        {
            string baslik = sqloku["baslik"].ToString();
            icerikstr = System.Net.WebUtility.HtmlDecode(sqloku["metin"].ToString());
            string tarih = sqloku["tarih"].ToString();
            string resim = yazarresim(Convert.ToInt64(sqloku["yazar_id"].ToString()));
            string yazarisimstr = yazaradi(Convert.ToInt64(sqloku["yazar_id"].ToString()));
            string id = sqloku["id"].ToString();
            if (icerikstr.Length > 60)
            {

                icerikstr = icerikstr.Substring(0, 59);
            }
            string link = "/Yazarlar/"+id+"/"+baglanti.basliktemizlesimdi(baslik);
            sonucbir += "<article class='post post-tp-24'> <figure> <a href='"+link+"'> <img src='/img/yazarlar/" + resim + "' style='width=150px;' alt='" + baslik + "' class='adaptive'> </a> <div class='ptp-24-overlay'> </div></figure> <h3 class='title-14'><a href='" + link + "'><b>" + baslik + "</b></a></h3> <p class='p'>" + icerikstr + "</p> <div class='meta-tp-2'> <div class='date'><span>" + tarih + "</span></div> <div class='category'>" + yazarisimstr + "</span></a> </div> </div> </article>";

        }
        baglanti.son();
        icerik.Text = sonucbir;
    }


    public string yazarresim(Int64 yazarid)
    {

        SqlCommand yazarcmd = new SqlCommand("select resim from yazarlar where yazar_id=" + yazarid + "", baglanti.baglanti());
        SqlDataReader yeniyazarresimoku = yazarcmd.ExecuteReader();
        string yazar = "";
        while (yeniyazarresimoku.Read())
        {

            yazar = yeniyazarresimoku[0].ToString();
        }
        baglanti.son();
        return yazar;
    }
    public string yazaradi(Int64 yazarid)
    {
        SqlCommand yazarcmd = new SqlCommand("select ad from yazarlar where yazar_id=" + yazarid + "", baglanti.baglanti());
        SqlDataReader yeniyazarresimoku = yazarcmd.ExecuteReader();
        string yazar = "";
        while (yeniyazarresimoku.Read())
        {

            yazar = yeniyazarresimoku[0].ToString();
        }
        baglanti.son();
        return yazar;


    }

    public string GaleriKategoriGetir(Int64 katID)
    {
        
        SqlCommand yazarcmd = new SqlCommand("select tur_ad from turlerGaleri where tur_id=" + katID + "", baglanti.baglanti());
        SqlDataReader yeniyazarresimoku = yazarcmd.ExecuteReader();
        string galerikategorisi = "";
        while (yeniyazarresimoku.Read())
        {

            galerikategorisi = yeniyazarresimoku[0].ToString();
        }
        baglanti.son();
        return galerikategorisi;


    }
    public string videoKategoriGetir(Int64 katID) {
        string kategoriAdi = "";

        SqlCommand yazarcmd = new SqlCommand("select tur_ad from turlerVideo where tur_id=" + katID + "", baglanti.baglanti());
        SqlDataReader yeniyazarresimoku = yazarcmd.ExecuteReader();
         while (yeniyazarresimoku.Read())
        {

            kategoriAdi = yeniyazarresimoku[0].ToString();
        }
        baglanti.son();


        return kategoriAdi;


            }
    public string HaberKategoriGetir(Int64 katID)
    {
        string kategori = "";


        SqlCommand yazarcmd = new SqlCommand("select tur_ad from turlerHaber where tur_id=" + katID + "", baglanti.baglanti());
        SqlDataReader yeniyazarresimoku = yazarcmd.ExecuteReader();
        while (yeniyazarresimoku.Read())
        {

            kategori = yeniyazarresimoku[0].ToString();
        }
        baglanti.son();


        return kategori;
    }
    public void butonclasstemizle()
    {

        galeribtn.CssClass = "";
        icerikbtn.CssClass = "";
        yazarlarbtn.CssClass = "";
        videobtn.CssClass = "";
        

    }
    }
}