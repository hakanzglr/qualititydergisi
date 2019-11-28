using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for MegaUpload
    /// </summary>
    public class MegaUpload : IHttpHandler
    {

        fonk baglanti = new fonk();

        string uzanti = "";
        string uzantikirp = "";
        string dosya = "";
        public void ProcessRequest(HttpContext context)
        {
        
            try { 
                HttpFileCollection files = context.Request.Files;
                foreach (string key in files)
                {
                    string benzersiz = Guid.NewGuid().ToString().Replace("-", string.Empty);

                    HttpPostedFile file = files[key];
                    string fileName = file.FileName;
                    string dosyaadi = file.FileName;

                    string dosya = dosyaadi.Replace(" ", "");
                    string sondosyahali = benzersiz + dosya;


                    dosya =context.Server.MapPath("~/dost/") + benzersiz + dosyaadi;

                    file.SaveAs(dosya); 







                    context.Response.Write(sondosyahali);









                }

            }
            catch (System.IO.IOException e)
            {
                Console.WriteLine("Error reading from {0}. Message = {1}", e.Message);
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