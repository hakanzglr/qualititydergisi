using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  Quality_Dergisi;

namespace Quality_Dergisi
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SagTarafKlas sagreklamlar = new SagTarafKlas();
       
        fonk baglanti = new fonk();

        protected void Page_Load(object sender, EventArgs e)
        {
        
            sagbolme.Text = sagreklamlar.SagTarafSiraOku();
            Page.Title = "QUALITY of Magazine Mart sayısı ve önceki sayılar " + baglanti.sitebaslik();
        }
    }
}