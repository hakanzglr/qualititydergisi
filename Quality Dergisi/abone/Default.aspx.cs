using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quality_Dergisi.abone
{
    public partial class Default : System.Web.UI.Page
    {
         fonk baglanti = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookieornek = Request.Cookies["bilgi"];
        if (cookieornek == null)
        {
            Response.Redirect("../Admin/login.html");

        }

        MusteriGetir();
    }
    public void MusteriGetir()
    {

        SqlCommand mcmd = new SqlCommand("select id, FORMAT(basvurutarihi , 'dd.MM.yyyy HH:mm') as itarih,teslimpk,firmaisim,tel,durum,teslimil,teslimilce,isim,eposta,tcno from musteri order by id desc", baglanti.baglanti());
        SqlDataReader moku = mcmd.ExecuteReader();
        string muslist = "";
        string colmd12;
        colmd12 = "<tr>";
        string divkapat = "</td>";
        string colmd3 = "<td>";
        string colmd4 = "<div class='col-md-4'>";
        
        while (moku.Read())
        {
            string durum = moku["durum"].ToString();
            string firma = "<span style='color:#c62328'> " + moku["firmaisim"].ToString() + "</span>";
            if (durum == "0")
            {

                durum = "Pasif";
            }
            else
            {
                durum = "Aktif";

            }

            string kucuk = "<tr  id='B" + moku["id"].ToString() + "' class='gizle'><td> <b> Teslimat : </b> " + moku["teslimil"].ToString() + " / " + moku["teslimilce"].ToString() + divkapat + "<td title='Teslimat Posta Kodu'>" + moku["teslimpk"].ToString() + colmd3 + "<b title='Başvuru Tarihi'>Başvuru : </b>" + moku["itarih"].ToString() + divkapat + divkapat + colmd3 + "<b>Firma :</b> " + firma + colmd3 + divkapat + colmd3 + divkapat + "</tr>";
            muslist += "<tr class='bilgi' data-id='B" + moku["id"].ToString() + "' >" + "<td>" + "<span style='color:#c62328;font-weight:600;'>" + moku["id"].ToString() + "</span>" + divkapat + colmd3 + moku["isim"].ToString() + divkapat + colmd3 + moku["tel"].ToString() + divkapat + colmd3 + moku["eposta"].ToString() + divkapat + colmd3 + moku["tcno"].ToString() + divkapat + colmd3 +"<span class='pull-right'>"+ "<i data-id='" + moku["id"].ToString() + "' class='fa ara fa-search'></i>" + "</span> " + durum + divkapat + "</tr>" ;


        }

        musteriler.Text =   muslist ;
        baglanti.son();



    }

    protected void aktar_Click(object sender, EventArgs e)
    {
        exportToExcel();
}
    public  void exportToExcel()

    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("select * from musteri where durum=1", baglanti.baglanti());

       
             DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            ds.Tables.Add(table);

        DataSet source = ds;

        System.IO.StreamWriter excelDoc;
        string yol = Server.MapPath("~/abone/a.xls");
        excelDoc = new System.IO.StreamWriter(yol);
        const string startExcelXML = "<xml version>\r\n<Workbook " +
              "xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\"\r\n" +
              " xmlns:o=\"urn:schemas-microsoft-com:office:office\"\r\n " +
              "xmlns:x=\"urn:schemas-microsoft-com:office:" +
              "excel\"\r\n xmlns:ss=\"urn:schemas-microsoft-com:" +
              "office:spreadsheet\">\r\n <Styles>\r\n " +
              "<Style ss:ID=\"Default\" ss:Name=\"Normal\">\r\n " +
              "<Alignment ss:Vertical=\"Bottom\"/>\r\n <Borders/>" +
              "\r\n <Font/>\r\n <Interior/>\r\n <NumberFormat/>" +
              "\r\n <Protection/>\r\n </Style>\r\n " +
              "<Style ss:ID=\"BoldColumn\">\r\n <Font " +
              "x:Family=\"Swiss\" ss:Bold=\"1\"/>\r\n </Style>\r\n " +
              "<Style ss:ID=\"StringLiteral\">\r\n <NumberFormat" +
              " ss:Format=\"@\"/>\r\n </Style>\r\n <Style " +
              "ss:ID=\"Decimal\">\r\n <NumberFormat " +
              "ss:Format=\"0.0000\"/>\r\n </Style>\r\n " +
              "<Style ss:ID=\"Integer\">\r\n <NumberFormat " +
              "ss:Format=\"0\"/>\r\n </Style>\r\n <Style " +
              "ss:ID=\"DateLiteral\">\r\n <NumberFormat " +
              "ss:Format=\"dd/mm/yyyy;@\"/>\r\n </Style>\r\n " +
              "</Styles>\r\n ";
        const string endExcelXML = "</Workbook>";

        int rowCount = 0;
        int sheetCount = 1;
      
        excelDoc.Write(startExcelXML);
        excelDoc.Write("<Worksheet ss:Name=\"Sheet" + sheetCount + "\">");
        excelDoc.Write("<Table>");
        excelDoc.Write("<Row>");
        for (int x = 0; x < source.Tables[0].Columns.Count; x++)
        {
            excelDoc.Write("<Cell ss:StyleID=\"BoldColumn\"><Data ss:Type=\"String\">");
            excelDoc.Write(source.Tables[0].Columns[x].ColumnName);
            excelDoc.Write("</Data></Cell>");
        }
        excelDoc.Write("</Row>");
        foreach (DataRow x in source.Tables[0].Rows)
        {
            rowCount++;
            //if the number of rows is > 64000 create a new page to continue output
            if (rowCount == 64000)
            {
                rowCount = 0;
                sheetCount++;
                excelDoc.Write("</Table>");
                excelDoc.Write(" </Worksheet>");
                excelDoc.Write("<Worksheet ss:Name=\"Sheet" + sheetCount + "\">");
                excelDoc.Write("<Table>");
            }
            excelDoc.Write("<Row>"); //ID=" + rowCount + "
            for (int y = 0; y < source.Tables[0].Columns.Count; y++)
            {
                System.Type rowType;
                rowType = x[y].GetType();
                switch (rowType.ToString())
                {
                    case "System.String":
                        string XMLstring = x[y].ToString();
                        XMLstring = XMLstring.Trim();
                        XMLstring = XMLstring.Replace("&", "&");
                        XMLstring = XMLstring.Replace(">", ">");
                        XMLstring = XMLstring.Replace("<", "<");
                        excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                                       "<Data ss:Type=\"String\">");
                        excelDoc.Write(XMLstring);
                        excelDoc.Write("</Data></Cell>");
                        break;
                    case "System.DateTime":
                        //Excel has a specific Date Format of YYYY-MM-DD followed by  
                        //the letter 'T' then hh:mm:sss.lll Example 2005-01-31T24:01:21.000
                        //The Following Code puts the date stored in XMLDate 
                        //to the format above
                        DateTime XMLDate = (DateTime)x[y];
                        string XMLDatetoString = ""; //Excel Converted Date
                        XMLDatetoString = XMLDate.Year.ToString() +
                             "-" +
                             (XMLDate.Month < 10 ? "0" +
                             XMLDate.Month.ToString() : XMLDate.Month.ToString()) +
                             "-" +
                             (XMLDate.Day < 10 ? "0" +
                             XMLDate.Day.ToString() : XMLDate.Day.ToString()) +
                             "T" +
                             (XMLDate.Hour < 10 ? "0" +
                             XMLDate.Hour.ToString() : XMLDate.Hour.ToString()) +
                             ":" +
                             (XMLDate.Minute < 10 ? "0" +
                             XMLDate.Minute.ToString() : XMLDate.Minute.ToString()) +
                             ":" +
                             (XMLDate.Second < 10 ? "0" +
                             XMLDate.Second.ToString() : XMLDate.Second.ToString()) +
                             ".000";
                        excelDoc.Write("<Cell ss:StyleID=\"DateLiteral\">" +
                                     "<Data ss:Type=\"DateTime\">");
                        excelDoc.Write(XMLDatetoString);
                        excelDoc.Write("</Data></Cell>");
                        break;
                    case "System.Boolean":
                        excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                                    "<Data ss:Type=\"String\">");
                        excelDoc.Write(x[y].ToString());
                        excelDoc.Write("</Data></Cell>");
                        break;
                    case "System.Int16":
                    case "System.Int32":
                    case "System.Int64":
                    case "System.Byte":
                        excelDoc.Write("<Cell ss:StyleID=\"Integer\">" +
                                "<Data ss:Type=\"Number\">");
                        excelDoc.Write(x[y].ToString());
                        excelDoc.Write("</Data></Cell>");
                        break;
                    case "System.Decimal":
                    case "System.Double":
                        excelDoc.Write("<Cell ss:StyleID=\"Decimal\">" +
                              "<Data ss:Type=\"Number\">");
                        excelDoc.Write(x[y].ToString());
                        excelDoc.Write("</Data></Cell>");
                        break;
                    case "System.DBNull":
                        excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                              "<Data ss:Type=\"String\">");
                        excelDoc.Write("");
                        excelDoc.Write("</Data></Cell>");
                        break;
                    default:
                        throw (new Exception(rowType.ToString() + " not handled."));
                }
            }
            excelDoc.Write("</Row>");
        }
        excelDoc.Write("</Table>");
        excelDoc.Write(" </Worksheet>");
        excelDoc.Write(endExcelXML);
        excelDoc.Close();

        Response.Redirect("~/abone/a.xls");

    }
    }
}