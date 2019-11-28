using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        //private string id = "";
        //private object txtimt;
        //private object txtadres;
        //private  object yayinyonetmeni;
        //private  object mail;
        //private  object iletisim;
        //private  object satıssorumlusu;
        //private  object reklammuduru;

        //public object sitesorumlusu { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (Page.IsPostBack)
            {



            }
            else
            {

                SqlCommand sosyalcmd = new SqlCommand("select * from Kunye", baglanti.baglanti());
                SqlDataReader knyebilgi = sosyalcmd.ExecuteReader();

                while (knyebilgi.Read())
                {
                    txtimt1.Text = knyebilgi["imtiyaz_sahibi"].ToString();

                    adrestxt.Text = knyebilgi["adres"].ToString();

                    yayinyonetmenitxt.Text = knyebilgi["yayin_yntmeni"].ToString();
                    yaziisleri.Text = knyebilgi["yaziisleri_muduru"].ToString();
                    sitesorumlusutxt.Text = knyebilgi["site_sorumlusu"].ToString();
                    editor.Text = knyebilgi["editor"].ToString();
                    gorselyonetmentxt.Text = knyebilgi["gorsel_yonetmen"].ToString();
                    reklammudurutxt.Text = knyebilgi["reklam_muduru"].ToString();
                    satıssorumlusutxt.Text = knyebilgi["satis_sorumlusu"].ToString();
                    iletisimtxt.Text = knyebilgi["iletisim"].ToString();
                    mailtxt.Text = knyebilgi["mail"].ToString();

                }
                baglanti.son();
            }


        }



        protected void Guncelle_Click(object sender, EventArgs e)
        {
            SqlCommand guncelleayar = new SqlCommand("update Kunye set imtiyaz_sahibi='"+ txtimt1.Text+ "', adres='"+ adrestxt.Text+ "', yayin_yntmeni='"+ yayinyonetmenitxt.Text+ "', yaziisleri_muduru='"+ yaziisleri.Text+ "', site_sorumlusu='"+ sitesorumlusutxt.Text+ "', editor='"+ editor.Text+ "',  gorsel_yonetmen='"+ gorselyonetmentxt.Text+ "', reklam_muduru='"+ reklammudurutxt.Text+ "', satis_sorumlusu='"+ satıssorumlusutxt.Text+ "', iletisim='"+ iletisimtxt.Text+ "', mail='"+ mailtxt.Text+"' ", baglanti.baglanti());
        


            guncelleayar.ExecuteNonQuery();
            baglanti.son();
            Response.Redirect("kunye.aspx?id=ok");

        }
    }
}