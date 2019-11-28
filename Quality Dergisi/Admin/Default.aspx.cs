using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        HaberList();
    }


    public void HaberList()
    {

        SqlCommand son100habercmd = new SqlCommand("select top(100)spot,id from haberler where id<2000 and akt=1 order by id desc",baglanti.baglanti());
        SqlDataReader son100haberokur = son100habercmd.ExecuteReader();
        

        while (son100haberokur.Read())
        {
            string spot = son100haberokur["spot"].ToString();
            string id = son100haberokur["id"].ToString();
            ListItem haber = new ListItem(spot, id);


            //Haberlist1.Items.Add(haber );
            //Haberlist2.Items.Add(haber);
            //Haberlist3.Items.Add(haber);
            //Haberlist4.Items.Add(haber);
            //Haberlist5.Items.Add(haber);
            //Haberlist6.Items.Add(haber);
            //Haberlist7.Items.Add(haber);
            //Haberlist8.Items.Add(haber);
            //Haberlist9.Items.Add(haber);
            //Haberlist10.Items.Add(haber);
        }



        baglanti.son();
    }





    //    string sonuc = "";
    //    SqlCommand sor = new SqlCommand("SELECT turlerHaber.tur_ad as adi, ( select count(id) from haberler where haberler.tur_id=turlerHaber.tur_id ) AS hit FROM turlerHaber ORDER BY hit DESC", baglanti.baglanti());

    //    SqlDataReader oku = sor.ExecuteReader();

    //        while (oku.Read())
    //        {


    //            sonuc += "{ 'Status_Color': '" + oku["adi"].ToString() + "', 'Corrective_Action_ID': " + oku["hit"].ToString() + " },";




    //        }

    //int satirsayisi = sonuc.Length;
    //sonuc = sonuc.Substring(0, satirsayisi - 1);



    //        baglanti.son();


    //        string script1 = "<script type='text/javascript'> $(document).ready(function () {var options = { chart: { renderTo: 'SonDurum', type: 'pie', options3d: { enabled: true, alpha: 45 } }, title: { text: null }, subtitle: { text: null }, credits: { enabled: false }, tooltip: { pointFormat: '{series.name}: <b>{point.y:.1f}</b>' }, plotOptions: { pie: { innerSize: 100, depth: 45, allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: false }, showInLegend: true } }, series: [{ type: 'pie', name: 'Amount', data: [] }] }";
    //string script2 = "chart = new Highcharts.Chart(options); }); </script>";


    //         //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", script1+ " var data = { 'd': [ "+sonuc+"  ] }; $.each(data.d, function (key, value) { options.series[0].data.push([value.Status_Color, value.Corrective_Action_ID]); })" + script2, false);

    }
}