using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for KategoriAnasayfaDegistir
    /// </summary>
    public class KategoriAnasayfaDegistir : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                string cid = context.Request["veri"];
                try
                {

                    SqlDataReader okuyucu;

                    SqlCommand sor = new SqlCommand("SELECT Anasayfada as durum FROM turlerHaber where tur_id="+Convert.ToInt32(cid)+"", baglanti.baglanti());


                    okuyucu = sor.ExecuteReader();
                    int durumoku = 0;
                    string sonuc = "";

                    while (okuyucu.Read())

                    {

                        durumoku =Convert.ToInt16(okuyucu["durum"].ToString());


                    }
                    if (durumoku==1)
                    {

                        sonuc = "0";
                        yazi = cid;

                    }
                    else {

                        sonuc = "1";
                        yazi = cid;
                    }


                    SqlCommand guncelle = new SqlCommand("UPDATE turlerHaber SET Anasayfada="+sonuc+" where tur_id="+Convert.ToInt16(cid)+"",baglanti.baglanti());

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