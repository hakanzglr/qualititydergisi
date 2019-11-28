using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

    protected void Page_Load(object sender, EventArgs e)
    {

        Videolar("*");



    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string sorguparametresi = kriter.SelectedValue.ToString();

        string kriterq = "";
        if (sorguparametresi == "b")
        {

            kriterq = kelime.Text + "%";


        }
        else if (sorguparametresi == "s")
        {

            kriterq = "%" + kelime.Text;

        }
        else
        {

            kriterq = "%" + kelime.Text + "%";

        }


        Videolar(kriterq);
    }

    public void Videolar(string turID)
    {
        string videONadres = "/img/video/";

        string tur = "";
        if (turID == "*")
        {

            tur = "SELECT top(50)* from videolar  order by ID desc";

        }
        else
        {

            tur = "SELECT top(50)* from videolar where ad like '" + turID + "' order by ID desc";

        }

        SqlCommand videosorgula = new SqlCommand(tur, baglanti.baglanti());
        SqlDataReader vd = videosorgula.ExecuteReader();
        string sonuc = "";
        while (vd.Read())
        {
            string videoresim = videONadres + vd["foto"].ToString();
            string baslik = vd["ad"].ToString();
            int kategori = Convert.ToInt16(vd["kategoriID"].ToString());
            string aciklama = vd["aciklama"].ToString();
            string kategoriadi = videoKategoriGetir(kategori);
            string idVideo = vd["ID"].ToString();
            string hit = vd["hit"].ToString();
            string spot = vd["spot"].ToString();
            string videoDuzenlelink = "<div class='duzenlelink' > <i class='icon-pencil'></i> </div>";

            sonuc += "<div  data-url='VideoDetay.aspx?Hid=" + idVideo + "'  class='col-md-12 detaycss'><div class='col-md-2'><img src='" + videoresim + "' style='width:100px;'/> </div> <div class='col-md-1'> " + kategoriadi + " </div> <div class='col-md-3'> " + baslik + " </div><div class='col-md-3'> " + spot + "</div>  <div class='col-md-2'> " + hit + " </div> <div class='col-md-1'> " + videoDuzenlelink + " </div></div>";

        }
        icerik.Text = sonuc;


        baglanti.son();





    }
    public string videoKategoriGetir(int katID)
    {
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
    }
}