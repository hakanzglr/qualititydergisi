using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for GaleriTurBolumReklamGetir
    /// </summary>
    public class GaleriTurBolumReklamGetir : IHttpHandler
    {

       fonk baglanti = new fonk();
    public void ProcessRequest(HttpContext context)
    {
        string yazi = "";

        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        try
        {
            string cid = context.Request["veri"];
            try
            {

                SqlDataReader okuyucu;

                SqlCommand sor = new SqlCommand("SELECT * from Reklamlar where id="+Convert.ToInt32(cid)+"", baglanti.baglanti());


                okuyucu = sor.ExecuteReader();
                string resim = "";
                while (okuyucu.Read())

                {

                    resim = okuyucu["resim"].ToString();


                    string tur = okuyucu["reklamtur"].ToString();
                    string metinhtml = okuyucu["metinhtml"].ToString();
                    string id = okuyucu["id"].ToString();
                    string reklamtur = "";

                    if (resim.Substring(0, 3) == "htt")
                    {


                    }
                    else
                    {

                        resim = "../../dost/" + resim;
                    }



                    if (tur == "1")
                    {


                        reklamtur = "<img class='rimg' style='width:100%;height:40px;' src='" + resim + "'/>";

                    }
                    else
                    {

                        reklamtur = "<div class='rimg' data-reklamid='" + id + "'>" + System.Net.WebUtility.HtmlDecode(metinhtml) + "</div>";


                    }


                    yazi +="<h4>Yayındaki Reklam</h4>"+ reklamtur+ "<hr><div class='text-center'><span class='fontbuyut'>Seçebileceğin Reklamlar</span></div> "+reklamlar();
                }

                baglanti.son();
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.ToString());
            }
            finally
            {

                context.Response.Write(yazi);
                context.Response.StatusCode = 200;
            }
        }
        catch
        {
            context.Response.Write(yazi);
        }
    }

    public string reklamlar()
    {
        string sonuc = "";
        SqlCommand tumreklamlar = new SqlCommand("select * from Reklamlar where aktif=1",baglanti.baglanti());
        SqlDataReader reklamoku = tumreklamlar.ExecuteReader();
        string liste = "";
        while (reklamoku.Read())
        {

            string resim = reklamoku["resim"].ToString();
            string tur = reklamoku["reklamtur"].ToString();
            string metinhtml = reklamoku["metinhtml"].ToString();
                string id = reklamoku["id"].ToString();
            string reklamtur = "";
            if (resim.Substring(0, 3) == "htt")
            {
            }
            else
            {
                resim = "../../dost/" + resim;
            }
            if (tur == "1")
            {


                reklamtur = "<img class='rimg' style='width:100px;height:40px;' src='" + resim + "'/>";

            }
            else
            {

                reklamtur = "<div class='rimg' data-reklamid='" + id + "'>" + System.Net.WebUtility.HtmlDecode(metinhtml) + "</div>";


            }




            liste += "<div  onclick ='GaleriKategoriReklamDegistir("+reklamoku["id"].ToString()+")'><li><div class='fontbuyuk18'>"+reklamoku["baslik"].ToString()+"</div>"+reklamtur+"</div><div class='clearfix'></div></li>";

        }

        sonuc ="<ul class='reklamlistesidegistirme'>" +liste+"</ul>";
        baglanti.son();

        return sonuc;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    }
}