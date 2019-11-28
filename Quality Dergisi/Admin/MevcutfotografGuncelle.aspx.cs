using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class MevcutfotografGuncelle : System.Web.UI.Page
    {
        fonk baglanti = new fonk();
        protected void Page_Load(object sender, EventArgs e)
        {
            string galeriid = Request.QueryString["galeriid"].ToString();
            galeriidtxt.Value = galeriid;
        }
        protected void silmedugmesi_Click(object sender, EventArgs e)
        {
            SqlCommand silme = new SqlCommand("delete from galeriFotograf where id=",baglanti.baglanti());

        }
    }
}