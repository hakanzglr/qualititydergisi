using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;

namespace Quality_Dergisi
{
       public class fonk
       {

       string metinhtml = "";

       public fonk()
       {

        }

        public SqlConnection baglanti()
        {



            // SqlConnection Sqlbaglantisi = new SqlConnection("Server=localhost;Database=quality;Trusted_Connection=Yes");
            //    SqlConnection Sqlbaglantisi = new SqlConnection("Data Source=.;Initial Catalog=u5324780_qualitydergisicom;Integrated Security=True;pooling=false;");

            //SqlConnection Sqlbaglantisi = new SqlConnection("Initial Catalog=DB130708111502; Data Source = 94.73.149.3;User ID = USR130708111502;Password =PSS!E0W4B8%");
             SqlConnection Sqlbaglantisi = new SqlConnection("Server=.; Database = quality; User Id =sa;Password = 1230;");


            //database = "Provider=SQLOLEDB; Data Source=94.73.149.3; Initial Catalog=DB130708111502; User ID=USR130708111502; Password=PSS!E0W4B8%"

            Sqlbaglantisi.Open();
            if (Sqlbaglantisi.State == ConnectionState.Closed)
            {
                Sqlbaglantisi.Open();
            }

            return (Sqlbaglantisi);
        }




        public string siteadres()
        {

            // return "http://sosyette.com/img/haber/";
            return "/img/haber/";
        }

        public string videoadres()
        {

            //  return "http://sosyette.com/img/video/";
            return "/img/video/";
        }

        public string videolink()
        {

            return "video/";

        }

        public string galerilink()
        {

            return "galeri/";

        }

        public string galeriadres()
        {

            //    return "http://sosyette.com/img/galeri/thumbnail/";
            return "img/galeri/thumbnail/";
        }

        public string sitebaslik()
        {
            string baslik = " Quality Dergisi - Sosyete ve Magazinin Kalbi";

            return baslik;

        }

        public string galeriFOTOadres()
        {


            // return "http://sosyette.com/galeri/";
            return "galeri/";
        }

        public string yazarresimGetir(string id)
        {

            SqlCommand yazarimgurlcmd =
                new SqlCommand("select resim from yazarlar where yazar_id=" + id + "", baglanti());
            DataRow dr = SatirGetir("select resim from yazarlar where yazar_id = " + id + "");
            son();
            return dr[0].ToString();
        }

        public string yazaradGetir(string id)
        {
            string yazar = "";
            DataRow dr = SatirGetir("select ad from yazarlar where yazar_id = " + id + "");
            yazar = dr[0].ToString();
            son();
            return yazar;


        }

        public string ReklamlarGetirSimdi(int ReklamId)
        {
            string reklamsonuc = "";

            SqlCommand reklamoku = new SqlCommand("select * from Reklamlar where id='" + ReklamId + "' and aktif=1",
                baglanti());
            SqlDataReader reklamrdr = reklamoku.ExecuteReader();

            string tur = "";
            string resim = "";
            string adres = "";


            while (reklamrdr.Read())
            {
                tur = reklamrdr["reklamTur"].ToString();
                resim = reklamrdr["resim"].ToString();
                adres = reklamrdr["adres"].ToString();
                metinhtml = reklamrdr["metinhtml"].ToString();

            }

            reklamrdr.Close(); //datareader
            reklamoku.Dispose(); //sqlcommand


            son();



            if (tur == "1")
            {




                reklamsonuc = "<div class='mobildostt' style='text-align:Center;'> <a   href='" + adres +
                              "' target='blank'><img   src='" + @"/dost/" + resim + "'   /></a></div>";


            }
            else if (tur == "2")
            {

                reklamsonuc = "<div class='mobildostt' style='text-align:Center;'>" +
                              System.Net.WebUtility.HtmlDecode(metinhtml) + "</div>";

            }

            return reklamsonuc;

        }



        public string menugetir()
        {
            SqlCommand menugetir = new SqlCommand("select * from turlerHaber  order by AnasayfaSira", baglanti());
            SqlDataReader menuoku = menugetir.ExecuteReader();
            string menu = "";
            int sayac = 1;
            while (menuoku.Read())
            {

                menu += "<li data-id='" + menuoku["tur_id"].ToString() + "' ><a  href='../" +
                        basliktemizlesimdi(menuoku["tur_ad"].ToString()) + "'>" + menuoku["tur_ad"].ToString() +
                        "</a></li>";
                sayac++;

            }


            son();
            return menu;
        }






        public void mailgonder(string name, string mailadres, string konu, string mesaj)
        {
            //İletişim Modülü

            string adres = "";
            string sifre = "";
            SmtpClient sc = new SmtpClient();
            sc.Port = 587;
            sc.Host = "mail.mail.com.tr";
            sc.EnableSsl = true;
            sc.Timeout = 50000;

            sc.Credentials = new NetworkCredential(adres, sifre);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(adres, " Siteden Mail Geldi");
            mail.To.Add(adres);
            mail.Subject = " Siteden Mail Geldi";
            mail.IsBodyHtml = true;
            mail.Body = "Ad Soyad : " + name + "<br><br>Mail Adresi : " + mailadres + "<br><br> Konu : " + konu +
                        "<br><br> Mesaj : " + mesaj;
            mail.Priority = MailPriority.High;
            sc.Send(mail);

        }




        public void son()
        {

            baglanti().Close();
            baglanti().Dispose();
            SqlConnection.ClearPool(baglanti());
        }


        public SqlCommand sqlcalistir(string sorgu)
        {
            SqlCommand yeni = new SqlCommand(sorgu, baglanti());

            return (yeni);
        }



        public DataTable TabloGetir(string sql)
        {
            SqlConnection baglan = baglanti();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, baglan);
            DataTable dt = new DataTable();
            try
            {
                adapter.Fill(dt);
            }
            catch (SqlException ex)
            {

                throw new Exception(ex.Message);
            }

            adapter.Dispose();
            son();

            return dt;

        }

        public DataRow SatirGetir(string sql)
        {
            SqlDataAdapter adap = new SqlDataAdapter(sql, baglanti());
            DataSet data = new DataSet();
            adap.Fill(data);
            son();
            return data.Tables[0].Rows[0];
        }

        public void DosyaSil(string dosyaadi)
        {
            string dizinli = "~/Admin/" + dosyaadi;
            if (System.IO.File.Exists(HttpContext.Current.Server.MapPath(dizinli)))
            {
                System.IO.File.Delete(HttpContext.Current.Server.MapPath(dizinli));

            }

        }




        public string basliktemizlesimdi(string baslik)
        {


            baslik = Regex.Replace(baslik, @"\'", string.Empty);
            baslik = baslik.ToString().ToLower();

            if (baslik.Length > 50)
            {

                baslik = baslik.Substring(0, 49) + "..";
            }

            baslik = baslik.Replace("'", "-");

            string strReturn = baslik.Trim();
            strReturn = strReturn.Replace("ğ", "g");
            strReturn = strReturn.Replace("Ğ", "g");
            strReturn = strReturn.Replace("ü", "u");
            strReturn = strReturn.Replace("Ü", "u");
            strReturn = strReturn.Replace("ş", "s");
            strReturn = strReturn.Replace("Ş", "s");
            strReturn = strReturn.Replace("ı", "i");
            strReturn = strReturn.Replace("İ", "i");
            strReturn = strReturn.Replace("ö", "o");
            strReturn = strReturn.Replace("Ö", "o");
            strReturn = strReturn.Replace("ç", "c");
            strReturn = strReturn.Replace("Ç", "c");
            strReturn = strReturn.Replace("-", "+");
            strReturn = strReturn.Replace(" ", "+");
            strReturn = strReturn.Trim();
            strReturn = new System.Text.RegularExpressions.Regex("[^a-zA-Z0-9+]").Replace(strReturn, "");
            strReturn = strReturn.Trim();
            strReturn = strReturn.Replace("+", "-");


            return strReturn;



        }



        }
}