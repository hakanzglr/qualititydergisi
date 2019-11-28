using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for Upload
    /// </summary>
    public class Upload : IHttpHandler
    {

         fonk baglanti = new fonk();

    string uzanti = "";
    string uzantikirp = "";
    string dosya = "";
    public void ProcessRequest(HttpContext context)
    {
        string konum = context.Request["konum"];
        string dizin = "";
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


                dosya =context.Server.MapPath("~/temp/") + benzersiz + fileName;

                file.SaveAs(dosya);
                using (Image source = Image.FromFile(context.Server.MapPath("~/temp/") + benzersiz + fileName))
                {

                    ImageCodecInfo codec = ImageCodecInfo.GetImageEncoders().First(c => c.MimeType == "image/jpeg");

                    EncoderParameters parameters = new EncoderParameters(3);
                    parameters.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 100L);
                    parameters.Param[1] = new EncoderParameter(System.Drawing.Imaging.Encoder.ScanMethod, (int)EncoderValue.ScanMethodInterlaced);
                    parameters.Param[2] = new EncoderParameter(System.Drawing.Imaging.Encoder.RenderMethod, (int)EncoderValue.RenderProgressive);






                    if (konum == "video")
                    {


                        dizin = "/img/video/";


                    }
                    else if (konum == "haber")
                    {

                        dizin = "/img/haber/";


                    }
                    else if (konum == "galeri")
                    {

                        dizin = "/img/galeri/thumbnail/";


                    }
                    else if (konum == "reklam")
                    {

                        dizin = "/dost/";
                    }
                    else if (konum == "yazar")
                    {

                        dizin = "/img/yazarlar/";
                    }
                    else if (konum == "yaziekle"){

                        dizin = "/img/haber/";

                    }


                    source.Save(context.Server.MapPath(dizin) + benzersiz + fileName, codec, parameters);

                }


                FileInfo fi = new FileInfo(context.Server.MapPath("~/temp/" + benzersiz + fileName));
                fi.Delete();















                context.Response.Write(benzersiz+fileName);









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