using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.Admin
{
    public partial class YaziDetay : System.Web.UI.Page
    {
       fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        string kategoriSira = "";
        string yaziid = Request.QueryString[0].ToString();
        idaktif.Value = yaziid;

        if (Page.IsPostBack)
        {


        }
        else
        {

            SqlCommand haberdetaysorgu = new SqlCommand("select ad,metin,tarih,baslik from yazarYazilar inner join yazarlar on yazarYazilar.yazar_id = yazarlar.yazar_id where yazarYazilar.id=" + yaziid + " order by tarih desc", baglanti.baglanti());
            SqlDataReader haberdetayokur = haberdetaysorgu.ExecuteReader();
            while (haberdetayokur.Read())
            {

                haberbaslik.Text = haberdetayokur["baslik"].ToString();
                summernote.InnerHtml = haberdetayokur["metin"].ToString();
                kategoriSira = haberdetayokur["ad"].ToString();
                 varsayilankategori.InnerHtml = "<span class='kategori' >" + haberdetayokur["ad"].ToString() + "</span>";

                 
            }

            kategorigetir(kategoriSira);
            DurumGetir(Convert.ToInt32(yaziid));

        }

       
       
    }


    void kategorigetir(string sira)
    {
        try
        {
            SqlCommand katcmd = new SqlCommand("select * from yazarlar", baglanti.baglanti());

            SqlDataAdapter da = new SqlDataAdapter(katcmd);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            kategori.DataTextField = ds.Tables[0].Columns["ad"].ToString(); // text field name of table dispalyed in dropdown
            kategori.DataValueField = ds.Tables[0].Columns["yazar_id"].ToString();             // to retrive specific  textfield name 

            kategori.DataSource = ds.Tables[0];
            kategori.DataBind();
            kategori.Items.FindByText(sira).Selected = true;

            kategori.Enabled = false;
        }
        catch (NullReferenceException e)
        {
            
        }
      
      
    }


    void DurumGetir(int id)
    {

        SqlCommand katcmd = new SqlCommand("select akt,id from yazarYazilar where id="+id+"", baglanti.baglanti());

        SqlDataAdapter veriAdaptoru = new SqlDataAdapter(katcmd);

        DataTable veriTablosu = new DataTable(); // Veri tablomuz:


        veriAdaptoru.Fill(veriTablosu); // Veriyi dolduralim:


        // sonuçlari DataList’e baglayalim:
        Durum.DataSource = veriTablosu;
        Durum.DataBind();
        baglanti.son();

    }

    protected void Guncelle_Click(object sender, EventArgs e)
    {

        string metin =summernote.Value.ToString();
 
        SqlCommand guncelle = new SqlCommand("update yazarYazilar set baslik=@baslik, metin=@metin where id=@id ",baglanti.baglanti());
        guncelle.Parameters.AddWithValue("@baslik",haberbaslik.Text);
        guncelle.Parameters.AddWithValue("@metin", System.Net.WebUtility.HtmlEncode(metin));
        guncelle.Parameters.AddWithValue("@id",Convert.ToInt32(Request.QueryString[0].ToString()));
        guncelle.ExecuteNonQuery();




    }



    //public string htmlcevir(string HTMLCode)
    //{
    //    // Remove new lines since they are not visible in HTML
    //    HTMLCode = HTMLCode.Replace("\n", " ");

    //    // Remove tab spaces
    //    HTMLCode = HTMLCode.Replace("\t", " ");

    //    // Remove multiple white spaces from HTML
    //    HTMLCode = Regex.Replace(HTMLCode, "\\s+", " ");

    //    // Remove HEAD tag
    //    HTMLCode = Regex.Replace(HTMLCode, "<head.*?</head>", ""
    //                        , RegexOptions.IgnoreCase | RegexOptions.Singleline);

    //    // Remove any JavaScript
    //    HTMLCode = Regex.Replace(HTMLCode, "<script.*?</script>", ""
    //      , RegexOptions.IgnoreCase | RegexOptions.Singleline);

    //    // Replace special characters like &, <, >, " etc.
    //    StringBuilder sbHTML = new StringBuilder(HTMLCode);
    //    // Note: There are many more special characters, these are just
    //    // most common. You can add new characters in this arrays if needed
    //    string[] OldWords = {"&nbsp;", "&amp;", "&quot;", "&lt;",
    // "&gt;", "&reg;", "&copy;", "&bull;", "&trade;"};
    //    string[] NewWords = { " ", "&", "\"", "<", ">", "Â®", "Â©", "â€¢", "â„¢" };
    //    for (int i = 0; i < OldWords.Length; i++)
    //    {
    //        sbHTML.Replace(OldWords[i], NewWords[i]);
    //    }

    //    return Regex.Replace(sbHTML.ToString(), "<[^>]*>", "");

    //}
    }
}