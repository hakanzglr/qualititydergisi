using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class CokluYukle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string galeriid = Request.QueryString["galeriid"].ToString();
            galeriidtxt.Value = galeriid;
        }
    }
}