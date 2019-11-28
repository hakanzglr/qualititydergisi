using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for yazarSiraDegistir
    /// </summary>
    public class yazarSiraDegistir : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                string id = context.Request["yazar_id"];
                string sira = context.Request["ord"];
                try
                {




                    SqlCommand guncelle = new SqlCommand("UPDATE yazarlar SET ord=" + sira + " where yazar_id=" + id + "", baglanti.baglanti());

                    guncelle.ExecuteNonQuery();
                    baglanti.son();

                }
                catch (Exception ex)
                {
                    context.Response.Write(ex.ToString());
                }
                finally
                {

                    context.Response.Write(id);
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