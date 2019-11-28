<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yazarlar.aspx.cs" Inherits="Quality_Dergisi.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" ClientIDMode="Static" runat="Server">
   <asp:Literal runat="server" ID="siteaciklamalar"></asp:Literal>

   

    <style>
        .sayfaiciresimyazar {
        
        width:100px !important;
        }
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


        #yazarisim {
            float: left;
            font-size: 30px;
            line-height: 150px;
            padding-left: 30px;
            text-align: center;
        }

        #icerikplc_yazarbilgileri > img {
            width: 150px;
            height: 150px;
        }

        }

        .sf-menu > li:last-child > a:after {
            background: none;
        }
        /*.side-bar{

            
    position:  fixed;
    right: 10px;
    overflow-x:  hidden;
    overflow-y:  scroll;
    height: 100%;
    top: 240px;


        }*/
        #yazarbilgileri {
            background: #f5f2f2;
            padding: 20px;
            display: inline-block;
            width: 100%;
        }

        ul.digeryazilari {
            border-left: 1px solid #e6dbdb;
            padding-left: 10px;
            list-style: none;
            margin: 0;
        }

            ul.digeryazilari li {
                margin-bottom: 5px;
                padding: 5px;
                background: #f5f2f2;
            }

                ul.digeryazilari li a {
                    text-decoration: none;
                    color: #000;
                }

        .yazarlistli {
            color: #000;
        }

        .aktifyazi {
            border-bottom: 1px solid #e10a17;
        }
        .yazardigersitil {
        
    padding:  10px;
    background: #e31e24;
    color: #fff;
    margin-left: 10px;
    margin-bottom:  10px;
    font-weight:  600;

        
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
<div class="col-md-12" id="yazarbilgileri">
<div style="width:150px;float:left;" id="yazarresim" runat="server" class="col-md-4">

                                       
</div>
<div style="text-align:left;"  id="yazarisim" runat="server" class="col-md-8">


</div></div>
<div class="clearfix"></div>
                                

<div  class="post-content">

<div style="color:#000 !important;" >
                                      
                                       
<div id="kategori" runat="server"></div>
<h2 id="haberbaslik" runat="server" class="title-21"></h2>
 
</div>
                                    <div class="post-sharing-tp-1">
                                        <ul>
                                            <li class="fb"><a href="#"><i class="fa fa-facebook"></i><span class="mb-pt-hide">Facebook</span></a></li>
                                            <li class="tw"><a href="#"><i class="fa fa-twitter"></i><span class="mb-pt-hide">Twitter</span></a></li>
                                            <li class="gp"><a href="#"><i class="fa fa-google-plus"></i><span class="mb-pt-hide">Google+</span></a></li>
                                        </ul>
                                    </div>
                                    <div id="haber"><span data-id="168"  class="yazibir"></span>
                                        
                                        <span class="yazibir" data-id="168" id="yaziidvermekicin"  style="width:100%">
                                        <asp:Literal  runat="server" ID="icerikyazaryazisi" Mode="PassThrough">




                                        </asp:Literal></span>

                                       <div id="BenzerTab" runat="server" class="pst-box">
                                        <div class="pst-box-head">
                                            <div class="title-blc-1">
                                                <h4 style="margin-bottom:  10px;">Diğer <span>Yazarlar</span></h4>
                                            </div>
                                            <div class="navs js-pst-navs"></div>
                                        </div>
                                        <div class="pst-box-main">
                                            <div id="benzerhaber" runat="server" class="pst-box-inner js-pst-block-2">
                                            </div>
                                        </div>
                                    </div>




                                        <div style="text-align:center;" id="lastPostsLoader"></div>
                                           </div>
                                <div style="display:none;" class="col-xs-12">

                                    <div id="mobildahafazlahaber" class="col-xs-6 btn-1">Daha fazla Yükle</div>

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


                                    
                                </div>
                            </div>
                        </div>
                    </div>

                     <aside  class="side-bar  sticky-wrap">

                         <div runat="server" id="yazarindigeryazilarilistesi">



                         </div>


                     <asp:Literal runat="server" ID="sagbolme">


                     </asp:Literal>
                  
                </aside>

                </div>

            </div>

        </div>
        <div style="opacity: 0;"> 
        <div id="sayfakategori" runat="server" ></div>

        <div  id="linki"></div>
            <div id="sonyazaryazisitxt" runat="server"></div>
        <div id="yazaridtxt"  runat="server"></div>
            <div id="urlyakala" runat="server"></div>
</div>
    </div>

        <script src="<%= ResolveUrl("~/vendor/jquery/dist/jquery.js") %>"></script>

   
    <script type="text/javascript">function ShareOnFacebook(url) { window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(url), 'facebooksharedialog', 'toolbar=0,status=0,width=626,height=436'); return false; } function ShareOnGooglePlus(url) { window.open('https://plus.google.com/share?url=' + encodeURIComponent(url), '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600'); return false; } function ShareOnTwitter(url, lang, owner, vname, hastags) { window.open('https://twitter.com/intent/tweet?hashtags=' + hastags + '&original_referer=' + encodeURIComponent(url) + '&related=' + owner + '&text=' + encodeURIComponent(vname) + '&url=' + encodeURIComponent(url) + '&via=' + owner, 'sharer', 'toolbar=0,status=0,width=626,height=436'); return false; }</script>

    <script type="text/javascript">
        $(document).ready(function () {






            $("#linki").html(window.location.href);




            var katid = $("#icerikplc_yazaridtxt").html();
            var yazarbilgisihtml = $("#yazarbilgileri").html();

            //$('ul#ikincimenu').append("<li class='yazaradi'><a> " + yazarbilgisihtml + "</a></li>");

            function lastPostFunc() {
                $('div#lastPostsLoader').html('<img src="../../../bigLoader.gif">');
                var sonyaziid = $(".yazibir").last().attr("data-id");

                $.post("../../../YaziYukle.ashx?yazar_id=" + katid + "&sonid=" + sonyaziid,

                    function (data) {
                        if (data != "") {


                            $(".yazibir").last().after("<div class='newajax'>" + data + "</div>");

                            $(".newajax").hide().fadeIn("fast");
                        }
                        $('div#lastPostsLoader').empty();

                        $("html,body").animate({ scrollTop: $(".yazibir:last-child")[0].offsetTop }, 1000);

                        $(".sticky-header").removeClass("visible");






                    });
            };

            $(window).scroll(function () {
                if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                    //lastPostFunc();
                }
            });

            $('#mobildahafazlahaber').click(function () {

                lastPostFunc();

            });
            var sayfa = "yazarlar";

            $("ul#menu11 >li[data-id=" + sayfa + "]").addClass("active");


            $("ul#ikincimenu >li[data-id=" + sayfa + "]").addClass("active");
            $("ul.mobile-nav-list >li.mn-item[data-id=" + sayfa + "]").addClass("mobilaktif");







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





            setTimeout(function () {
                var aktifedilecekeleman = $("#icerikplc_sonyazaryazisitxt").html();
                $(".yazarlistli[data-id=" + aktifedilecekeleman + "]").addClass("aktifyazi");
                $("#sagyazarbir").hide();
            }, 500)

        });


    </script>










</asp:Content>

