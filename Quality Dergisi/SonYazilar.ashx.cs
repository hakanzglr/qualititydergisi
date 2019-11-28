using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi
{
    /// <summary>
    /// Summary description for SonYazilar
    /// </summary>
    public class SonYazilar : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string strsonuc = "";
            try
            {
                SqlCommand yazarokucumle = new SqlCommand("select  yazar_id, ad, resim, ord, akt from yazarlar where akt='true' order by ord", baglanti.baglanti());
                SqlDataReader yazarOkuyucu;
                yazarOkuyucu = yazarokucumle.ExecuteReader();
                string yazarresim = "";
                int sayac = 0;
                while (yazarOkuyucu.Read())
                {
                    string yazar = yazarOkuyucu["ad"].ToString();
                    yazarresim = yazarOkuyucu["resim"].ToString();
                    SqlCommand son10yazi = new SqlCommand("select   baslik,convert(varchar, tarih, 104) as yazitarihi from yazarYazilar where tarih like ( Select max(tarih) from yazarYazilar where yazar_id='" + yazarOkuyucu["yazar_id"] + "' and akt='true') order by id asc", baglanti.baglanti());
                    SqlDataReader yaziOkuyucu = son10yazi.ExecuteReader();
                    while (yaziOkuyucu.Read())
                    {
                        strsonuc += "<article class='post post-tp-9'> <figure><a href='#'> <img src='/img/yazarlar/" + yazarresim + "'  alt='yazarlar' class='adaptive' /></a></figure> <h3 class='title-6'><a href='#'>" + yazar + "<br>" + yaziOkuyucu["baslik"].ToString() + "</a></h3> <div class='date-tp-2'>" + yaziOkuyucu["yazitarihi"].ToString() + "</div> </article>";
                        sayac++;
                    }
                }
                baglanti.son();
                context.Response.Write(strsonuc);
            }
            catch
            {
                context.Response.Write("Hata Oldu Kapat Hemen");
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