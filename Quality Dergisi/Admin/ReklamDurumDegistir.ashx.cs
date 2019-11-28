using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for ReklamDurumDegistir
    /// </summary>
    public class ReklamDurumDegistir : IHttpHandler
    {

           string cid = "";
        string sonuc = "";
        fonk baglanti = new fonk();

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                HttpPostedFile postedFile = context.Request.Files["Filedata"];
                cid= context.Request["veri"];
                try
                {
                    int durum = 0;
                    SqlCommand reklamdurumcmd = new SqlCommand("select aktif from Reklamlar where id="+cid+"",baglanti.baglanti());
                    SqlDataReader reklamdurumoku = reklamdurumcmd.ExecuteReader();
                    while (reklamdurumoku.Read())
                    {

                        durum = Convert.ToInt32(reklamdurumoku["aktif"].ToString());

                    }
                    baglanti.son();


                    if (durum == 0)
                    {

                        durum = 1;

                    }
                    else
                    {

                        durum = 0;
                    }
                    SqlCommand guncelle = new SqlCommand("UPDATE Reklamlar SET aktif="+durum+" where id=" + Convert.ToInt16(cid) + "", baglanti.baglanti());

                    guncelle.ExecuteNonQuery();
                    baglanti.son();

                    context.Response.Write(durum);

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

        public void SagreklamSorgula()
        {

            SqlCommand sagtarafsorgula = new SqlCommand("select isim from reklamlar inner join SagTarafSiralama on Reklamlar.id=SagTarafSiralama.reklamID where reklamId=" + Convert.ToInt32(cid) + "",baglanti.baglanti());
            SqlDataReader sagreklamokur = sagtarafsorgula.ExecuteReader();


            while (sagreklamokur.Read())
            {

                sonuc += "<li style='background:red'>Sağ Taraf " + sagreklamokur["isim"].ToString() +"</li>";


            }

            baglanti.son();
        }
    }
}