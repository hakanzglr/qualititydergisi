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
    public partial class WebForm12 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {

       

            if (!Page.IsPostBack) { 

                SqlCommand katcmd = new SqlCommand("select * from turlerVideo", baglanti.baglanti());

                SqlDataAdapter da = new SqlDataAdapter(katcmd);
                DataSet ds = new DataSet();
                da.Fill(ds);  // fill dataset
                kategori.DataTextField = ds.Tables[0].Columns["tur_ad"].ToString(); // text field name of table dispalyed in dropdown
                kategori.DataValueField = ds.Tables[0].Columns["tur_id"].ToString();             // to retrive specific  textfield name 

                kategori.DataSource = ds.Tables[0];
                kategori.DataBind();
                kategori.SelectedIndex = 0;
                kombokategori.Value = "1";
            }




        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string foto = yuklenmisresim.Text;
            string embeded = System.Net.WebUtility.HtmlEncode(summernote.Value.ToString());
            string baslikvideo = System.Net.WebUtility.HtmlEncode(haberbaslik.Value.ToString());
            string kat = kombokategori.Value.ToString();
            string aciklama = System.Net.WebUtility.HtmlEncode(aciklamatxt.Value.ToString());
            string kayittxt = "insert into videolar (kategoriID,ad,aciklama,embedcode,foto,akt) values(" + kat + ",'" +baslikvideo + "','" + aciklama + "','" + embeded + "','" + foto + "',1)";

         
            SqlCommand kayit = new SqlCommand(kayittxt, baglanti.baglanti());


      

            kayit.ExecuteNonQuery();
            baglanti.son();

            Response.Redirect("VideoEkle.aspx?id=ok");

        }
    }
}