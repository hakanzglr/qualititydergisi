using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {



        }
        else
        {

            SqlCommand sosyalcmd = new SqlCommand("select * from ayarlar", baglanti.baglanti());
            SqlDataReader sosyaloku = sosyalcmd.ExecuteReader();

            while (sosyaloku.Read())
            {

                txtface.Text = sosyaloku["facebook"].ToString();
                txttwitter.Text = sosyaloku["twitter"].ToString();
                txtins.Text = sosyaloku["instagram"].ToString();
                txtyoutube.Text = sosyaloku["youtube"].ToString();
                altaciklama.InnerText = sosyaloku["altaciklama"].ToString();

            }
            baglanti.son(); Mekanlar();
        }
       

    }








    protected void Guncelle_Click(object sender, EventArgs e)
    {
        SqlCommand guncelleayar = new SqlCommand("update ayarlar set facebook='"+txtface.Text+"',instagram='"+txtins.Text+"',youtube='"+txtyoutube.Text+"',twitter='"+txttwitter.Text+"',altaciklama='"+altaciklama.InnerText+"' ",baglanti.baglanti());
        guncelleayar.ExecuteNonQuery();
        baglanti.son();
        Response.Redirect("ayarlar.aspx?id=ok");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand mekanguncelle = new SqlCommand("update Mekanlar set isim='"+TextBox1.Text+"' where id=1 ",baglanti.baglanti());
        mekanguncelle.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle1 = new SqlCommand("update Mekanlar set isim='" + TextBox2.Text + "' where id=2 ", baglanti.baglanti());
        mekanguncelle1.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle2 = new SqlCommand("update Mekanlar set isim='" + TextBox3.Text + "' where id=3 ", baglanti.baglanti());
        mekanguncelle2.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle3 = new SqlCommand("update Mekanlar set isim='" + TextBox4.Text + "' where id=4 ", baglanti.baglanti());
        mekanguncelle3.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle4 = new SqlCommand("update Mekanlar set isim='" + TextBox5.Text + "' where id=5 ", baglanti.baglanti());
        mekanguncelle4.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle5 = new SqlCommand("update Mekanlar set isim='" + TextBox6.Text + "' where id=6 ", baglanti.baglanti());
        mekanguncelle5.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle6 = new SqlCommand("update Mekanlar set isim='" + TextBox7.Text + "' where id=7 ", baglanti.baglanti());
        mekanguncelle6.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle7 = new SqlCommand("update Mekanlar set isim='" + TextBox8.Text + "' where id=8 ", baglanti.baglanti());
        mekanguncelle7.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle8 = new SqlCommand("update Mekanlar set isim='" + TextBox9.Text + "' where id=9 ", baglanti.baglanti());
        mekanguncelle8.ExecuteNonQuery();
        baglanti.son();
        SqlCommand mekanguncelle9 = new SqlCommand("update Mekanlar set isim='" + TextBox10.Text + "' where id=10 ", baglanti.baglanti());
        mekanguncelle9.ExecuteNonQuery();
        baglanti.son();
    }

    public void Mekanlar ()

    {



        SqlCommand mekancmd = new SqlCommand("select * from Mekanlar order by id",baglanti.baglanti());
        SqlDataReader mekanoku = mekancmd.ExecuteReader();

       while (mekanoku.Read())
        {
            if (mekanoku["id"].ToString() =="1")
            {
                TextBox1.Text = mekanoku["isim"].ToString();


            }
            else if(mekanoku["id"].ToString() == "2")
            {

                TextBox2.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "3")
            {

                TextBox3.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "4")
            {

                TextBox4.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "5")
            {

                TextBox5.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "6")
            {

                TextBox6.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "7")
            {

                TextBox7.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "8")
            {

                TextBox8.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "9")
            {

                TextBox9.Text = mekanoku["isim"].ToString();

            }
            else if (mekanoku["id"].ToString() == "10")
            {

                TextBox10.Text = mekanoku["isim"].ToString();

            }


        }
        baglanti.son();

    }
    }
}