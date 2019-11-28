using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class VideoDetay : System.Web.UI.Page
    {
         fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        string kategoriSira = "";
        string haberid = Request.QueryString[0].ToString();
        idaktif.Value = haberid;

        if (Page.IsPostBack)
        { 
        }
        else
        { 
            SqlCommand haberdetaysorgu = new SqlCommand("select * from videolar inner join turlerVideo on videolar.kategoriID = turlerVideo.tur_id where videolar.ID=" + haberid + " order by ID desc", baglanti.baglanti());
            SqlDataReader haberdetayokur = haberdetaysorgu.ExecuteReader();
            while (haberdetayokur.Read())
            { 
                haberbaslik.Text = haberdetayokur["ad"].ToString();
                summernote.InnerHtml = haberdetayokur["embedcode"].ToString();
                kategoriSira = haberdetayokur["tur_ad"].ToString();
                buyukresim.Src = baglanti.videoadres() + haberdetayokur["foto"].ToString();
                aciklamatxt.Text = haberdetayokur["aciklama"].ToString();
                spottxt.Text = haberdetayokur["spot"].ToString();

            }
            baglanti.son();

            kategori.SelectedIndex = 0;
            kombokategori.Value = "1";

            kategorigetir(kategoriSira);
            DurumGetir(Convert.ToInt32(haberid)); 
        }
       
    }


    void kategorigetir(string sira)
    {
        SqlCommand katcmd = new SqlCommand("select * from TurlerVideo", baglanti.baglanti()); 
        SqlDataAdapter da = new SqlDataAdapter(katcmd);
        DataSet ds = new DataSet();
        da.Fill(ds);  
        kategori.DataTextField = ds.Tables[0].Columns["tur_ad"].ToString();  
        kategori.DataValueField = ds.Tables[0].Columns["tur_id"].ToString();    
        kategori.DataSource = ds.Tables[0];
        kategori.DataBind();
        baglanti.son();
     }


    void DurumGetir(int id)
    {

        SqlCommand katcmd = new SqlCommand("select akt,ID from videolar where ID="+id+"", baglanti.baglanti());
        SqlDataAdapter veriAdaptoru = new SqlDataAdapter(katcmd); 
        DataTable veriTablosu = new DataTable(); 
        veriAdaptoru.Fill(veriTablosu); 
        Durum.DataSource = veriTablosu;
        Durum.DataBind();
        baglanti.son(); 
    }

    protected void Guncelle_Click(object sender, EventArgs e)
    {



        if (resimbuyuk.HasFile == true)
        {


            string benzersiz = Guid.NewGuid().ToString().Replace("-", string.Empty);
            string dosya = Server.MapPath("~/temp/") + benzersiz + resimbuyuk.FileName;

            resimbuyuk.SaveAs(dosya);

            if (boyutlandirsinmi.Checked == true)
            {




                using ( System.Drawing.Image source =
                    System.Drawing.Image.FromFile(Server.MapPath("~/temp/") + benzersiz + resimbuyuk.FileName))
                {

                    ImageCodecInfo codec = ImageCodecInfo.GetImageEncoders().First(c => c.MimeType == "image/jpeg");

                    EncoderParameters parameters = new EncoderParameters(3);
                    parameters.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 45L);
                    parameters.Param[1] = new EncoderParameter(System.Drawing.Imaging.Encoder.ScanMethod, (int)EncoderValue.ScanMethodInterlaced);
                    parameters.Param[2] = new EncoderParameter(System.Drawing.Imaging.Encoder.RenderMethod, (int)EncoderValue.RenderProgressive);
                    source.Save(Server.MapPath("~/img/video/") + benzersiz + resimbuyuk.FileName, codec, parameters);



                }


                FileInfo fi = new FileInfo(Server.MapPath("~/temp/" + benzersiz + resimbuyuk.FileName));
                fi.Delete();






            }
            else
            {
                resimbuyuk.SaveAs(Server.MapPath("~/img/video/") + benzersiz + resimbuyuk.FileName);


            }

            string metin2 = summernote.Value.ToString();
            SqlCommand VDupdate = new SqlCommand("update videolar set ad=@baslik,spot=@spot,foto=@foto, embedcode=@metin,aciklama=@aciklama,kategoriID=@kategori where ID=@id", baglanti.baglanti());
            VDupdate.Parameters.AddWithValue("@baslik", haberbaslik.Text);
            VDupdate.Parameters.AddWithValue("@aciklama", aciklamatxt.Text);
            VDupdate.Parameters.AddWithValue("@kategori",kombokategori.Value);
            VDupdate.Parameters.AddWithValue("@metin", System.Net.WebUtility.HtmlDecode(metin2));
            VDupdate.Parameters.AddWithValue("@spot", spottxt.Text);
            VDupdate.Parameters.AddWithValue("@id", Convert.ToInt32(Request.QueryString[0].ToString()));
            VDupdate.Parameters.AddWithValue("@foto", benzersiz+resimbuyuk.FileName);
            VDupdate.ExecuteNonQuery();

            Response.Redirect("VideoDetay.aspx?Hid?=" + idaktif.Value);



        }
        else
        {

            VideoGuncelle();
        } 

 
    }
    

    public void VideoGuncelle()
    {

        string metin2 = summernote.Value.ToString();
        SqlCommand guncelle2 = new SqlCommand("update videolar set ad=@baslik,spot=@spot, embedcode=@metin,aciklama=@aciklama,kategoriID=@kategori where ID=@id", baglanti.baglanti());
        guncelle2.Parameters.AddWithValue("@baslik", haberbaslik.Text);
        guncelle2.Parameters.AddWithValue("@aciklama", aciklamatxt.Text);
        guncelle2.Parameters.AddWithValue("@kategori", kombokategori.Value);
        guncelle2.Parameters.AddWithValue("@metin", System.Net.WebUtility.HtmlDecode(metin2));
        guncelle2.Parameters.AddWithValue("@spot", spottxt.Text);
        guncelle2.Parameters.AddWithValue("@id", Convert.ToInt32(Request.QueryString[0].ToString()));
        guncelle2.ExecuteNonQuery(); 
        Response.Redirect("VideoDetay.aspx?Hid?=" + idaktif.Value);

    }
    }
}