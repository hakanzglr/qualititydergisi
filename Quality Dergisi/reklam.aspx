<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reklam.aspx.cs" Inherits="Quality_Dergisi.WebForm10" %>
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">

 

             <div style="margin-top:0px;padding-top:0px""  class="section post-section">
                <div class="row">
                   
                        <div class="pst-block">
                            <div class="pst-block-main">
                                <div  class="post-content">

                                    <div class="post-main-img">
                                        <figure>
                                            <img runat="server" id="haberbuyukresim" src="#" height="582" width="750" alt="" class="adaptive" />
                                        </figure>
                                        <div class="post-main-overlay">
                                            <div class="post-main-data">
                                                <div id="kategori" runat="server"></div>
                                                <h2 id="haberbaslik" runat="server" class="title-21"></h2>

                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div id="haber">
                                        <asp:Literal runat="server" ID="icerik" Mode="PassThrough">




                                        </asp:Literal>
                                        <div class="magazine-details">
                    <div class="title-blc-2">
                        <div class="title-blc-inner">
                            <h4 style="font-weight:600 !important;">Quality Dergisi <span>Reklam</span></h4>
                        </div>
                    </div>
                    <div class="details-info">
                        <div class="address"><i class="li_location"></i> Akat Mah. Nisbetiye Cad. Kervan Apt. No: 37 D:1-C PK:34335  Etiler /İSTANBUL</div>
                           
   <div class="address"><i class=""></i><b>Reklam Müdürü</b>: Eda Keçeci Memiş</div>
  <div class="email"><i class="li_mail"></i> Email: <a href="mailto:eda@qualityofmagazine.com">eda@qualityofmagazine.com</a></div>
<div class="address"><i class=""></i><b>Reklam Satış Sorumlusu</b>: Ecem Yalçın </div>
  <div class="email"><i class="li_mail"></i> Email: <a href="mailto: ecem@qualityofmagazine.com"> ecem@qualityofmagazine.com</a></div>
                         
                                            
  <div class="address"><i class=""></i> Telefon : 0 212 265 01 38 - 71</div>
                    <div class="address"><i class=""></i> Faks : 0 212 265 01 71</div>

                                         
                                 

                    </div>
                </div>
                                        <div class="contactf-form-block">
                    <div class="title-blc-2">
                        <div class="title-blc-inner">
                            <h4 style="font-weight:600 !important;">Reklam Bilgi Formu <span>  </span></h4>
                            <p>E-posta adresiniz gizlilik koşullarımıza uygun olarak,herhangi bir kişi ya da şirket ile paylaşılmaz.</p>
                        </div>
                    </div>
                    <div class="comments-form">
					
					  <form role="form" id="contactForm" data-toggle="validator" class="shake" novalidate="true">
                            <div class="form-group form-control has-error">
                                <label>
                                    AD SOYAD*
									<input type="text" class="form-control" id="isim" placeholder="Ad- Soyad" required="" data-error="Lütfen eksiksiz olarak doldurunuz">
                                </label>
								<div class="help-block with-errors"><ul class="list-unstyled"><li>Lütfen eksiksiz olarak doldurun</li></ul></div>
                            </div>
                            <div class="form-group form-control">
                                <label>
                                    EMAIL*
                                    <input type="email" class="form-control" id="eposta" placeholder="E-posta adresi" required="" data-error="Lütfen eksiksiz olarak doldurunuz">
                                </label>
								<div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group form-control">
                                <label>
                                    KONU
                                    <input type="text" id="Konu" placeholder="konu" style="width:100% !important" name="subject" class="req">
                                </label>
                            </div>
                            <div class="form-group form-control">
                                <label>
                                    MESAJ*
									<textarea id="mesaj" class="form-control" rows="5" placeholder="Mesaj" required="" data-error="Lütfen eksiksiz olarak doldurunuz"></textarea>
                                </label>
								<div class="help-block with-errors"></div>
                            </div>
							<div  class="btn btn-3 btn-success btn-lg pull-right  disabled" id="gonder" style="pointer-events: all; cursor: pointer;">GÖNDER</div>
							<div id="msgSubmit" class="h3 text-center hidden"></div>
                        </form>
	
                    </div>
                </div>
                                    </div>

                                    <div id="Slayt" runat="server" class="img-slider tp-2">
                                    </div>




                                     


                                   
                                </div>
                            </div>
                        </div>
                    </div>
                      <aside  class="side-bar  sticky-wrap">
                     <asp:Literal runat="server" ID="sagbolme">


                     </asp:Literal>
                  
                </aside>
                     

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

                            alert("Bir hata oluştu,dilerseniz relam@qualitydergisi.com adresine, e-posta sağlayıcınız ile gönderebilirsiniz");
                        }
                    })

                }
            });




        });


    </script>










</asp:Content>
