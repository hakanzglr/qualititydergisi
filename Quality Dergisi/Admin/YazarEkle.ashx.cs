using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for YazarEkle
    /// </summary>
    public class YazarEkle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string ad = context.Request["ad"];
            string resim = context.Request["resim"];
      
            try
            {

                try
                
                {

                    //context.Response.Write(tur_id.ToString() + baslik + metin + foto.ToString());
                    SqlCommand kayit = new SqlCommand("insert into yazarlar (ad,resim,akt) values('"+ad+"','"+resim+"',1)", baglanti.baglanti());

                    kayit.ExecuteNonQuery();
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}