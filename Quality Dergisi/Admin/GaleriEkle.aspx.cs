using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand katcmd = new SqlCommand("select * from turlerGaleri", baglanti.baglanti());

            SqlDataAdapter da = new SqlDataAdapter(katcmd);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            kategori.DataTextField = ds.Tables[0].Columns["tur_ad"].ToString(); // text field name of table dispalyed in dropdown
            kategori.DataValueField = ds.Tables[0].Columns["tur_id"].ToString();             // to retrive specific  textfield name 

            kategori.DataSource = ds.Tables[0];
            kategori.DataBind();
            kategori.SelectedIndex=0;
            kombokategori.Value = "1";

 

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string foto = buyukresimadresi.Value.ToString();
            int kategori = Convert.ToInt16(kombokategori.Value);
            string habertxt = haberbaslik.Value.ToString();
            SqlCommand kayit = new SqlCommand("insert into galeri (ad,resim,kategoriID,aktif,aciklama) values(@ad,@resim,@kategoriID,@aktif,@aciklama)", baglanti.baglanti());
            kayit.Parameters.AddWithValue("@ad",habertxt);
            kayit.Parameters.AddWithValue("@resim", foto);
            kayit.Parameters.AddWithValue("@kategoriID", kategori);
            kayit.Parameters.AddWithValue("@aktif", 1);
            kayit.Parameters.AddWithValue("@aciklama", tag.Value.ToString());


            kayit.ExecuteNonQuery();
            baglanti.son();

            Response.Redirect("GaleriEkle.aspx?id=ok");

        }
    }
}