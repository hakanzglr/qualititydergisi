using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {



            }
            else
            {

                SqlCommand sosyalcmd = new SqlCommand("select * from Reklam", baglanti.baglanti());
                SqlDataReader reklambilgi = sosyalcmd.ExecuteReader();

                while (reklambilgi.Read())
                {
                    adrestx.Text = reklambilgi["Adres"].ToString();

                    reklam_muduru.Text = reklambilgi["Reklam_Muduru"].ToString();

                    mailt.Text = reklambilgi["Reklam_Mail"].ToString();
                    sorumlu.Text = reklambilgi["Satis_Sorumlusu"].ToString();
                    mailtx.Text = reklambilgi["Sorumlu_Mail"].ToString();
                    tel.Text = reklambilgi["Telefon"].ToString();
                    faks.Text = reklambilgi["Faks"].ToString();
                 

                }
                baglanti.son();
            }


        }



        protected void Guncelle_Click(object sender, EventArgs e)
        {
            SqlCommand guncelleayar = new SqlCommand("update Reklam set Adres='" + adrestx.Text + "', Reklam_Muduru='" + reklam_muduru.Text + "', Reklam_Mail='" + mailt.Text + "', Satis_Sorumlusu='" + sorumlu.Text + "', Sorumlu_Mail='" + mailtx.Text + "', Telefon='" + tel.Text + "',  Faks='" + faks.Text + "' ", baglanti.baglanti());



            guncelleayar.ExecuteNonQuery();
            baglanti.son();
            Response.Redirect("reklam.aspx?id=ok");

        }
    }
}