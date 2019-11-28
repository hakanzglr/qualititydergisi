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
    public partial class WebForm5 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {



            if (!Page.IsPostBack)
            {

                SqlCommand katcmd = new SqlCommand("select * from turlerHaber", baglanti.baglanti());

                SqlDataAdapter da = new SqlDataAdapter(katcmd);
                DataSet ds = new DataSet();
                da.Fill(ds);  // fill dataset
                kategori.DataTextField = ds.Tables[0].Columns["tur_ad"].ToString(); // text field name of table dispalyed in dropdown
                kategori.DataValueField = ds.Tables[0].Columns["tur_id"].ToString();             // to retrive specific  textfield name 

                kategori.DataSource = ds.Tables[0];
                kategori.DataBind();
 
                kombokategori.Text = "1";
                baglanti.son();
            }
       

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string foto = buyukresimadresi.Value.ToString();
            string habermetin = System.Net.WebUtility.HtmlEncode(summernote.Value.ToString());
            string spot = System.Net.WebUtility.HtmlEncode(haberspot.Value.ToString());
            int kategori = Convert.ToInt16(kombokategori.Text);
            string habertxt = System.Net.WebUtility.HtmlEncode(haberbaslik.Value.ToString());
            SqlCommand kayit = new SqlCommand("insert into haberler (tur_id,baslik,metin,foto,spot,akt) values(" +kategori+ ",'" + habertxt + "','" + habermetin+ "','" +  foto + "','"+spot+"',1)", baglanti.baglanti());

            kayit.ExecuteNonQuery();
            baglanti.son();

            Response.Redirect("HaberEkle.aspx?id=ok");

        }
    }
}