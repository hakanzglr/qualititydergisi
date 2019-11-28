using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for MansetlerHaberler
    /// </summary>
    public class MansetlerHaberler : IHttpHandler
    {

        string yazi = "";
        fonk baglanti = new fonk();
        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                try
                {

                    SqlDataReader okuyucu;

                    SqlCommand sor = new SqlCommand("SELECT *  FROM SliderHaber", baglanti.baglanti());
                    okuyucu = sor.ExecuteReader();
                    int sayi = 1;
                    while (okuyucu.Read())

                    {
                        yazi+= "Haberlist"+sayi+" :'"+okuyucu["haberid"].ToString()+"',";
                        sayi++;

                    }








                }
                catch (Exception ex)
                {
                    context.Response.Write(ex.ToString());
                }
                finally
                {

                    context.Response.Write(" var MansetlerHaberler = {"+yazi+"}");
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