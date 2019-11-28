using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;


namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for FotografSil
    /// </summary>
    public class FotografSil : IHttpHandler
    {

        fonk baglanti = new fonk();


        public void ProcessRequest(HttpContext context)
        {
            string id = context.Request["id"];

            string foto = "";
            SqlCommand cmd = new SqlCommand($"select * from galeriFotograf where id= {id}", baglanti.baglanti());
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                foto = reader.GetString(2);

            }
            string dizinli = "~/img/galeri/thumbnail/" + foto; 
            if (System.IO.File.Exists(HttpContext.Current.Server.MapPath(dizinli)))
            {
                System.IO.File.Delete(HttpContext.Current.Server.MapPath(dizinli));
            }
            SqlCommand fotosorgula = new SqlCommand("delete from galeriFotograf where ID=" + id + "", baglanti.baglanti());
            fotosorgula.ExecuteNonQuery();
            baglanti.son();
            context.Response.Write("");

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