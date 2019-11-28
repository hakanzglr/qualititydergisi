using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quality_Dergisi.Admin
{
    /// <summary>
    /// Summary description for CHARTSToplamHaberler
    /// </summary>
    public class CHARTSToplamHaberler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
    {
        fonk baglanti = new fonk();
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        string sonuc = "";
        try
        {





            try
            {

                SqlCommand sor = new SqlCommand("SELECT turlerHaber.tur_ad as adi,turlerHaber.renk as renk, ( select count(id) from haberler where haberler.tur_id=turlerHaber.tur_id ) AS hit FROM turlerHaber   ORDER BY hit DESC", baglanti.baglanti());

                SqlDataReader oku=sor.ExecuteReader();

                while (oku.Read())
                {


                    sonuc+="<div class='new' style='background:"+oku["renk"].ToString()+"'><b>"+  oku["adi"].ToString()+"</b>  <br> " +oku["hit"].ToString()+"<br></div>";




                }


                baglanti.son();



                string habersayisiSTR = "";

                SqlCommand habersayisisorgu = new SqlCommand("select count(*) from haberler",baglanti.baglanti());
                SqlDataReader habersayisisorgusuoku = habersayisisorgu.ExecuteReader();
                while (habersayisisorgusuoku.Read()) {
                    habersayisiSTR = habersayisisorgusuoku[0].ToString();

                }

                context.Response.Write("<div style=''>'"+sonuc+"</div><br><br><div class='clearfix'></div><br><br><div style='background:#dff0d8;color:#468847;border:1px solid #468847; padding:20px;>'<p style='font-size:20px !important'>"+habersayisiSTR+" Haber </p></div>");

                    baglanti.son();
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.ToString());
            }
            finally
            {

                context.Response.StatusCode = 200;
            }
        }
        catch
        {
            context.Response.Write("Hata Oldu Kapat Hemen");
        }
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