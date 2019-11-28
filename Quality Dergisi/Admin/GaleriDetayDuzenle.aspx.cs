


using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;


namespace Quality_Dergisi.Admin
{
    public partial class GaleriDetayDuzenle : System.Web.UI.Page
    {
        string kategoriSira = "";
    string haberid = "";
    fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
          haberid = Request.QueryString["Hid"].ToString();
        idaktif.Value = haberid;




         if (Page.IsPostBack)
        {


        }
        else
        {
            string kategoriid = "";
            SqlCommand haberdetaysorgu = new SqlCommand("select * from galeri inner join turlerGaleri on galeri.kategoriID = turlerGaleri.tur_id where ID="+haberid+" order by tarih desc", baglanti.baglanti());
            SqlDataReader haberdetayokur = haberdetaysorgu.ExecuteReader();
            while (haberdetayokur.Read())
            {

                haberbaslik.Text = haberdetayokur["ad"].ToString();
                 kategoriSira = haberdetayokur["tur_ad"].ToString();
                buyukresim.Src = "../img/galeri/thumbnail/" + haberdetayokur["resim"].ToString();
                kat.Value = haberdetayokur["kategoriID"].ToString();
                spottxt.Text = haberdetayokur["spot"].ToString();
                kategoriid = haberdetayokur["tur_ad"].ToString();
            }

             baglanti.son();
            kategorigetir(kategoriid);

        }

       
       
    }


    void kategorigetir(string kategoriisim)
    {
        SqlCommand katcmd = new SqlCommand("select * from turlerGaleri", baglanti.baglanti());
         




        SqlDataAdapter da = new SqlDataAdapter(katcmd);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        kategori.DataTextField = ds.Tables[0].Columns["tur_ad"].ToString(); // text field name of table dispalyed in dropdown
        kategori.DataValueField = ds.Tables[0].Columns["tur_id"].ToString();             // to retrive specific  textfield name 
        
        kategori.DataSource = ds.Tables[0];
        kategori.DataBind();
        baglanti.son();
        kategori.Items.FindByText(kategoriisim).Selected = true;

    }




    protected void Guncelle_Click(object sender, EventArgs e)
    { 

        if (resimbuyuk.HasFile ==true)
        {


            string benzersiz = Guid.NewGuid().ToString().Replace("-", string.Empty);
            string dosya = Server.MapPath("~/temp/") + benzersiz + resimbuyuk.FileName;

            resimbuyuk.SaveAs(dosya);

             if (boyutlandirsinmi.Checked == true)
             {

                 using (System.Drawing.Image img =
                     System.Drawing.Image.FromFile(Server.MapPath("~/temp/") + benzersiz + resimbuyuk.FileName))
                 {
                     
                 

                 
                        
                    ImageCodecInfo codec = ImageCodecInfo.GetImageEncoders().First(c => c.MimeType == "image/jpeg");

                    EncoderParameters parameters = new EncoderParameters(3);
                    parameters.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 45L);
                    parameters.Param[1] = new EncoderParameter(System.Drawing.Imaging.Encoder.ScanMethod, (int)EncoderValue.ScanMethodInterlaced);
                    parameters.Param[2] = new EncoderParameter(System.Drawing.Imaging.Encoder.RenderMethod, (int)EncoderValue.RenderProgressive);
                    img.Save(Server.MapPath("~/img/galeri/thumbnail/") + benzersiz + resimbuyuk.FileName, codec, parameters);

                    

                } 
                FileInfo fi = new FileInfo(Server.MapPath("~/temp/"+ benzersiz + resimbuyuk.FileName));
                fi.Delete(); 
            }
            else
            {
                resimbuyuk.SaveAs(Server.MapPath("~/img/galeri/thumbnail/") + benzersiz + resimbuyuk.FileName);


            }



            //resimbuyuk.SaveAs(Server.MapPath("~/img/galeri/thumbnail/" +benzersiz+resimbuyuk.FileName));

            SqlCommand guncelle = new SqlCommand("update galeri set ad=@baslik,resim=@resim,spot=@spot,kategoriID=@kategori  where ID=@id ", baglanti.baglanti());
            guncelle.Parameters.AddWithValue("@resim", benzersiz + resimbuyuk.FileName);
            guncelle.Parameters.AddWithValue("@kategori", Convert.ToInt32(kat.Value));
            guncelle.Parameters.AddWithValue("@spot", spottxt.Text); 
            guncelle.Parameters.AddWithValue("@baslik", haberbaslik.Text);
            guncelle.Parameters.AddWithValue("@id", Convert.ToInt32(idaktif.Value));
            guncelle.ExecuteNonQuery();
            baglanti.son();

        }
        else
        {


            SqlCommand guncelle = new SqlCommand("update galeri set ad=@baslik,kategoriID=@kategori,spot=@spot  where ID=@id ", baglanti.baglanti());
            guncelle.Parameters.AddWithValue("@baslik", haberbaslik.Text);
            guncelle.Parameters.AddWithValue("@kategori",Convert.ToInt32(kat.Value));
            guncelle.Parameters.AddWithValue("@spot", spottxt.Text); 
            guncelle.Parameters.AddWithValue("@id", Convert.ToInt32(idaktif.Value));
            guncelle.ExecuteNonQuery();
            baglanti.son();
        }



        string kategoriid = "";
        SqlCommand haberdetaysorgu = new SqlCommand("select * from galeri inner join turlerGaleri on galeri.kategoriID = turlerGaleri.tur_id where ID=" + idaktif.Value + " order by tarih desc", baglanti.baglanti());
        SqlDataReader haberdetayokur = haberdetaysorgu.ExecuteReader();
        while (haberdetayokur.Read())
        {

            haberbaslik.Text = haberdetayokur["ad"].ToString();
            kategoriSira = haberdetayokur["tur_ad"].ToString();
            buyukresim.Src = "../img/galeri/thumbnail/" + haberdetayokur["resim"].ToString();
            kategoriid = haberdetayokur["tur_id"].ToString();
            spottxt.Text = haberdetayokur["spot"].ToString();
        }
        baglanti.son();
        kategorigetir(kategoriSira);

    }






  

    
   

    protected void kategori_SelectedIndexChanged(object sender, EventArgs e)
    {
        kat.Value = kategori.SelectedValue;

    }
    }
}