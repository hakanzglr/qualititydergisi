<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="video.aspx.cs" Inherits="Quality_Dergisi.WebForm13" %>
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
        /*.slick-active{
            text-align:center;
        }
       #icerikplc_Slayt > .slick-slide{
            opacity:0.5;
        }

        .slick-center{
            opacity:1;
        }*/

        #icerikplc_videosection > iframe {

            width:100% !important;
            height:400px !important;
        }
         @media screen and (max-width: 600px) {
        
        .content{
            padding:0px !important;
            margin:0 !important;
        }
        iframe{
            width:100% !important;
        }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">

    <div class="main">

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
                                        </ul>
                                    </div>
                                    <div id="haber">

                                        <div runat="server" id="videosection"></div>

                                        <asp:Literal runat="server" ID="icerik" Mode="PassThrough">




                                        </asp:Literal>
                                    </div>

                                    <div id="Slayt" runat="server" class="img-slider tp-2">
                                    </div>




                                    <div class="sharing-block">
                                        <div class="sharing-title">Şimdi Paylaş!</div>
                                        <div class="post-sharing-tp-2">
                                            <ul>
                                                <li class="fb"><a href="#"><i class="fa fa-facebook"></i><span class="mb-pt-hide">Facebook</span></a></li>
                                                <li class="tw"><a href="#"><i class="fa fa-twitter"></i><span class="mb-pt-hide">Twitter</span></a></li>
                                                <li class="gp"><a href="#"><i class="fa fa-google-plus"></i><span class="mb-pt-hide">Google+</span></a></li>
                                            </ul>
                                        
                                        </div>
                                    </div>


                                    <div class="pst-box">
                                        <div class="pst-box-head">
                                            <div class="title-blc-1">
                                                <h4>Benzer <span>İçerikler</span></h4>
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

                     
                      <aside  class="side-bar  sticky-wrap">
                     <asp:Literal runat="server" ID="sagbolme">


                     </asp:Literal>
                  
                </aside>

                </div>

            </div>

        </div>

        <div id="sayfakategori" runat="server" style="opacity: 0;"></div>

        <div style="opacity: 0;" id="linki"></div>
        <div style="display:none;" id="videourl"></div>
    </div>


    <script src="<%= ResolveUrl("~/vendor/jquery/dist/jquery.js") %>"></script>
   
            <div id="dostdiv" style="display:none;"  runat="server"></div>





    <script type="text/javascript">
        $(document).ready(function () {

            $('iframe').each(function () {
                var videourl = $(this).attr("src");
               $(this).attr("id","if1");
                $("#videourl").html(videourl);
                var dost = $("#icerikplc_dostdiv").html();
                $(this).after(dost);
            });

    
           


            $("iframe").mouseenter(function () {
                var gecerli = $(this).attr("src");
                 
                if ($(this).attr("data-video") == "true") {


                }
                else {

                    $(this).attr("src", $("#videourl").html() + "?rel=0&amp;autoplay=1")
                    $(this).attr("data-video", "true");

                }
 
               


             });
 

            $("#linki").html(window.location.href);


 
            var sayfa = $("#icerikplc_sayfakategori").html();



            $("ul#menu11 >li[data-id='videolar']").addClass("active");


            $("ul#ikincimenu >li[data-id='videolar']").addClass("active");
            $("ul.mobile-nav-list >li.mn-item[data-id='videolar']").addClass("mobilaktif");

            $("#haber img").hover(function () {
                window.location.hash = "/" + $(this).attr("data-q");
            });
            $('#haber img').each(function (intIndex) {
                var kaynak = $(this).attr('src');
                var resimgenislik = $(this).attr('width');
                $(this).attr('data-q', intIndex);
                if (resimgenislik > 700) {
                    $(this).attr('width', '100%');
                }


                var kontrol = kaynak.substring(0, 3);
                if (kontrol == "../") {
                    $(this).attr("src", "../../" + kaynak);
                }
            });

            $.ajax({

                type: "POST",
                url: "SonYazilar.ashx",
                cache: false,
                contentType: false,
                processData: false,
                success: function (url) {
                    $("#yazaryazisi").html(url)
                }
            })


            //setCookie('Haber','12')

            //function setCookie(key, value) {
            //    var expires = new Date();
            //    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
            //    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
            //}

            //function getCookie(key) {
            //    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
            //    return keyValue ? keyValue[2] : null;
            //}

          

        });


    </script>

     








</asp:Content>
