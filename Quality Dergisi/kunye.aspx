<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="kunye.aspx.cs" Inherits="Quality_Dergisi.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <asp:Literal runat="server" ID="siteaciklamalar"></asp:Literal>

   

    <style>
        .fontkucuk {
            font-size: 16px !important;
            padding: 5px;
            font-weight: 300;
        }

        #yazaryazisi img {
            width: 115px !important;
        }

        .page-title {
            background: #e10a17;
            color: #fff;
            padding: 10px;
        }

        .title-16 {
            color: #fff !important;
        }

            .title-16:after {
                content: '';
                width: 0;
                height: 0;
                border-top: 24px solid transparent;
                border-left: 4px solid #e10a17;
                border-bottom: 24px solid transparent;
                position: absolute;
                top: 0;
                right: -4px;
            }


        #icerikplc_yazaryazilar img {
            width: 115px !important;
        }

        .dostkapat {
            display: none !important;
        }

        #ustdost {
            display: none !important;
        }

        .form-control, #konu {
            width: 100% !important;
        }

        #megadost {
            display: none !important;
        }

        b {
            font-weight: 600 !important;
        }

     .contactf-form-block   i {
            font-style: italic !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">

 

             <div style="margin-top:0px;padding-top:0px""  class="section post-section">
                <div class="row">
                         <div class="pst-block">
                            <div class="pst-block-main">
                                <div  class="post-content">

                                    
                                    
                                        
                                       
                                        <div style="text-align:center" class="contactf-form-block">
                   
	
                                            
<%-- 
                                            <b>Yönetim Yeri Adresi:
</b>Keçeci Yayıncılık 
                                            <br />
                                            Akat Mah. Nispetiye Cad. Kervan Apt. No: 37 D:1-C Etiler /İSTANBUL<br />
 --%>
                               
                                          
                                            
 
                                            
                                            <br />
                                        <b>    İMTİYAZ SAHİBİ</b>
                                            <br />
                                            Keçeci Yayıncılık Organizasyon Ticaret. Ltd. Şti.
                                            <br />
                                            <br />
                                         <b>Adres : </b>   Akat Mah. Nisbetiye Caddesi. Kervan Apt. No:37 D:1/C PK:34335 Etiler (Akmerkez Karşısı)<br />
                                            Tel: 0 212 265 01 38-71<br />
                                            Faks: 0212 265 01 71<i><br /><br />
                                         <%--  info@qualityofmagazine.com <br />
                                            www.qualityofmagazine.com <br /> <br />--%>
                                            </i><b>Genel Yayın Yönetmeni</b> <br />
                                         Salih Keçeci
                                            <br />
                                            <br />
                                            

                                            <b>Yazı İşleri Müdürü

</b>
                                            <br />
Eda Keçeci Memiş

                                            <br />
                                            <br />
                                            <b>Site Sorumlusu

</b>
                                            <br />
                                            İlyas Hayri


                                       
                                           
                                           




                                            <b>
                                            <br />
                                            <br />
                                         <b>   Editörler</b>

</b>
                                            <br />
                                           İlyas Hayri

                                            <br />
                                            Burcu Nazlı Dağyeli Durmuş
                                            <br /><br />
                                            <b>Muhabir</b><br />
                                            Eray Kabil<br /><br /> 
                                            <b>Görsel Yönetmen</b><br />
                                            Rıfat Kurt
                                            
                                            <br />
                                    
    

                                            <br />

                                             <b>Reklam Müdürü<br />
                                            </b>
                                             
Eda Keçeci Memiş                                            <br />
                                            <i>eda@qualityofmagazine.com<br /> 
                                            </i><br />
                                            <b>Reklam Satış Sorumlusu</b><br />  
                                             Ecem Yalçın<br />
                                            <i> ecem@qualityofmagazine.com <br />
                                            </i><br />
                                 

                                            <br />
                                            <b>UYARI :</b>
"qualitydergisi.com internet sitesinde yayınlanan yazı, haber ve fotoğrafların her türlü telif hakkı 
                                            Keçeci Yayıncılık Org.Tic.Ltd.Şti'e aittir. İzin alınmadan, kaynak gösterilerek dahi kullanılamaz."



                    </div>
            
                                    </div>

                                  

                           

                                     


                                   
                           
                            </div>
                        </div>
                    </div>

                             
                         

                </div>

          
 
 
 
  

    <script src="<%= ResolveUrl("~/vendor/jquery/dist/jquery.js") %>"></script>
 
    <script type="text/javascript">
        $(document).ready(function () {


            $('#gonder').click(function () {
                var isim = $("#isim").val();
                var eposta = $("#eposta").val();
                var konu = $("#konu").val();
                var mesaj = $("#mesaj").val();

                if (isim == "" && eposta == "" && mesaj == "" && konu == "") {

                    alert("Tüm alanları doldurunuz.");

                }
                else {



                    $.ajax({
                        url: "Mailyolla.ashx",
                        type: "POST",
                        data: { "isim": isim, "mail": eposta, "konu": konu, "mesaj": mesaj },
                        success: function (result) {
                            alert("Mail gönderilmiştir.İlginize Teşekkür Ederiz.");
                        },
                        error: function (err) {

                            alert("Bir hata oluştu,dilerseniz bilgi@qualitydergisi.com adresine, e-posta sağlayıcınız ile gönderebilirsiniz");
                        }
                    })

                }
            });




        });


    </script>










</asp:Content>
