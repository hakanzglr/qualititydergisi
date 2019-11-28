using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        protected void Page_Load(object sender, EventArgs e)
        {
 
 


            var title = "<meta  property=\"og:title\" content=\"" + baglanti.sitebaslik() + "\" />";
       
            siteaciklamalar.Text =  title ; 
 
            Page.Title = "QUALITY of Magazine Reklam " + baglanti.sitebaslik();



        }
    }
}