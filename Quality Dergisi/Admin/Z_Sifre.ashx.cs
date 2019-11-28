using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for Z_Sifre
    /// </summary>
    public class Z_Sifre : IHttpHandler
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

                fonk baglanti = new fonk();
                SqlCommand sor = new SqlCommand("SELECT * FROM yoneticiler", baglanti.baglanti());
                SqlDataReader okuyucu = sor.ExecuteReader();
                string sifrete = "";
                while (okuyucu.Read())
                {
                     sifrete = okuyucu["adm_password"].ToString();
                }



                baglanti.son();


                SmtpClient sc = new SmtpClient();
                sc.Port = 587;
                sc.Host = "mail.qualitydergisi.com";
                sc.EnableSsl = false;
                sc.Timeout = 50000;
                sc.Credentials = new NetworkCredential("bilgi@qualitydergisi.com", "QUality265");
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("bilgi@qualitydergisi.com", "bilgi@qualitydergisi.com");
                mail.To.Add("bilgi@qualitydergisi.com");
                mail.Subject = "Site Yönetim Şifresi";
                mail.IsBodyHtml = true;
                mail.Body = sifrete;
                sc.Send(mail);
                yazi = "Adresinize gönderildi";



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