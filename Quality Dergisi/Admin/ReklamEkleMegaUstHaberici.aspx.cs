using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm9 : System.Web.UI.Page
    {
       fonk baglanti = new fonk();

    protected void Page_Load(object sender, EventArgs e)
    {


 
 
    }

     

    

    protected void MegaKaydet(object sender, EventArgs e)
    {
        if (buyukresimfile.HasFile == true &&  kucukresimfile.HasFile==true)
        {

            SqlCommand yenisorgu = new SqlCommand("update reklamlar set resim=@buyukresim,kod=@kucukresim,adres=@adres where baslik like 'megabanner'", baglanti.baglanti());
            yenisorgu.Parameters.AddWithValue("@buyukresim", buyukresimadresi.Value.ToString());
            yenisorgu.Parameters.AddWithValue("@kucukresim", kucukresimadresi.Value.ToString());

            yenisorgu.Parameters.AddWithValue("@adres", megaadres.Value.ToString());
            yenisorgu.ExecuteNonQuery();
            Response.Redirect("reklameklemegausthaberici.aspx");
        }
        else
        {

            hata();
        }
    }

    protected void UstBannerKaydet(object sender, EventArgs e)
    {
        if (bannerfile.HasFile == true)
        {
            SqlCommand yenisorgu = new SqlCommand("update reklamlar set resim=@resim,adres=@adres where baslik like 'ustbannerrrrr'", baglanti.baglanti());
            yenisorgu.Parameters.AddWithValue("@resim",bannerresimadres.Value.ToString());
            yenisorgu.Parameters.AddWithValue("@adres", banneradres.Value.ToString());
            yenisorgu.ExecuteNonQuery();
            Response.Redirect("reklameklemegausthaberici.aspx");

        }
        else
        {

            hata();
        }
    }

    protected void HabericiKaydet(object sender, EventArgs e)
    {
        if (habericifile.HasFile == true)
        {


            SqlCommand yenisqlcmd = new SqlCommand("update reklamlar set adres=@adres,resim=@resim where baslik like 'satiricireklam'", baglanti.baglanti());
            yenisqlcmd.Parameters.AddWithValue("@adres",habericireklamadres.Value.ToString());
            yenisqlcmd.Parameters.AddWithValue("@resim", habericiadres.Value.ToString());
            yenisqlcmd.ExecuteNonQuery();
            Response.Redirect("reklameklemegausthaberici.aspx");


         }
        else
        {

            hata();
        }
    }


    public void hata()
    {


        Response.Write("<script> alert('Dosya Seçmediniz');</script>");

    }
    }
}