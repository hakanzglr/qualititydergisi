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
    public partial class HaberDetay : System.Web.UI.Page
    {
         string haberid = "";
    fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        string kategoriSira = "";
      haberid  = Request.QueryString[0].ToString();
        idaktif.Value = haberid;

        if (Page.IsPostBack)
        {
            
        }
        else
        {

            SqlCommand haberdetaysorgu = new SqlCommand("select * from haberler inner join turlerHaber on haberler.tur_id = turlerHaber.tur_id where haberler.id=" + haberid + " order by tarih desc", baglanti.baglanti());
            SqlDataReader haberdetayokur = haberdetaysorgu.ExecuteReader();
            while (haberdetayokur.Read())
            {

                haberbaslik.Text = System.Net.WebUtility.HtmlDecode(haberdetayokur["baslik"].ToString());
                summernote.InnerHtml = haberdetayokur["metin"].ToString();
                kategoriSira = haberdetayokur["tur_ad"].ToString();
                buyukresim.Src = "/img/haber/" + haberdetayokur["foto"].ToString();
                varsayilankategori.InnerHtml = "<span class='kategori' style='background-color:" + haberdetayokur["renk"].ToString() + "'>" + haberdetayokur["tur_ad"].ToString() + "</span>";
                haberspot.Text = System.Net.WebUtility.HtmlDecode(haberdetayokur["spot"].ToString());
                habertag.Text = haberdetayokur["tag"].ToString();

                kombokategori.Value = haberdetayokur["tur_id"].ToString();
            }

            kategorigetir(kategoriSira);
            DurumGetir(Convert.ToInt32(haberid));

        }

       
       
    }


    void kategorigetir(string sira)
    {
        SqlCommand katcmd = new SqlCommand("select * from turlerHaber", baglanti.baglanti());

        SqlDataAdapter da = new SqlDataAdapter(katcmd);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        kategori.DataTextField = ds.Tables[0].Columns["tur_ad"].ToString(); // text field name of table dispalyed in dropdown
        kategori.DataValueField = ds.Tables[0].Columns["tur_id"].ToString();             // to retrive specific  textfield name 
        
        kategori.DataSource = ds.Tables[0];
        kategori.DataBind();
       
      
    }


    void DurumGetir(int id)
    {

        SqlCommand katcmd = new SqlCommand("select akt,id from haberler where id="+id+"", baglanti.baglanti());

        SqlDataAdapter veriAdaptoru = new SqlDataAdapter(katcmd);

        DataTable veriTablosu = new DataTable(); // Veri tablomuz:


        veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:


        // sonuçlari DataList’e baglayalim:
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
                    source.Save(Server.MapPath("~/img/haber/") + benzersiz + resimbuyuk.FileName, codec, parameters);



                }


                FileInfo fi = new FileInfo(Server.MapPath("~/temp/" + benzersiz + resimbuyuk.FileName));
                fi.Delete();






            }
            else
            {
                resimbuyuk.SaveAs(Server.MapPath("~/img/haber/") + benzersiz + resimbuyuk.FileName);


            } 

            string metin = summernote.Value.ToString();

            SqlCommand guncelle = new SqlCommand("update haberler set baslik=@baslik,foto=@foto,spot=@spot,tag=@tag,tur_id=@turid, metin=@metin where id=@id ", baglanti.baglanti());
            guncelle.Parameters.AddWithValue("@baslik", haberbaslik.Text);
            guncelle.Parameters.AddWithValue("@metin", System.Net.WebUtility.HtmlEncode(metin));
            guncelle.Parameters.AddWithValue("@id", Convert.ToInt32(Request.QueryString[0].ToString()));
            guncelle.Parameters.AddWithValue("@foto", benzersiz + resimbuyuk.FileName);
            guncelle.Parameters.AddWithValue("@turid", Convert.ToInt16(kombokategori.Value));
            guncelle.Parameters.AddWithValue("@spot",haberspot.Text);
            guncelle.Parameters.AddWithValue("@tag", habertag.Text);
            guncelle.ExecuteNonQuery();

            Response.Redirect("HaberDetay.aspx?Hid?=" + haberid);



        }
        else
        {
            string metin = summernote.Value.ToString();

            SqlCommand guncelle = new SqlCommand("update haberler set baslik=@baslik,spot=@spot,tag=@tag,tur_id=@turid, metin=@metin where id=@id ", baglanti.baglanti());
            guncelle.Parameters.AddWithValue("@baslik", haberbaslik.Text);
            guncelle.Parameters.AddWithValue("@metin", System.Net.WebUtility.HtmlEncode(metin));
            guncelle.Parameters.AddWithValue("@id", Convert.ToInt32(Request.QueryString[0].ToString()));
            guncelle.Parameters.AddWithValue("@turid",Convert.ToInt16(kombokategori.Value));
            guncelle.Parameters.AddWithValue("@spot", haberspot.Text);
            guncelle.Parameters.AddWithValue("@tag", habertag.Text);


            guncelle.ExecuteNonQuery();
            Response.Redirect("HaberDetay.aspx?Hid?=" + haberid);

        }

    }
    }
}