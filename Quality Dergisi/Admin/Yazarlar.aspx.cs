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
    public partial class Yazarlar : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        protected void Page_Load(object sender, EventArgs e)
        {
          
            SqlCommand habergetir = new SqlCommand("select * from yazarlar", baglanti.baglanti());
            SqlDataAdapter veriAdaptoru = new SqlDataAdapter(habergetir);
            DataTable veriTablosu = new DataTable(); // Veri tablomuz:
            veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:
            DataListYazar.DataSource = veriTablosu;// sonuçlari DataList’e baglayalim:
            DataListYazar.DataBind();
            baglanti.son();

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string sorguparametresi = kriter.SelectedValue.ToString();

            string kriterq = "";
            if (sorguparametresi == "b")
            {

                kriterq = kelime.Text + "%";


            }
            else if (sorguparametresi == "s")
            {

                kriterq = "%" + kelime.Text;

            }
            else
            {

                kriterq = "%" + kelime.Text + "%";

            }


            SqlCommand habergetir = new SqlCommand("select * from yazarlar  where ad like  '" + kriterq+ "'" , baglanti.baglanti());




            SqlDataAdapter veriAdaptoru = new SqlDataAdapter(habergetir);

            DataTable veriTablosu = new DataTable(); // Veri tablomuz:


            veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:


            // sonuçlari DataList’e baglayalim:
            DataListYazar.DataSource = veriTablosu;
            DataListYazar.DataBind();
            baglanti.son();
        }
    }
}