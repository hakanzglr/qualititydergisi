using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for HaberEkle
    /// </summary>
    public class HaberEkle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string tur_id = context.Request["tur_id"];
            string baslik = context.Request["baslik"];
            string metin = context.Request["metin"].ToString();
            string foto = context.Request["foto"].ToString();
            try
            {

                try
                {

                    //context.Response.Write(tur_id.ToString() + baslik + metin + foto.ToString());
                    SqlCommand kayit = new SqlCommand("insert into haberler (tur_id,baslik,metin,foto,akt) " +
                                                      "values("+Convert.ToInt16(tur_id)+",'"+baslik.ToString()+"','"+ 
                      System.Net.WebUtility.HtmlEncode(metin.ToString())+"','"+foto.ToString()+"',1)", baglanti.baglanti());

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