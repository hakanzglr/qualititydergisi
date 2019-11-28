using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.abone
{
    public partial class DetayMusteri : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        protected void Page_Load(object sender, EventArgs e)
        {
            string abone   = Request.QueryString["id"].ToString();
            aboneid.InnerText = abone;

            SqlCommand  musteri= new SqlCommand("select FORMAT(basvurutarihi , 'dd.MM.yyyy') as itarih,FORMAT(baslangic , 'dd.MM.yyyy') as bt,FORMAT(baslangic , 'dd.MM.yyyy') as bitis,teslimpk,firmaisim,tel,durum,teslimil,teslimadres,teslimpk,teslimilce,faturaadres,faturail,faturailce,faturapk,isim,eposta,tcno from musteri where id=@id", baglanti.baglanti());
            musteri.Parameters.AddWithValue("@id",abone);
            SqlDataReader oku = musteri.ExecuteReader();

            while (oku.Read())
            {
                string bt = oku["bt"].ToString();
                if (bt == "")
                {


                }
                else
                {
                    string bitis = DateTime.Parse(bt).AddYears(1).ToString("dd.MM.yyyy");

                    abonelik.Visible = false;
                    baslangic.InnerText = bt+ " -  " + bitis;

                }


                mad.Value = oku["isim"].ToString();
                mtc.Value = oku["tcno"].ToString();
                eposta.Value = oku["eposta"].ToString();
                mbasvuru.Value = oku["itarih"].ToString();
                tadres.Value = oku["teslimadres"].ToString() +" "+ oku["teslimpk"].ToString() +" " + oku["teslimilce"].ToString() +" " + oku["teslimil"].ToString() ;
                fadres.Value = oku["faturaadres"].ToString() + " " + oku["faturapk"].ToString() + " " + oku["faturailce"].ToString() + " " + oku["faturail"].ToString();
                fadi.Value = oku["firmaisim"].ToString();
            }

            baglanti.son();



        }
    }
}