using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class Yoneticiekle : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        int adm_akt1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {

            if (adm_akt.Checked )
            {
                adm_akt1 = 1;
            }
            else
            adm_akt1 = 0;
            SqlCommand ordbul = new SqlCommand("select max(ord) ord from yazarlar", baglanti.baglanti());
            int ords = Convert.ToInt32(ordbul.ExecuteScalar());
            ords = ords + 1;
            SqlCommand kayit = new SqlCommand("insert into yoneticiler (adm_username,adm_password,adm_auth,adm_akt) values(@adm_username,@adm_password,@adm_auth,@adm_akt)", baglanti.baglanti());
            kayit.Parameters.AddWithValue("@adm_username", adm_username.Value.ToString());
            kayit.Parameters.AddWithValue("@adm_password", adm_password.Value.ToString());
            kayit.Parameters.AddWithValue("@adm_auth", adm_auth.Value.ToString());
            kayit.Parameters.AddWithValue("@adm_akt", Convert.ToInt16(adm_akt1));
            kayit.ExecuteNonQuery();
            baglanti.son();
            Response.Redirect("Yazarlar.aspx?id=ok");



        }

    }
}