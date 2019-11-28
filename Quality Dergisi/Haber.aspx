<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Haber.aspx.cs" Inherits="Quality_Dergisi.WebForm6" %>
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

        .post-sharing-tp-1 ul li, .post-sharing-tp-2 ul li {
            cursor: pointer;
        }

        iframe {
            width: 100% !important;
        }

        .post-main-data {
            padding: 10px !important;
        }



        @media screen and (max-width: 600px) {

            .content {
                padding: 0px !important;
                margin: 0 !important;
            }

            .main img {
                width: 100% !important;
            }

            .post-main-img {
                margin: 0px !important;
            }
        }

        p {
            font-family: Arial, Helvetica, sans-serif !important;
        }

        #haber a {
            background-color: #eb4026;
            color: #fff;
            padding: 10px;
            border-radius: 4px;
            text-decoration: none;
            width: 100%;
            text-align: center;
        }

        #haber b {
            font-weight: 600 !important;
        }

        #haber i {
            font-style: italic !important;
        }

        #haber #icerikplc_dostdiv a {
            background-color: #fff !important;
        }

        body {
            font-family: Arial, Helvetica, sans-serif !important;
        }

        ul.mekanlar {
            padding-left: 10px;
            list-style: none;
            margin: 0;
        }

            ul.mekanlar li {
                margin-bottom: 5px;
                padding: 5px;
                background: #f5f2f2;
            }

                ul.mekanlar li:hover {
                    background: #fd3a13;
                    color: #fff;
                }
                #icerikplc_tarih{
                    font-size:12px !important;
                }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">




    <div class="main">

        <div class="main-content">
            <div style="margin-top: 0px; padding-top: 0px" class="section post-section">
                <div class="row">
                    <div style="overflow: hidden;" class="content">
                        <div class="pst-block">
                            <div class="pst-block-main">
                                <div class="post-content">

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
                                    <div class="post-sharing-tp-1">
                                        <ul>
                                            <li class="fb"><a><i class="fa fa-facebook"></i><span class="mb-pt-hide">Facebook</span></a></li>
                                            <li class="tw"><a><i class="fa fa-twitter"></i><span class="mb-pt-hide">Twitter</span></a></li>
                                            <li class="gp"><a><i class="fa fa-google-plus"></i><span class="mb-pt-hide">Google+</span></a></li>
                                            <li style="border: 1px solid green; border-radius: 4px; background: green;" class="wppp">
                                                <a><i style="" class="fa fa-whatsapp"></i><span class="mb-pt-hide">Whatsapp</span> </a></li>
                                        </ul>
                                    </div>

                                    <asp:Label ID="tarih" runat="server" Text=""></asp:Label><br /><br />

                                    <div class="mobilrdost"></div>

                                    <div id="haber">
                                        <asp:Literal runat="server" ID="icerik" Mode="PassThrough">




                                        </asp:Literal>
                                        <div id="dostdiv" runat="server"></div>

                                    </div>
                                    <div style="display: none;" runat="server" id="haberetiketleri">
                                    </div>
                                    <div id="Slayt" runat="server" class="img-slider tp-2">
                                    </div>




                                    <div class="sharing-block">
                                        <div class="sharing-title">Şimdi Paylaş!</div>
                                        <div class="post-sharing-tp-2">
                                            <ul>
                                                <li class="fb"><a><i class="fa fa-facebook"></i><span class="mb-pt-hide">Facebook</span></a></li>
                                                <li class="tw"><a><i class="fa fa-twitter"></i><span class="mb-pt-hide">Twitter</span></a></li>
                                                <li class="gp"><a><i class="fa fa-google-plus"></i><span class="mb-pt-hide">Google+</span></a></li>
                                                <li style="border: 1px solid green; border-radius: 4px; background: green;" class="wppp">
                                                    <a><i style="" class="fa fa-whatsapp"></i><span class="mb-pt-hide">Whatsapp</span> </a></li>
                                            </ul>

                                        </div>
                                    </div>


                                    <div id="BenzerTab" runat="server" class="pst-box">
                                        <div class="pst-box-head">
                                            <div class="title-blc-1">
                                                <h4 style="margin-bottom: 10px;">Benzer <span>İçerikler</span></h4>
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
                        </div>
                    </div>

                    <aside class="side-bar  sticky-wrap">
                        <asp:Literal runat="server" ID="sagbolme">


                        </asp:Literal>

                    </aside>

                </div>

            </div>
        </div>

        <div id="sayfakategori" runat="server" style="opacity: 0;"></div>

        <div style="opacity: 0;" id="linki"></div>
        <div style="display: none;" id="videourl"></div>
    </div>


    <script src="<%= ResolveUrl("~/vendor/jquery/dist/jquery.js") %>"></script>

    <script type="text/javascript">
        $(document).ready(function () {


            $("#linki").html(window.location.href);

            $('iframe').each(function () {
                var videourl = $(this).attr("src");
                $("#videourl").html(videourl);
                var dost = $("#icerikplc_dostdiv").html();
                $(this).after(dost);

            });



            var sayfa = $("#icerikplc_sayfakategori").html();



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







        });


    </script>










</asp:Content>
