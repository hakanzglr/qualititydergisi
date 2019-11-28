using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for KategoriEkle
    /// </summary>
    public class KategoriEkle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                string sira = context.Request["sira"];
                string ad = context.Request["ad"];
                try
                {


                    SqlCommand sor = new SqlCommand("insert into turlerHaber (AnasayfaSira,tur_ad,Anasayfada) values("+sira+",'"+ad+"',1)", baglanti.baglanti());

                    sor.ExecuteNonQuery();
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