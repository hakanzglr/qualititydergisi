using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class SECGaleriler : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack)
        {

         
            SqlCommand galerisorgulama = new SqlCommand("select * from galeri where ad like '%" + kelime.Value + "%'", baglanti.baglanti());
            SqlDataReader oku = galerisorgulama.ExecuteReader();
            string ad = "";
            string resim = "";
            string tarih = "";
            string galeri = "";

            while (oku.Read())
            {
                string adres = ResolveUrl("/img/galeri/thumbnail/" + resim);

                ad = oku["ad"].ToString();
                resim = oku["resim"].ToString();
                tarih = oku["tarih"].ToString();
                galeri += "<div class='col-md-12'><img src='" + adres + "' width='100'/>'<b>" + ad + "</b></div>";
            }

            galerilist.InnerHtml = galeri;


        }
        else { 
        SqlCommand galerisorgulama = new SqlCommand("select top(20)* from galeri order by ID desc", baglanti.baglanti());
        SqlDataReader oku = galerisorgulama.ExecuteReader();
        string ad = "";
        string resim = "";
        string tarih = "";
        string galeri = "";

        while (oku.Read())
        {
          string adres= ResolveUrl("/img/galeri/thumbnail/"+ resim);

            ad = oku["ad"].ToString();
            resim = oku["resim"].ToString();
            tarih = oku["tarih"].ToString();
            galeri += "<div class='col-md-12'><img src='"+adres+"' width='100'/>'<b>" + ad + "</b></div>";
        }

        galerilist.InnerHtml =  galeri;

        }

    }

    protected void Ara_Click(object sender, EventArgs e)
    {

        SqlCommand galerisorgulama = new SqlCommand("select * from galeri where ad like '%"+ kelime.Value + "%'", baglanti.baglanti());
        SqlDataReader oku = galerisorgulama.ExecuteReader();
        string ad = "";
        string resim = "";
        string tarih = "";
        string galeri = "";

        while (oku.Read())
        {
            string adres = ResolveUrl("/img/galeri/thumbnail/" + resim);

            ad = oku["ad"].ToString();
            resim = oku["resim"].ToString();
            tarih = oku["tarih"].ToString();
            galeri += "<div class='col-md-12'><img src='" + adres + "' width='100'/>'<b>" + ad + "</b></div>";
        }

        galerilist.InnerHtml = galeri;

    }
    }
}