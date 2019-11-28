using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for ReklamDegistir
    /// </summary>
    public class ReklamDegistir : IHttpHandler
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
                string reklamid = context.Request["reklamid"];
                string turid = context.Request["turid"];
                try
                {




                    SqlCommand guncelle = new SqlCommand("UPDATE turlerHaber SET reklamId=" + reklamid + "  where tur_id=" + Convert.ToInt16(turid) + "", baglanti.baglanti());

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