using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Quality_Dergisi
{
   public class SagTarafKlas
{
    string sonuc = "";
    string SagSonuc = "";

    string yazar1 = "<div id='sagyazarbir' style='padding-left: 10px;' class='recent-nws'> <div class='pst-block'> <div class='pst-block-head'> <h2 class='title-4'><strong>YAZARLAR</strong></h2> <div class='all-sb'></div> </div> <div class='pst-block-main'> <div class='inner-filters'></div> <div runat='server' id='yazaryazilar' class='js-csp-block js-tab-slider'>";
    string yazar2 = "</div> </div> <div style='' class='pst-block-foot'> <div class='js-sbr-pagination'></div> </div> </div> </div>";

    string videolar1 = "<div id='sagvideobir' class='sbr-slider'> <div class='pst-block'> <div class='pst-block-head'> <h2 class='title-4'><strong>VİDEO</strong></h2> </div> <div class='pst-block-main'> <div class='sidebar-slider'> <div id='SonVideolar' runat='server' class='js-sbr-slider'>";
    string videolar2 = "</div> <div class='sbr-navs js-sbr-navs'></div> </div> </div> </div> </div>";
    string galeriler1 = "<div   id='saggaleribir' class='sbr-slider'> <div class='pst-block'> <div class='pst-block-head'> <h2 class='title-4'><strong>GALERİ</strong> </h2> </div> <div class='pst-block-main'> <div class='sidebar-slider'> <div id='SonGaleriler' runat='server' class='js-sbr-slider'>";
    string galeriler2 = "</div> <div class='sbr-navs js-sbr-navs'></div> </div> </div> </div> </div>";
    string cadde1 = "<div class='pst-block-head'> <h2 class='title-4'> Cadde</h2></div><div><div class='bist100Wdg'> <div class='bist100WdgIn'> <div class='bist100WdgInTabs'>";
   string cadde2="<div runat='server' id='caddehtml' class='bistDataTxtArea'>";
    string cadde3 = "</div></div></div>";
    string tag1 = "<div class='post-tags'> <ul class='post-tags-list'>";
    string tag2 = "</ul> </div>";
 
    fonk baglanti = new fonk();
    public SagTarafKlas()
    {
       
    }


   

    public string SagTarafSiraOku()
    {

        SqlCommand siracmd = new SqlCommand("select * from SagTarafSiralama order by sira   asc", baglanti.baglanti());
        SqlDataReader sirardr;
        sirardr = siracmd.ExecuteReader();

        while (sirardr.Read())
        {
            int sira = Convert.ToInt16(sirardr["sira"].ToString());
            int kategoriid = Convert.ToInt16(sirardr["kategoriid"].ToString());
            int ReklamId = Convert.ToInt16(sirardr["reklamId"].ToString());

            if (kategoriid == 1)
            {

                Yazar(ReklamId);

            }
            else if (kategoriid == 2)
            {
                galeriler(ReklamId);


            }
            else if (kategoriid == 3)
            {

                Dergiozel(ReklamId);

            }
            else if (kategoriid == 4)
            {

                videolar(ReklamId);

            }
            else if (kategoriid == 5)
            {

                Cadde(ReklamId);


            }

        }        baglanti.son();

        return SagSonuc;
    }


    public void galeriler(int ReklamId)
    {

        SqlCommand songaleri3 = new SqlCommand("select top(3)  tarih, ad,ID, resim from galeri where  aktif=1 order by ID desc", baglanti.baglanti());
        SqlDataReader galerioku;
        galerioku = songaleri3.ExecuteReader();
        int sayac = 0;
        string strsonuc = "";
        while (galerioku.Read())
        {
            string tarih = galerioku["tarih"].ToString();
            string ad = galerioku["ad"].ToString();
            string resim = galerioku["resim"].ToString();
            string galeriID = galerioku["ID"].ToString();
            string linkbaslik = baglanti.basliktemizlesimdi(galerioku["ad"].ToString());
            strsonuc += "<div class='item'> <article class='post post-tp-10'> <figure><a href='" +@"/galeri/" + galeriID + "/" + linkbaslik + "'> <img  height='231' width='360' src='"+@"/img/galeri/thumbnail/" + resim + "' /> </a></figure> <div class='ptp-10-data'> <h3 class='title-5'><a href='" + @"/galeri/" + galeriID + "/" + linkbaslik + "'>" + ad + "</a></h3> <div class='meta-tp-2'></div> </div> </article> </div>";
            sayac++;


        }
        baglanti.son();

         string reklamkontrol = baglanti.ReklamlarGetirSimdi(ReklamId);
       




        SagSonuc += galeriler1 + strsonuc + galeriler2+ reklamkontrol;
    }

    public void videolar(int ReklamId)
    {

        SqlCommand songaleri3 = new SqlCommand("select top(3)  tarih, ad,ID, foto from videolar where  akt=1 order by ID desc", baglanti.baglanti());
        SqlDataReader galerioku;
        galerioku = songaleri3.ExecuteReader();
        string videosonuc = "";
        while (galerioku.Read())
        {
            string tarih = galerioku["tarih"].ToString();
            string ad = galerioku["ad"].ToString();
            string resim = galerioku["foto"].ToString();
            string linkbaslik = baglanti.basliktemizlesimdi(galerioku["ad"].ToString());
            string videoID = galerioku["ID"].ToString();
            videosonuc += "<div class='item'> <article class='post post-tp-10'> <figure><a href='" + @"/video/" + videoID + "/" + linkbaslik + "'> <img class='adaptive' height='231' width='360' src='" + @"/img/video/" + resim + "' /> </a></figure> <div class='ptp-10-data'> <h3 class='title-5'><a href='" + @"/video/" + videoID + "/" + linkbaslik + "'>" + ad + "</a></h3> <div class='meta-tp-2'></div> </div> </article> </div>";



        }

        baglanti.son();


        
        string reklamkontrol = baglanti.ReklamlarGetirSimdi(ReklamId);
        


        SagSonuc += videolar1 + videosonuc + videolar2 + reklamkontrol;



    }


    public void Yazar(int ReklamId)
    {

        string yazaryazisi = "";
        SqlCommand yazarokucumle = new SqlCommand("select  yazar_id, ad, resim, ord, akt from yazarlar where akt='true' order by ord", baglanti.baglanti());


        SqlDataReader yazarOkuyucu;
        yazarOkuyucu = yazarokucumle.ExecuteReader();
        string yazarresim = "";
        int sayac = 0;
        string uclu = "";

        while (yazarOkuyucu.Read())
        {
            string yazar = yazarOkuyucu["ad"].ToString();
            yazarresim = yazarOkuyucu["resim"].ToString();
            SqlCommand son10yazi = new SqlCommand("select id as yaziid,  baslik,convert(varchar, tarih, 104) as yazitarihi from yazarYazilar where tarih like ( Select max(tarih) from yazarYazilar where yazar_id='" + yazarOkuyucu["yazar_id"] + "' and akt='true') order by id asc", baglanti.baglanti());
            SqlDataReader yaziOkuyucu = son10yazi.ExecuteReader();



            while (yaziOkuyucu.Read())
            {



                yazaryazisi += "<article class='post post-tp-9'> <figure><a href='" + @"/Yazarlar/" + yaziOkuyucu["yaziid"].ToString() + "/" + baglanti.basliktemizlesimdi(yazar) + "/" + baglanti.basliktemizlesimdi(yaziOkuyucu["baslik"].ToString()) + "'> <img src='" + @"../Admin/img/galeri/thumbnail/" + yazarresim + "'  style='width:60px;' alt='yazarlar' class='adaptive' /></a></figure> <h3 class='title-6'><a href='" + @"/Yazarlar/" + yaziOkuyucu["yaziid"].ToString() + "/" + baglanti.basliktemizlesimdi(yazar) + "/" + baglanti.basliktemizlesimdi(yaziOkuyucu["baslik"].ToString()) + "'><span class='yazaradbuyuk'>" + yazar + "</span><br>" + yaziOkuyucu["baslik"].ToString() + "</a></h3> </article>";
                sayac++;


                //if (sayac == 5)
                //{

                //    uclu += "<div> " + yazaryazisi + "</div>";

                //    yazaryazisi = "";

                //}

            }
             

        }
        baglanti.son();

         string reklamkontrol = baglanti.ReklamlarGetirSimdi(ReklamId);
         


        SagSonuc += yazar1 + uclu + "<div>" + yazaryazisi + "</div>" + yazar2 + reklamkontrol;


    }

    public void Dergiozel(int ReklamId)
    {

         SagSonuc += " ";
    }

    public void Cadde(int ReklamId)
    {
        string cadde = "";


        SqlCommand caddecmd = new SqlCommand("select top(10)* from haberler where tur_id=8 and akt=1 order by tarih desc", baglanti.baglanti());
        SqlDataReader caddeokur = caddecmd.ExecuteReader();
        int sayac = 1;
        string linkler = "";
        while (caddeokur.Read())
        {


            string baslik2 = caddeokur["baslik"].ToString();
            string resim = caddeokur["foto"].ToString();
            string spot = caddeokur["spot"].ToString();
            string haberId = caddeokur["id"].ToString();

            string mesaj = baslik2;
            char[] oldValue = new char[] { 'ö', 'Ö', 'ü', 'Ü', 'ç', 'Ç', 'İ', 'ı', 'Ğ', 'ğ', 'Ş', 'ş' };
            char[] newValue = new char[] { 'o', 'O', 'u', 'U', 'c', 'C', 'I', 'i', 'G', 'g', 'S', 's' };
            for (int sayac2 = 0; sayac2 < oldValue.Length; sayac2++)
            {
                mesaj = mesaj.Replace(oldValue[sayac2], newValue[sayac]);
            }
            string baslik22 = mesaj.Replace(" ", "-");

            string link = haberId + "/" + baslik22 + "";

            linkler += "<a href='javascript:;'> <span class=''>"+sayac+"</span> </a> ";

            cadde += "<div style='display:none;' class='bistLine2'> <a href='" + @"/Haberi/" + link + "'>" + spot + "</a> <div> <a href='" + @"/Haberi/" + link + "'><img src='" + @"/img/haber/" + resim + "' class='cadderesim' /> </a> </div> </div>";

            sayac++;
        }


      baglanti.son();

        string olaysonuc = "";
        string reklamkontrol = baglanti.ReklamlarGetirSimdi(ReklamId);
        
            olaysonuc = reklamkontrol;


         



        if (cadde.Length < 1)
        {

            SagSonuc += "";

        }
        else
        {


            SagSonuc += cadde1 + linkler + cadde2 + cadde + cadde3 + olaysonuc;

        }
       
    }

    public string ebulten()
    {
        string ebultenhtml = "<div style='border: 1px solid #ff0000; border-radius: 4px; float: left;' class='sbsb-block-1'> <h4 class='title-8'><strong>E-bülten</strong> Kaydol</h4> Quality Bülten'e kaydol habersiz kalma ! <div class='sbsb-form-1'> <div class='sbsb-form'> <div class='sbsb-input'> <span class='sbsb-icon'><i class='li_mail'></i></span> <input type='email' placeholder='E-mail'> </div> <div class='sbsb-btn'> <button>Kaydol</button> </div> </div> </div> </div>";




        return ebultenhtml;


    }

    public string MegaBannerGetir()
    {
        string Megasonuc = "";


        SqlCommand megacmd = new SqlCommand("select top(1)* from Reklamlar where baslik like 'megabanner' and aktif=1 ",baglanti.baglanti());
        SqlDataReader megaokur = megacmd.ExecuteReader();

        while (megaokur.Read())
        {
            string buyukresim = @"/dost/" + megaokur["resim"].ToString();
            string kucukresim = @"/dost/" + megaokur["kod"].ToString();
            string reklamurl = megaokur["adres"].ToString();
            Megasonuc += "<a href='" + reklamurl + "' class='clicktag' target='_blank'></a> <div id='mobilbuyukbanner' style='display: none; top: 0px; left: 0px; right: 0px; text-align: center;'> <img src='" + buyukresim + "' style='width: 100%; max-width: 1920px; max-height: 480px;' /> </div> <div id='bnrdurum'>Gizle</div> <div class='big' style='display: none; top: 0px; left: 0px; right: 0px; text-align: center;'> <img src='" + buyukresim + "' style='width: 100%; max-width: 1920px; max-height: 480px;' /> </div> <div class='small' style='top: 0px; left: 0px; right: 0px; text-align: center; display: block;'> <img src='" + kucukresim + "' style='width: 100%; max-width: 1920px; max-height: 120px;' /> </div>";

        }
        baglanti.son();

        return Megasonuc;

    }

    public string SolGetir()
    {
        string sonuc = "";

        SqlCommand megacmd = new SqlCommand("select top(1)* from Reklamlar where baslik like 'soldost' and aktif=1 ", baglanti.baglanti());
        SqlDataReader megaokur = megacmd.ExecuteReader();

        while (megaokur.Read())
        {
            string buyukresim = @"/dost/" + megaokur["resim"].ToString();
             string reklamurl = megaokur["adres"].ToString();
            sonuc += "<a href='" + reklamurl + "'   target='_blank'>  <img src='" + buyukresim + "' style='width: 120px;'/></a>";

        }
        baglanti.son();


        return sonuc;
    }
    public string SagGetir()
    {
        string sonuc = "";

        SqlCommand megacmd = new SqlCommand("select top(1)* from Reklamlar where baslik like 'sagdost' and aktif=1 ", baglanti.baglanti());
        SqlDataReader megaokur = megacmd.ExecuteReader();

        while (megaokur.Read())
        {
            string buyukresim = @"/dost/" + megaokur["resim"].ToString();
            string reklamurl = megaokur["adres"].ToString();
            sonuc += "<a href='" + reklamurl + "'   target='_blank'>  <img src='" + buyukresim + "' style='width: 120px;'/></a>";
        }
        baglanti.son();

        return sonuc;
    }

    public string UstBannerGetir()
    {

        string UstSonuc = "";


        SqlCommand ustbannercmd = new SqlCommand("select top(1)* from Reklamlar where baslik like 'ustbannerrrrr' and aktif=1", baglanti.baglanti());
        SqlDataReader Ustokur = ustbannercmd.ExecuteReader();

        while (Ustokur.Read())
        {
            string resim = @"/dost/" + Ustokur["resim"].ToString();
             string reklamurl = Ustokur["adres"].ToString();
            UstSonuc += "<a href='" + reklamurl + "'  target='_blank'> <img src='" + resim + "' style='width: 100%; max-width: 1920px; max-height: 120px;' /></a>";

        }
        baglanti.son();

        return UstSonuc;

    }

    public string popupgetir()
    {
        string popup = "";


        SqlCommand popupcmd = new SqlCommand("", baglanti.baglanti());
        SqlDataReader popupokur = popupcmd.ExecuteReader();



        return popup;
    }
    public string TagGetir(string haberid)
    {
        string tag = "";
        string taglar = "";

        SqlCommand tagcmd = new SqlCommand("Select tag from haberler where id="+haberid+"",baglanti.baglanti());
        SqlDataReader tagokur = tagcmd.ExecuteReader();

        while (tagokur.Read())
        {

            
                string value = tagokur["tag"].ToString();
                // Split the string on line breaks.
                // ... The return value from Split is a string[] array.
                string[] lines = Regex.Split(value, ",");

                foreach (string line in lines)
                {
                    Console.WriteLine(line);
             


                tag += " <li><a class='news-detail' href='"+@"/Haberi\"+"'>" + line+"</a></li>";
   }
        }



        baglanti.son();

        taglar = tag1 + tag + tag2;


        return taglar;
    }

    

    public string HaberHit(string id)
    {

        string hitstr = "";




        SqlCommand hitcmd = new SqlCommand("update haberler set hit=(select hit from haberler where id =@id)+1 where id=@id",baglanti.baglanti());
        hitcmd.Parameters.AddWithValue("@id",id);
          hitcmd.ExecuteNonQuery();
        baglanti.son();


        return hitstr;

    }
    public string VideoHit(string id)
    {

        string hitstr = "";




        SqlCommand hitcmd = new SqlCommand("update videolar set hit=(select hit from videolar where ID=@id)+1 where  ID =@id", baglanti.baglanti());
        hitcmd.Parameters.AddWithValue("@id",Convert.ToInt32(id));
        hitcmd.ExecuteNonQuery();
        baglanti.son();


        return hitstr;

    }
    public string HabericiReklam(int kategoriid)
    {
        string satiricireklam = "";


        SqlCommand satiricicmd = new SqlCommand("select  *  from turlerHaber inner join reklamlar on Reklamlar.id=turlerHaber.icerikreklamid where turlerHaber.tur_id=" + kategoriid+ " and Reklamlar.aktif=1", baglanti.baglanti());
        SqlDataReader satiriciokur = satiricicmd.ExecuteReader();

        while (satiriciokur.Read())
        {
           

            string resim = satiriciokur["resim"].ToString();

            

            if (resim.Substring(0, 3) == "htt")
            {



            }
            else
            {
                resim =  @"/dost/" + resim;

            }



            satiricireklam += "<a target='blank' href='" + satiriciokur["adres"].ToString() +"'><img  style='width:100%;display:inline-block;' src='"  + resim + "'/></a>";

        }
        baglanti.son();
        









        return satiricireklam;


    }

    public string VideoiciReklam(int kategoriid)
    {
        string sonuc = "";
        SqlCommand satiricicmd = new SqlCommand("select  *  from turlerVideo inner join reklamlar on Reklamlar.id=turlerVideo.icerikreklamid where turlerVideo.tur_id=" + kategoriid + " and aktif=1", baglanti.baglanti());
        SqlDataReader satiriciokur = satiricicmd.ExecuteReader();

        while (satiriciokur.Read())
        {


            string resim = satiriciokur["resim"].ToString();



            if (resim.Substring(0, 3) == "htt")
            {



            }
            else
            {
                resim = @"/dost/" + resim;

            }



            sonuc += "<a target='blank' href='" + satiriciokur["adres"].ToString() + "'><img  style='width:100%;display:inline-block;' alt='Sponsor' class='lightimage' src='" + resim + "'/></a>";

        }
        baglanti.son();
        return sonuc;
    }
    public string GaleriiciReklam(int kategoriid)
    {
        string sonuc = "";
        SqlCommand satiricicmd = new SqlCommand("select  *  from turlerGaleri inner join reklamlar on Reklamlar.id=turlerGaleri.icerikreklamid where turlerGaleri.tur_id=" + kategoriid + " and aktif=1", baglanti.baglanti());
        SqlDataReader satiriciokur = satiricicmd.ExecuteReader();

        while (satiriciokur.Read())
        {


            string resim = satiriciokur["resim"].ToString();



            if (resim.Substring(0, 3) == "htt")
            {



            }
            else
            {
                resim = @"/dost/" + resim;

            }



            sonuc += "<a target='blank' href='" + satiriciokur["adres"].ToString() + "'><img  style='width:100%;display:inline-block;' alt='Sponsor' class='lightimage' src='" + resim + "'/></a>";

        }
        baglanti.son();
        return sonuc;
    }


}
}