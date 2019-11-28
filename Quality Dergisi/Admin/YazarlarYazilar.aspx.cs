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
    public partial class WebForm16 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {

            SqlCommand habergetir = new SqlCommand("select top(50) yazarlar.yazar_id as yazarid,yazarYazilar.id as yaziid, baslik,yazarYazilar.tarih as tarih,hit,ad from yazarYazilar left join yazarlar on yazarYazilar.yazar_id = yazarlar.yazar_id order by tarih desc", baglanti.baglanti());
 

 
       
            SqlDataAdapter veriAdaptoru = new SqlDataAdapter(habergetir);

            DataTable veriTablosu = new DataTable(); // Veri tablomuz:

 
            veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:

 
            // sonuçlari DataList’e baglayalim:
            DataList1.DataSource = veriTablosu;
            DataList1.DataBind();
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
            else if (sorguparametresi =="s")
            {

                kriterq = "%"+ kelime.Text ;

            }
            else
            {

                kriterq = "%" + kelime.Text+"%";

            }


            SqlCommand habergetir = new SqlCommand("select yazarlar.yazar_id as yazarid,yazarYazilar.id as yaziid, baslik,yazarYazilar.tarih as tarih,hit,ad from yazarYazilar left join yazarlar on yazarYazilar.yazar_id = yazarlar.yazar_id where baslik like '"+kriterq+"' order by tarih desc", baglanti.baglanti());




            SqlDataAdapter veriAdaptoru = new SqlDataAdapter(habergetir);

            DataTable veriTablosu = new DataTable(); // Veri tablomuz:


            veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:


            // sonuçlari DataList’e baglayalim:
            DataList1.DataSource = veriTablosu;
            DataList1.DataBind();
            baglanti.son();
        }
    }
}