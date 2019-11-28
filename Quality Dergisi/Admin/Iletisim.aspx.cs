using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {



            }
            else
            {

                SqlCommand sosyalcmd = new SqlCommand("select * from Iletisim", baglanti.baglanti());
                SqlDataReader iletisimbilgi = sosyalcmd.ExecuteReader();

                while (iletisimbilgi.Read())
                {
                    adrest.Text = iletisimbilgi["adres"].ToString();

                    mailt.Text = iletisimbilgi["mail"].ToString();

                    tel.Text = iletisimbilgi["telefon"].ToString();
                    fakst.Text = iletisimbilgi["Faks"].ToString();
                  

                }
                baglanti.son();
            }


        }



        protected void Guncelle_Click(object sender, EventArgs e)
        {
            SqlCommand guncelleayar = new SqlCommand("update Iletisim set  adres='" + adrest.Text+ "', mail='"+ mailt.Text+ "', telefon='"+tel.Text+ "', Faks='" + fakst.Text + "' ", baglanti.baglanti());
            


            guncelleayar.ExecuteNonQuery();
            baglanti.son();
            Response.Redirect("iletisim.aspx?id=ok");

        }
    }
}