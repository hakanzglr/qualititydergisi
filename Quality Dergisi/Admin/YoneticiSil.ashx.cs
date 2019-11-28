using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for YoneticiSil
    /// </summary>
    public class YoneticiSil : IHttpHandler
    {
        fonk baglanti = new fonk();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string id1 = context.Request["veri"];
            int id = Convert.ToInt32(id1);

            SqlCommand sql = new SqlCommand($"delete from yoneticiler where adm_id= {id}", baglanti.baglanti());
            sql.ExecuteNonQuery();
            baglanti.son();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}