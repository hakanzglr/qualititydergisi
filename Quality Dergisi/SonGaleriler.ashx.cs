using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi
{
    /// <summary>
    /// Summary description for SonGaleriler
    /// </summary>
    public class SonGaleriler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string strsonuc = "";
            try
            {
                SqlCommand songaleri3 = new SqlCommand("select top(3)  tarih, ad, resim from galeri where  aktif=1 order by ID desc", baglanti.baglanti());
                SqlDataReader galerioku;
                galerioku = songaleri3.ExecuteReader();
                int sayac = 0;
                while (galerioku.Read())
                {
                    string tarih = galerioku["tarih"].ToString();
                    string ad = galerioku["ad"].ToString();
                    string resim = galerioku["resim"].ToString();
                    strsonuc += "<div class='item'> <article class='post post-tp-10'> <figure><a href='#'> <img class='adaptive' height='231' width='360' src='img/galeri/thumbnail/"+resim+"' /> </a></figure> <div class='ptp-10-data'> <h3 class='title-5'><a href='#'>"+ad+"</a></h3> <div class='meta-tp-2'></div> </div> </article> </div>";
                    sayac++;


                }
                baglanti.son();
                context.Response.Write(strsonuc);

            }
            catch
            {


            }



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