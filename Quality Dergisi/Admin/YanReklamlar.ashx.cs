using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for YanReklamlar
    /// </summary>
    public class YanReklamlar : IHttpHandler
    {

        fonk baglanti = new fonk();


        public void ProcessRequest(HttpContext context)
        {
            string tur = context.Request["tur"];

            try
            {
                HttpFileCollection files = context.Request.Files;
                foreach (string key in files)
                {
                  
                    string benzersiz =tur;

                    HttpPostedFile file = files[key];
                    string dosyaadi = file.FileName;

                    string dosya = dosyaadi;
                    string sondosyahali = benzersiz + dosya;


                    dosya = context.Server.MapPath("~/dost/") + benzersiz + dosyaadi;

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