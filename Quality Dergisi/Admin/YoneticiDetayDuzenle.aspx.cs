using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class YöneticiDetayDuzenle : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        string adm_id = "";
        bool yetki;
        int aktvalue, yetkis;
        protected void Page_Load(object sender, EventArgs e)
        {

            adm_id = Request.QueryString["adm_id"].ToString();
            if (Page.IsPostBack)
            {


            }
            else
            {

                SqlCommand yoneticiler = new SqlCommand("select * from yoneticiler where adm_id=" + adm_id + "", baglanti.baglanti());
                SqlDataReader yoneticidetayokur = yoneticiler.ExecuteReader();
                while (yoneticidetayokur.Read())
                {
                    yetki = yoneticidetayokur["adm_akt"].ToString() == "1" ? yetki = true : yetki = false;
                    adm_username.Value = yoneticidetayokur["adm_username"].ToString();
                    adm_password.Value = yoneticidetayokur["adm_password"].ToString();
                    adm_auth.Value = yoneticidetayokur["adm_auth"].ToString();
                    adm_akt.Checked = yetki;

                }

                baglanti.son();


            }

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
         
            adm_id = Request.QueryString["adm_id"].ToString();
            
            if (adm_akt.Checked)
                yetkis = 1;
            else
                yetkis = 0;
            SqlCommand guncelle = new SqlCommand("update yoneticiler set adm_username=@adm_username,adm_password=@adm_password,adm_auth=@adm_auth,adm_akt=@adm_akt where adm_id='" + adm_id + "'", baglanti.baglanti());

            guncelle.Parameters.AddWithValue("@adm_username", adm_username.Value);
            guncelle.Parameters.AddWithValue("@adm_password", adm_password.Value);
            guncelle.Parameters.AddWithValue("@adm_auth", adm_auth.Value);
            guncelle.Parameters.AddWithValue("@adm_akt", Convert.ToInt16(yetkis));
            guncelle.ExecuteNonQuery();
            baglanti.son();
            Response.Redirect("Yoneticiler.aspx?id=ok");
        }
    }
}