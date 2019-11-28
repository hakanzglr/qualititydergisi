using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for HaberResmiGetir
    /// </summary>
    public class HaberResmiGetir : IHttpHandler
    {

        fonk baglanti = new fonk();
        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";

            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                string cid = context.Request["id"];
                try
                {

                    SqlDataReader okuyucu;

                    SqlCommand sor = new SqlCommand("SELECT foto from Haberler where id=" + Convert.ToInt32(cid) + "", baglanti.baglanti());


                    okuyucu = sor.ExecuteReader();
                    string resim = "";
                    while (okuyucu.Read())

                    {

                        resim = okuyucu["foto"].ToString();


                    }

                    baglanti.son();
                    context.Response.Write("<img class='haberresimm' src='../img/haber/"+resim+"' />");
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