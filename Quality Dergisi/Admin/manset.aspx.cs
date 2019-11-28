using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class manset : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        protected void Page_Load(object sender, EventArgs e)
        {
       


            if (Page.IsPostBack)
            {


            }
            else
            {

                HaberList();
            }
        }


        public void HaberList()
        {

            SqlCommand son100habercmd = new SqlCommand("select top(100)spot,id from haberler where   akt=1 order by id desc", baglanti.baglanti());
            SqlDataReader son100haberokur = son100habercmd.ExecuteReader();
            //Haberlist1.DataSource = son100haberokur;
            Haberlist1.DataTextField = "spot";
            Haberlist1.DataValueField = "id";

            //Haberlist2.DataSource = son100haberokur;
            Haberlist2.DataTextField = "spot";
            Haberlist2.DataValueField = "id";

            while (son100haberokur.Read())
            {
                string spot = HttpUtility.HtmlDecode(son100haberokur["spot"].ToString()).ToString();
                string id = son100haberokur["id"].ToString();
                ListItem haber = new ListItem(spot, id);


                Haberlist1.Items.Add(haber);
                Haberlist2.Items.Add(haber);
                Haberlist3.Items.Add(haber);
                Haberlist4.Items.Add(haber);
                Haberlist5.Items.Add(haber);
                Haberlist6.Items.Add(haber);
                Haberlist7.Items.Add(haber);
                Haberlist8.Items.Add(haber);
                Haberlist9.Items.Add(haber);
                Haberlist10.Items.Add(haber);
            }
            son100haberokur.Close();
            baglanti.son();


     
 

        }
    }
}