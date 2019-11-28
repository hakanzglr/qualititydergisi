using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi
{
    /// <summary>
    /// Summary description for YaziYukle
    /// </summary>
    public class YaziYukle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {            
            SagTarafKlas haberici = new SagTarafKlas();

            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string turid = context.Request["yazar_id"];
            string songelenid=context.Request["sonid"];


            try
            {

                SqlCommand katlistcmd = new SqlCommand("select top(1)* from YazarYazilar where yazar_id="+turid+" and id <" +songelenid+"    order by tarih desc",baglanti.baglanti());
                SqlDataReader katlistoku = katlistcmd.ExecuteReader();
                string strsonuc = "";

                while (katlistoku.Read())
                {

                    string baslik = katlistoku["baslik"].ToString();
                    string id = katlistoku["id"].ToString();

                    string baslikurl = baglanti.basliktemizlesimdi(baslik);
                    
                    baslikurl=  baslikurl.TrimEnd('?', '.', ',','-');
 

                    strsonuc +="<span class='yazibir' data-id='"+id+"' ><h2 data-id='"+baslikurl+"' class='title-21'>"+ baslik+ "</h2>  <p> " +System.Net.WebUtility.HtmlDecode( katlistoku["metin"].ToString())+ "</div>" ;



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