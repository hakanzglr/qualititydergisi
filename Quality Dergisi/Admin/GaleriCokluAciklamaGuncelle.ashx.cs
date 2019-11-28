using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for GaleriCokluAciklamaGuncelle
    /// </summary>
    public class GaleriCokluAciklamaGuncelle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string yazi = "";
            fonk baglanti = new fonk();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                string id = context.Request["id"];
                string aciklama = context.Request["aciklama"];
                try
                {

                 


                    SqlCommand guncelle = new SqlCommand("UPDATE galeriFotograf SET aciklama='"+aciklama+"' where ID="+id+"",baglanti.baglanti());
                   
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