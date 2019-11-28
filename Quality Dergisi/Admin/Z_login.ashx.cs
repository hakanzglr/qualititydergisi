using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for Z_login
    /// </summary>
    public class Z_login : IHttpHandler
    {

        string yazi = "";
        fonk baglanti = new fonk();
        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                HttpPostedFile postedFile = context.Request.Files["Filedata"];
                string cid = context.Request["veri"];
                try
                {

                    SqlDataReader okuyucu;

                    SqlCommand sor = new SqlCommand("SELECT adm_password  FROM yoneticiler", baglanti.baglanti());
                    okuyucu = sor.ExecuteReader();
                    string varsayilan = "";

                    while (okuyucu.Read())

                    {
                        varsayilan = okuyucu["adm_password"].ToString();

                    }




                
                    if (cid == varsayilan)
                    {
                        context.Response.Cookies["bilgi"].Value = "girisbasarili";
                        context.Response.Cookies["bilgi"].Expires = DateTime.Now.AddDays(1);
                        yazi = "ok"; 
                    }
                    else
                    { 
                        yazi = "Şifre Doğru Değildi"; 
                    }
                
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