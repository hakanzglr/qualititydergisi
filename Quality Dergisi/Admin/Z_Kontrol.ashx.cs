using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for Z_Kontrol
    /// </summary>
    public class Z_Kontrol : IHttpHandler
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
                    HttpCookie cookieornek = context.Request.Cookies["bilgi"];
                    if (cookieornek != null)
                    {
                        yazi = "ok";

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