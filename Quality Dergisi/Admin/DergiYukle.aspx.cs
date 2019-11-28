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
    public partial class DergiYukle : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand katcmd = new SqlCommand("select * from DergiYukle", baglanti.baglanti());

            SqlDataAdapter da = new SqlDataAdapter(katcmd);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            //kategori.DataTextField = ds.Tables[0].Columns["tur_ad"].ToString(); // text field name of table dispalyed in dropdown
            //kategori.DataValueField = ds.Tables[0].Columns["tur_id"].ToString();             // to retrive specific  textfield name 

            //kategori.DataSource = ds.Tables[0];
            //kategori.DataBind();
            //kategori.SelectedIndex = 0;
            



        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
           

            string foto = buyukresimadresi.Value.ToString();
            string resimadi = resimismi.Value.ToString();
           


            SqlCommand kayit = new SqlCommand("insert into DergiYukle (resim,resimadi) values(@resim,@resimadi)", baglanti.baglanti());
            kayit.Parameters.AddWithValue("@resim", foto);

            kayit.Parameters.AddWithValue("@resimadi", resimadi); 
          
           // file upload ( aasdad)

            kayit.ExecuteNonQuery();
            baglanti.son();

            Response.Redirect("DergiYukle.aspx?id=ok");

        }

       
    }
}