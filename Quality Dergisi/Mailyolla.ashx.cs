using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Quality_Dergisi
{
    /// <summary>
    /// Summary description for Mailyolla
    /// </summary>
    public class Mailyolla : IHttpHandler
    {

        string yazi = "";

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
        
            HttpPostedFile postedFile = context.Request.Files["Filedata"];

            string isim, konu, email, mesaj;
            email = context.Request["mail"];
            isim = context.Request["isim"];
            konu = context.Request["konu"];
            mesaj = context.Request["mesaj"];

            


            SmtpClient sc = new SmtpClient();
            sc.Port = 587;
            sc.Host = "mail.qualitydergisi.com";
            sc.EnableSsl = false;
            sc.Timeout = 50000;
            sc.Credentials = new NetworkCredential("bilgi@qualitydergisi.com", "QUality265");
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("bilgi@qualitydergisi.com", "bilgi@qualitydergisi.com");
            mail.To.Add("bilgi@qualitydergisi.com");
            mail.Subject = "İletişim Sayfasından Mail Geldi";
            mail.IsBodyHtml = true;
            mail.Body = "<b>Ad-Soyad : </b> " + isim + "<br><br><b>Mail Adresi : </b>" + email + "<br><br><b>Konu : </b>" + konu + "<br><br><b>Mesaj : </b>" + mesaj;
            sc.Send(mail);
            yazi = "Adresinize gönderildi";



       
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