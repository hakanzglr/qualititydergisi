using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi
{
    /// <summary>
    /// Summary description for SayfaYükle
    /// </summary>
    public class SayfaYükle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string turid = context.Request["tur_id"];
            string songelenid=context.Request["sonid"];

      
            try
            {

                SqlCommand katlistcmd = new SqlCommand("select top(6)* from haberler where tur_id="+turid+" and id<" +songelenid+" order by tarih desc",baglanti.baglanti());
                SqlDataReader katlistoku = katlistcmd.ExecuteReader();
                string strsonuc = "";
                string idimage = "";
                while (katlistoku.Read())
                {

                    string baslik = katlistoku["baslik"].ToString();
                    string id = katlistoku["id"].ToString();
                    string resim = katlistoku["foto"].ToString();

                    if (baslik.Length > 45)
                    {

                        baslik = baslik.Substring(0, 44)+ "..";

                    }


                    strsonuc += "<div data-id='"+id+"' class='col-half'> <article class='post post-tp-8'><figure><a href='../../Haberi/" + id + "/" +baglanti.basliktemizlesimdi(baslik)+"'> <img src='"+baglanti.siteadres() + resim + "' height='242' width='345' alt='" + baslik + "' class='adaptive' /> </a>  </figure> <h3 class='title-5'><a href='../../Haberi/" + id + "/" +baglanti.basliktemizlesimdi(baslik)+"'>"+baslik+"</a></h3> </article></div>";

                    idimage = id;

                } baglanti.son();
                string reklam = "<img data-id='"+idimage+"'  src='../../img/bannerorta.png' height='90' width='100%'   class='adaptive' />   ";
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