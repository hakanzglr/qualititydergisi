using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi
{
    /// <summary>
    /// Summary description for GaleriYukle
    /// </summary>
    public class GaleriYukle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string songelenid=context.Request["sonid"];

      
            try
            {

                SqlCommand katlistcmd = new SqlCommand("select top(6)* from galeri where ID<" +songelenid+" and aktif=1 order by tarih desc",baglanti.baglanti());
                SqlDataReader katlistoku = katlistcmd.ExecuteReader();
                string strsonuc = "";
                string idimage = "";
                while (katlistoku.Read())
                {

                    string baslik = katlistoku["ad"].ToString();
                    string id = katlistoku["ID"].ToString();
                    string resim = katlistoku["resim"].ToString();

                    if (baslik.Length > 45)
                    {

                        baslik = baslik.Substring(0, 44)+ "..";

                    }


                    strsonuc += "<div data-id='"+id+"' class='col-half'> <article class='post post-tp-8'><figure><a href='"+ @"/galeri/" + id + "/" +baglanti.basliktemizlesimdi(baslik)+"'> <img src='"+@"/img/galeri/thumbnail/" +resim+ "' height='242' width='345' alt='" + baslik + "' class='' /> </a>  </figure> <h3 class='title-5'><a href='"+ @"/galeri/" + id + "/" +baglanti.basliktemizlesimdi(baslik)+"'>"+baslik+"</a></h3> </article></div>";

                    idimage = id;

                } baglanti.son();
                string reklam = "<img data-id='"+idimage+"' src='"+@"/dost/bannerorta.png"+"'     height='90' width='100%'   class='adaptive' />";
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