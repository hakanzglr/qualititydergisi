using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {


            reklamturkombo.SelectedIndex = 0;

            kombokategori.Value = "1";

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
        

            string baslik = basliktxt.Value;
            string adres = reklamadrestxt.Value;
            string metinhtml = System.Net.WebUtility.HtmlEncode(summernote.Value.ToString());
            string reklamtur = kombokategori.Value;
            string resim = buyukresimadresi.Value;

   
            if(reklamtur == "1")
            {


            }
            else
            {
                resim = "bu reklam HTML dir";
                baslik = baslik + "               ";
            }

            SqlCommand kayit = new SqlCommand("insert into Reklamlar (baslik,resim,adres,aktif,metinhtml,reklamtur) values ('"+baslik+" ','"+resim+"','"+adres+"',1,'"+metinhtml+"',"+reklamtur+")", baglanti.baglanti());

            kayit.ExecuteNonQuery();
            baglanti.son();

            Response.Redirect("ReklamEkle.aspx?id=ok");

        }
    }
}