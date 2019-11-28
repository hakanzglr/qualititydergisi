<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Galeri.aspx.cs" Inherits="Quality_Dergisi.WebForm4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <asp:Literal runat="server" ID="siteaciklamalar"></asp:Literal>
    <style type="text/css">
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


        #icerikplc_videosection > iframe {
            width: 100% !important;
            height: 400px !important;
        }

        .resimnumarasi {
            padding: 5px;
            background: #e10a17;
            color: #fff;
            position: absolute;
            width: 40px;
            text-align: center;
        }

        #icerikplc_Slayt {
        }

        .rakam {
            width: 100%;
        }

        .resimisimler {
            padding: 10px;
            color: #000;
            width: 500px;
            text-align: center;
            width:100%;
        }

            /*.resimisimler .paylas {
                float: right;
            }*/

            .resimisimler .isimler {
text-align:center;            }

        .rakam {
            float: left;
            display: inline-block;
        }

        .resimcerceve {
            border: 1px solid #808080;
            display: inline-block;
            margin-bottom: 10px;
            background: #ede3e3;
               width: 100%;
    text-align: center;
        }

        .paylas:hover {
            cursor: pointer;
        }
          .tb-social-list {
              display:inline-block !important;
              text-align:center;
              float:none !important;
          }
        .tb-social-list li {
            color: #094369;
            
        }

        #paylasimlightbox {
            background: #fff;
            padding: 10px;
        }

        .slbArrow {
            background: #000 !important;
        }

        @media screen and (max-width: 600px) {
        
        .content{
            padding:0px !important;
            margin:0 !important;
        }
        .lightimage{
            width:100% !important;
        }
        }
    </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">


    <div class="main-content">


           <div style="margin-top:0px;padding-top:0px""  class="section post-section">
                <div class="row">
                    <div style="overflow:hidden;"" class="content">
                        <div class="pst-block">
                            <div class="pst-block-main">
                                <div  class="post-content">


        <h2 id="haberbaslik" runat="server" class="title-21"></h2>


        <div class="post-sharing-tp-1">
            <ul>
                <li class="fb"><a href="#"><i class="fa fa-facebook"></i><span class="mb-pt-hide">Facebook</span></a></li>
                <li class="tw"><a href="#"><i class="fa fa-twitter"></i><span class="mb-pt-hide">Twitter</span></a></li>
                <li class="gp"><a href="#"><i class="fa fa-google-plus"></i><span class="mb-pt-hide">Google+</span></a></li>
           <li style="border:1px solid green;border-radius:4px;background:green;" class="wppp"> 
                                                    <a> <i style="" class="fa fa-whatsapp"></i><span class="mb-pt-hide"> Whatsapp</span> </a> </li>
                 </ul>
        </div>
        <div style="text-align: left;" class="imageGallery1" id="haber">


            <asp:Literal runat="server" ID="icerik" Mode="PassThrough">




            </asp:Literal>
        </div>



        <script type='text/javascript' src='<%= ResolveUrl("~/vendor/lightbox/lightboxana.js") %>'></script>


        <link href="<%= ResolveUrl("~/vendor/lightbox/fotogaleri.css") %>" rel="stylesheet" />

        <script type='text/javascript' src='<%= ResolveUrl("~/vendor/lightbox/lightbox.js") %>'></script>
        <script>

            $('.imageGallery1 .llink').simpleLightbox();
        </script>

        <div class="sharing-block">
            <div class="sharing-title">Şimdi Paylaş!</div>
            <div class="post-sharing-tp-2">
                <ul>
                    <li class="fb"><a href="#"><i class="fa fa-facebook"></i><span class="mb-pt-hide">Facebook</span></a></li>
                    <li class="tw"><a href="#"><i class="fa fa-twitter"></i><span class="mb-pt-hide">Twitter</span></a></li>
                    <li class="gp"><a href="#"><i class="fa fa-google-plus"></i><span class="mb-pt-hide">Google+</span></a></li>
              <li style="border:1px solid green;border-radius:4px;background:green;" class="wppp"> 
                                                    <a> <i style="" class="fa fa-whatsapp"></i><span class="mb-pt-hide"> Whatsapp</span> </a> </li>
                      </ul>

            </div>
        </div>


        <div class="pst-box">
            <div class="pst-box-head">
                <div class="title-blc-1">
                    <h4 style="margin-bottom:  10px;" >Benzer <span>İçerikler</span></h4>
                </div>
                <div class="navs js-pst-navs"></div>
            </div>
            <div class="pst-box-main">
                <div id="benzerhaber" runat="server" class="pst-box-inner js-pst-block-2">
                </div>
            </div>
        </div>
    </div>

    </div>
                    </div>    </div>
                       <aside class="side-bar  sticky-wrap">
                           <asp:Literal runat="server" ID="sagbolme">


                           </asp:Literal>

                       </aside>

    </div>
                </div> 
                     
 </div>
 
        <div id="sayfakategori" runat="server" style="opacity: 0;"></div>

    <div style="opacity: 0;" id="linki"></div>


    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>




    <script type="text/javascript">
        $(document).ready(function () {





            $("#linki").html(window.location.href);



            var sayfa = $("#icerikplc_sayfakategori").html();





            setTimeout(
                function () {

                    var katid = "galeriler";
                    $("ul#menu11 >li[data-id=" + katid + "]").addClass("active");

                    $("ul.mobile-nav-list >li.mn-item[data-id=" + katid + "]").addClass("mobilaktif");
                    $("ul#ikincimenu >li[data-id=" + katid + "]").addClass("active");
                                $("#saggaleribir").hide();

                }, 2000
            )

            $('.next').click(function () {

                window.location.hash = "/resim/" + $(this).attr("data-q") + "-" + $(".slbCaption").html();


            });








           


            $(".rakam").hover(function () {
                window.location.hash = "/resim/" + $(this).attr("data-q") + "-" + $(this).attr("data-isim");
            });




        });


    </script>










</asp:Content>

