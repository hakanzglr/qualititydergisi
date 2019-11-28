using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for GaleriSil
    /// </summary>
    public class GaleriSil : IHttpHandler
    {
        fonk baglanti = new fonk();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            string id1 = context.Request["veri"];
            int id = Convert.ToInt32(id1);
            string foto = "";
            SqlCommand cmd = new SqlCommand($"select * from galeri where ID= {id}", baglanti.baglanti());
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                foto = reader.GetString(4);

            } 
            string dizinli = @"img/galeri/thumbnail/" + foto;
            if (System.IO.File.Exists(HttpContext.Current.Server.MapPath(dizinli)))
            {
                System.IO.File.Delete(HttpContext.Current.Server.MapPath(dizinli));
            }
            SqlCommand sql = new SqlCommand($"delete from galeri where ID= {id}", baglanti.baglanti());
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