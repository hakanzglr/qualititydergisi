using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class Gecici : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand yeni = new SqlCommand("select * from galeriFotograf where   GaleriID> 1901", baglanti.baglanti());

            SqlDataReader yeniokur = yeni.ExecuteReader();

            while (yeniokur.Read())
            {



                string adres = "http://sosyette.com/galeri/"+yeniokur["GaleriID"].ToString()+"/" + yeniokur["ad"].ToString();


                string path = Server.MapPath("~/galeri/" + yeniokur["GaleriID"].ToString() + "/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }





                using (StreamWriter w = File.AppendText(Server.MapPath("~/adresler.txt")))
                {
                    w.WriteLine(adres);
                }




            }


        }
    }
}