using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        SagTarafKlas duyurubaglanti = new SagTarafKlas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {



            }
            else
            {

                SqlCommand duyurucmd = new SqlCommand("select * from duyuru",baglanti.baglanti());
                SqlDataReader duyuruokur = duyurucmd.ExecuteReader();

                while (duyuruokur.Read())
                {

                    duyuruhtml.InnerText = duyuruokur["metin"].ToString();



                }

                baglanti.son();

            }
      


        }









        protected void guncelle_Click(object sender, EventArgs e)
        {
            string duyuruhtmltxt = System.Net.WebUtility.HtmlDecode(duyuruhtml.Value.ToString());
            SqlCommand duyuruguncellecmd = new SqlCommand("update duyuru set metin=@metin",baglanti.baglanti());
            duyuruguncellecmd.Parameters.AddWithValue("@metin", duyuruhtmltxt);
            duyuruguncellecmd.ExecuteNonQuery();
            Response.Redirect("duyuru.aspx?id=ok");
        }
    }
}