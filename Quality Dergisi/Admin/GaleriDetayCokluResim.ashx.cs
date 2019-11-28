using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for GaleriDetayCokluResim
    /// </summary>
    public class GaleriDetayCokluResim : IHttpHandler
    {

         fonk baglanti = new fonk();

    string _uzanti = "";
    string uzantikirp = "";
    string dosya = "";
    public void ProcessRequest(HttpContext context)
    {
        string id = context.Request["id"];
        string sira = context.Request["sira"];

        HttpFileCollection files = context.Request.Files;
        foreach (string key in files)
        {
            string benzersiz = Guid.NewGuid().ToString().Replace("-", string.Empty);

            HttpPostedFile file = files[key];
            string fileName = file.FileName;
            string dosyaadi = file.FileName;

            string dosya = dosyaadi.Replace(" ", "");
            string sondosyahali = benzersiz + dosya;


            string temizisim = "";

            string path = context.Server.MapPath("~/galeri/" + id + "/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }




            dosya = context.Server.MapPath("~/temp/") + benzersiz + fileName;

            file.SaveAs(dosya);
            string dizin = "";
            using (Image source = Image.FromFile(context.Server.MapPath("~/temp/") + benzersiz + fileName))
            {

                ImageCodecInfo codec = ImageCodecInfo.GetImageEncoders().First(c => c.MimeType == "image/jpeg");

                EncoderParameters parameters = new EncoderParameters(3);
                parameters.Param[0] = new EncoderParameter(Encoder.Quality, 99L);
                parameters.Param[1] = new EncoderParameter(Encoder.ScanMethod, (int)EncoderValue.ScanMethodInterlaced);
                parameters.Param[2] = new EncoderParameter(Encoder.RenderMethod, (int)EncoderValue.RenderProgressive);
                dizin = "/galeri/" + id + "/";

                temizisim=Regex.Replace(fileName.Trim(), "[^A-Za-z0-9_. ]+", "");
                temizisim = Regex.Replace(temizisim.Trim(), " ", "");
                source.Save(context.Server.MapPath(dizin) +benzersiz+ temizisim, codec, parameters);


            }

            FileInfo fi = new FileInfo(context.Server.MapPath("~/temp/" + benzersiz + fileName));
            fi.Delete();









            SqlCommand galeriyeeklecmd = new SqlCommand("insert into galeriFotograf(ad,galeriID) values('" +benzersiz+temizisim + "'," + id + "); select SCOPE_IDENTITY();", baglanti.baglanti());
            string resimid = galeriyeeklecmd.ExecuteScalar().ToString();
            baglanti.son();

            string inputolustur = "<input type='text' class='resimaciklamasi form-control' data-resimid='" + resimid + "'/>";
            string sirainput = "<input type='text' class='resimsira form-control' value='" + sira + "'   data-resimid='" + resimid + "'/>";

            context.Response.Write("<div style='margin-bottom:5px;' class='row'><div class='col-md-4'><img class='yuklenenresim' src='../" + dizin + "/" + benzersiz+temizisim + "' data-id='" + resimid + "'/></div><div class='col-md-4'>" + inputolustur + "</div><div class='col-md-4'>" + sirainput + "</div></div>");









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