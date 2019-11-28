using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class SiteMaster : MasterPage
    {
    SagTarafKlas megabannerclass = new SagTarafKlas();
    fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {

        sosyallinklerfnk();
        MegaBanner();
        UstBanner();

        YanReklamlar();
        string digermenu1 = "<li> <a href='javascript:void(0)'>Diğer <i class='fa fa-angle-down'></i></a> <ul class='sub'>";
        string digermenu2 = "</ul></li>";
        SqlCommand menugetir = new SqlCommand("select * from turlerHaber  order by AnasayfaSira", baglanti.baglanti());
        SqlDataReader menuoku = menugetir.ExecuteReader();
        string menu = "";
        string menubasic = "";
        string digermenu = "";
        string digermenumobil = "";
        string url = Page.ResolveUrl("~/Kategori/");



        while (menuoku.Read())
        {

            string turad = baglanti.basliktemizlesimdi(menuoku["tur_ad"].ToString());
            string menudekiisim = menuoku["tur_ad"].ToString();
            string turid = menuoku["tur_id"].ToString();
            string digermenumu = menuoku["diger"].ToString();

            if (digermenumu == "1")
            {

                digermenu += "<li data-id = '" + turid + "'><a  href='" + url + turid + "/" + turad + "'>" + menudekiisim + " </a></li> "; ;
                digermenumobil += "<li class='mn-item' data-id = '" + turid + "'><a  href='" + url + turid + "/" + turad + "'>" + menudekiisim + " </a></li>";

                if (turid == "10")
                {
                    digermenu += "<li data-id='yazarlar'><a href='/Yazarlar/176/'>Yazarlar</a></li>";
                    digermenumobil += "<li class='mn-item' data-id='yazarlar'><a href='/Yazarlar/176/'>Yazarlar</a></li>";

                }


            }
            else
            {


                menu += "<li data-id='" + turid + "' ><a  href='" + url + turid + "/" + turad + "'>" + menudekiisim + "</a></li>";
                menubasic += "<li class='mn-item' data-id='" + turid + "' ><a  href='" + url + turid + "/" + turad + "'>" + menudekiisim + "</a></li>";
            }

        }
        baglanti.son();

        menu += "<li data-id='galeriler'><a href='/galeriler'>Foto GALERİ</a></li><li data-id='videolar'><a href='/videolar'>VİDEOLAR</a></li>" + digermenu1 + digermenu + digermenu2;
        baglanti.son();
        //ikincimenu.InnerHtml = menu;
        am_menulist.InnerHtml = menu;
        string mobiltoplinks = "<li class='mn-item' data-id='90'><a href='" + Page.ResolveUrl("~/galeriler") + "'>Foto Galeri</a></li><li class='mn-item' data-id='90'><a href='" + Page.ResolveUrl("~/videolar") + "'>Videolar</a></li><li class='mn-item' data-id='90'><a href='" + Page.ResolveUrl("~/iletisim/") + "'>İLETİŞİM</a></li><li class='mn-item' data-id='91'><a href='" + Page.ResolveUrl("~/reklam") + "'>REKLAM</a></li><li class='mn-item' data-id='92'><a href='" + Page.ResolveUrl("~/kunye/") + "'>KÜNYE</a></li>";
        mobilmenu.InnerHtml = menubasic + digermenumobil + mobiltoplinks;

        menu11.InnerHtml = menu + "";




    }

    public void sosyallinklerfnk()
    {
        string sosyalsonuc = "";
        SqlCommand sosyalcmd = new SqlCommand("select * from ayarlar", baglanti.baglanti());
        SqlDataReader sosyaloku = sosyalcmd.ExecuteReader();

        while (sosyaloku.Read())
        {

            sosyalsonuc += "<li class='tw'> <a target='blank' href='" + sosyaloku["facebook"].ToString() + "'> <i class='fa fa-facebook'></i> </a> </li> <li class='fb'> <a target='blank' href='" + sosyaloku["twitter"].ToString() + "'> <i class='fa fa-twitter'></i> </a> </li> <li class='dr'> <a target='blank' href='" + sosyaloku["instagram"].ToString() + "'> <i class='fa fa-instagram'></i> </a> </li> <li class='dr'> <a target='blank' href='" + sosyaloku["youtube"].ToString() + "'> <i class='fa fa-youtube'></i> </a> </li>";
            altaciklama.InnerText = sosyaloku["altaciklama"].ToString();
        }
        baglanti.son();
        sosyallinkler.InnerHtml = sosyalsonuc;
        sosyalalt.InnerHtml = sosyalsonuc;


    }

    public void MegaBanner()
    {

        megadost.InnerHtml = megabannerclass.MegaBannerGetir();

    }

    public void UstBanner()
    {


        //ustdost.InnerHtml = megabannerclass.UstBannerGetir();


        DuyuruGetir();
    }

    public void DuyuruGetir()
    {

        SqlCommand duyurucmd = new SqlCommand("select * from duyuru where aktif=1", baglanti.baglanti());
        SqlDataReader duyuruokur = duyurucmd.ExecuteReader();
        string duyurutxt = "";
        while (duyuruokur.Read())
        {

            duyurutxt = System.Net.WebUtility.HtmlDecode(duyuruokur["metin"].ToString());

        }
        if (duyurutxt.Length > 1)
        {
            duyuru.InnerHtml = duyurutxt;



        }
        else
        {

            //string popupScript = "<script language=JavaScript>";
            //popupScript += "document.getElementsByClassName('mfp-close').click();";
            //popupScript += "</";
            //popupScript += "script>";
            //Page.RegisterStartupScript("PopupScript", popupScript);
        }

        baglanti.son();

    }


    public void YanReklamlar()
    {
        soldost.Text = megabannerclass.SolGetir();
        sagdost.Text = megabannerclass.SagGetir();

    }
    }
}