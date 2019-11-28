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
    public partial class WebForm6 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();

    protected void Page_Load(object sender, EventArgs e)
    {



        try
        {
            string id = Request.QueryString["id"].ToString();
            SqlCommand habergetir = new SqlCommand("select top(50)* from haberler inner join turlerHaber on haberler.tur_id = turlerHaber.tur_id where haberler.tur_id="+id+" order by id desc", baglanti.baglanti());




            SqlDataAdapter veriAdaptoru = new SqlDataAdapter(habergetir);

            DataTable veriTablosu = new DataTable(); // Veri tablomuz:


            veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:


            // sonuçlari DataList’e baglayalim:
            DataList1.DataSource = veriTablosu;
            DataList1.DataBind();
            baglanti.son();

        }
        catch
        {
            SqlCommand habergetir = new SqlCommand("select top(20)* from haberler inner join turlerHaber on haberler.tur_id = turlerHaber.tur_id order by id desc", baglanti.baglanti());




            SqlDataAdapter veriAdaptoru = new SqlDataAdapter(habergetir);

            DataTable veriTablosu = new DataTable(); // Veri tablomuz:


            veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:


            // sonuçlari DataList’e baglayalim:
            DataList1.DataSource = veriTablosu;
            DataList1.DataBind();
            baglanti.son();


        }


        KategoriDoldur();







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


        SqlCommand habergetir = new SqlCommand("select  * from haberler inner join turlerHaber on haberler.tur_id = turlerHaber.tur_id where baslik like '" + kriterq + "' order by  id desc", baglanti.baglanti());




        SqlDataAdapter veriAdaptoru = new SqlDataAdapter(habergetir);

        DataTable veriTablosu = new DataTable(); // Veri tablomuz:


        veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:


        // sonuçlari DataList’e baglayalim:
        DataList1.DataSource = veriTablosu;
        DataList1.DataBind();
        baglanti.son();
    }


    public void KategoriDoldur()
    {

        SqlCommand katcmd = new SqlCommand("select * from turlerHaber", baglanti.baglanti());
        SqlDataReader katokur = katcmd.ExecuteReader();
        string kategoriler = "";
        while (katokur.Read())
        {

            kategoriler += "<a href='Haberler.aspx?id=" + katokur["tur_id"].ToString()+"'>"+katokur["tur_ad"].ToString()+"</a>";

        }
        baglanti.son();

        kategorilerliteral.Text ="<div class='klist'>"+ kategoriler+"</div>";

    }
    }
}