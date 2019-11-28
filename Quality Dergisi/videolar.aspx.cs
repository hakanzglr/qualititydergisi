using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class WebForm14 : System.Web.UI.Page
    {
       SagTarafKlas sagreklamlar = new SagTarafKlas();
    fonk baglanti = new fonk();
     string spot3test = "";
    protected void Page_Load(object sender, EventArgs e)
    {




 
        sagbolme.Text = sagreklamlar.SagTarafSiraOku();






        SqlCommand son4cmd = new SqlCommand("select top(6)*  from videolar where akt=1  order by ID desc", baglanti.baglanti());
        SqlDataReader son4cmdoku = son4cmd.ExecuteReader();
        int sayac = 0;
        int[] array1 = new int[6];

        while (son4cmdoku.Read())
        {
            array1[sayac] = Convert.ToInt32(son4cmdoku["ID"].ToString());
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



        slayt();


        HaberListesi();
      
       

    }



    

    

    public void HaberListesi()
    {
        SqlCommand katlistcmd = new SqlCommand("select top(10)* from videolar where akt=1 and   ID<" + m6.Text + " order by tarih desc", baglanti.baglanti());
        SqlDataReader katlistoku = katlistcmd.ExecuteReader();
        string strsonuc = "";
        string sonid = "";
        string id = "";
        while (katlistoku.Read())
        {

            string baslik = katlistoku["ad"].ToString();
            id = katlistoku["ID"].ToString();
            string resim = katlistoku["foto"].ToString();

            if (baslik.Length > 45)
            {

                baslik = baslik.Substring(0, 44) + "..";

            }

            strsonuc += "<div data-id='" + id + "' class='col-half'> <article class='post post-tp-8'><figure><a href='" + @"/video/" + id + "/" + baglanti.basliktemizlesimdi(baslik) + "' > <img src='" + @"/img/video/" + resim + "' height='242' width='345' alt='" + baslik + "' class='' /> </a> </figure> <h3 class='title-5'><a href='" + @"/video/" + id + "/" + baglanti.basliktemizlesimdi(baslik) + "'>" + baslik + "</a></h3> </article></div>";
            sonid = id;


        }

        sonyuklenenid.InnerText = sonid;

        baglanti.son();
        liste.InnerHtml = strsonuc;
 

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

        SqlCommand slaytResimSorgulama = new SqlCommand("select top(6)* from videolar where akt=1 order by ID desc ", baglanti.baglanti());
        SqlDataReader slaytResimOku = slaytResimSorgulama.ExecuteReader();
        while (slaytResimOku.Read())
        {
            string baslik = slaytResimOku["ad"].ToString();
            

            string resim = slaytResimOku["foto"].ToString();
            string id = slaytResimOku["ID"].ToString();
            SlaytResimleri += SlidebuyukresimHtml1 + "<div> <a href='" + @"/video/" + id + "/" + baglanti.basliktemizlesimdi(baslik) + "'><img src='" + @"/img/video/" + resim + "' style='width:100% !important;height:400px;'  class='' alt='" + baslik + "' ></img>" + " </a> </div> <div class='ptp-28-overlay'> <h2 class='title-18'>" + baslik + SlidebuyukresimHtml2;
            TumbResim += tumbHtml1 + "<p class='resimno'>" + sayac + "</p>" + tumbHtml2;
            KucukResimler += tumbHtml1 + "<img src ='" + @"/img/video/" +resim + "'   alt = '" + baslik + "' class='adaptive'/>" + tumbHtml2;
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