using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for VideoDurumDegistir
    /// </summary>
    public class VideoDurumDegistir : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                HttpPostedFile postedFile = context.Request.Files["Filedata"];
                string cid = context.Request["veri"];
                try
                {

                    SqlDataReader okuyucu;

                    SqlCommand sor = new SqlCommand("SELECT akt as durum FROM videolar where ID="+Convert.ToInt32(cid)+"", baglanti.baglanti());


                    okuyucu = sor.ExecuteReader();
                    string durumoku="";
                    string sonuc = "";


                    bool yeni =true;
                    while (okuyucu.Read())

                    {

                        durumoku =okuyucu["durum"].ToString();
                        yeni = bool.Parse(durumoku);

                    }
                    baglanti.son();
                    if (yeni)
                    {

                        sonuc = "0";
                        yazi = "NO";

                    }
                    else {

                        sonuc = "1";
                        yazi = "OK";
                    }

                    SqlCommand guncelle = new SqlCommand("UPDATE videolar SET akt="+sonuc+" where ID="+Convert.ToInt16(cid)+"",baglanti.baglanti());

                    guncelle.ExecuteNonQuery();
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