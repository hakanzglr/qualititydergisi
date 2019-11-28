using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for Fotograflar
    /// </summary>
    public class Fotograflar : IHttpHandler
    {

        fonk baglanti = new fonk();


        public void ProcessRequest(HttpContext context)
        {
            string id = context.Request["id"];

            SqlCommand fotosorgula = new SqlCommand("select * from galeriFotograf where galeriID=" + id + "", baglanti.baglanti());
            SqlDataReader sqloku = fotosorgula.ExecuteReader();
            string resim = "";
            while (sqloku.Read()) {
                string resimadi = sqloku["ad"].ToString();
                string resimid = sqloku["ID"].ToString();
                string aciklama = sqloku["aciklama"].ToString();
                string sira =sqloku["sira"].ToString();


                string inputolustur = "<input type='text' class='resimaciklamasi form-control' value='"+aciklama+"' data-resimid='" + resimid + "'/>";
                string sirainput = "<input type='text' class='resimsira form-control' value='"+sira+"' data-resimid='" + resimid + "'/>";
                string sil = "<div class='kirmizicerceve' data-resimid='"+resimid+"'>Sil</div>";
                resim+="<div style='margin-bottom:5px;' class='row'><div class='col-md-4 text-center'><img class='yuklenenresim' src='../galeri/" + id + "/" + resimadi + "' data-id='" + resimid + "'/></div><div class='col-md-4'>" + inputolustur + "</div><div class='col-md-2'>"+sirainput+"</div>"+sil+"<div class='col-md-2'></div></div>";



            }
            baglanti.son();
            context.Response.Write(resim);





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