<%@ Page Title="" Language="C#" MasterPageFile="~/V2Sosyete.Master" AutoEventWireup="true" CodeBehind="V2.aspx.cs" Inherits="Quality_Dergisi.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal runat="server" ID="siteaciklamalar"></asp:Literal>
    <style>
        .pst-box-head .title-blc-1 {
            margin-top: -5px !important;
        }

        #icerikplc_anaicerik {
            margin-left: -10px;
        }

        #icerikplc_SlaytRakamlar {
            display: none;
            text-align: center;
        }


        @media screen and (max-width: 600px) {
            #icerikplc_anaicerik {
                margin-left: 0px;
            }

            #icerikplc_SlaytRakamlar {
                display: block;
            }

            #icerikplc_SlaytThumblar {
                display: none;
            }

            .one-sixth {
                width: 10% !important;
            }
        }

        #icerikplc_SlaytRakamlar .one-sixth {
            margin-right: 0px !important;
            width: 10% !important;
        }

        .js-popups {
            color: #fff;
            text-decoration: none;
        }

        @media screen and (max-width: 639px) {
            .post-tp-28.mb-height {
                height: auto;
            }

                .post-tp-28.mb-height figure img {
                    width: 100%;
                }

            #mobilkapak {
                display: block !important;
            }
        }



        article > div > h2 {
            left: 0px !important;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px !important;
        }

        .main-content {
            padding: 0px !important;
        }

        #hemenoku {
            background: url('oku.png');
            background-repeat: no-repeat;
            position: absolute;
            bottom: 8px;
            left: 0px;
            height: 120px;
            width: 120px;
            line-height: 30px;
            z-index: 5;
        }

        #mobilhemenoku {
            background: url('oku.png');
            background-repeat: no-repeat;
            position: absolute;
            bottom: 8px;
            left: 10%;
            height: 120px;
            width: 120px;
            line-height: 30px;
            z-index: 5;
        }


            #hemenoku a, #mobilhemenoku a {
                text-decoration: none;
                text-transform: uppercase;
                font-weight: 600;
                color: #fff;
            }

        #mobilkapak {
            display: none;
        }

        .divaboneol {
            height: 40px;
            width: 91%;
            padding: 10px;
            background: #fd3a13;
            text-align: center;
            font-weight: 600;
            margin: 0 auto;
            margin-top: 15px;
        }

            .divaboneol:hover {
                background: #463e3c;
                color: #fff;
            }

        #icerikplc_SlaytThumblar > .one-sixth, #icerikplc_SlaytThumblar > div > div.thumbs-img > figure > img {
            padding: 0px !important;
        }

        .swiper-button-disabled {
            opacity: 0 !important;
        }

        .resimaktif {
            border: 1px solid red;
        }
    </style>


    <link href="css/Defaul.aspx.css" rel="stylesheet" />
    <link href="css/Defaul.aspx.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">


    <div class="section">
        <div class="row">
            <div class="content">
                <div class="pst-block">
                    <div class="pst-block-main">
                        <div class="thumbs-slider">
                            <div class="swiper-container js-thumbs-slider">
                                <div class="swiper-wrapper">
                                    <asp:Literal runat="server" EnableViewState="false" ID="SlayBuyukResimler"></asp:Literal>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
 
                            </div>
                            <div class="thumbs js-thumbs">

                                <div runat="server" id="SlaytThumblar"></div>
                                <div runat="server" id="SlaytRakamlar"></div>

                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <aside class="side-bar sticky-wrap">


                <div class="sb-banner">


                    <div id="kapak" style="overflow: hidden; text-align: center; border-radius: 5px; position: relative !important;" class="image">

                        <img src="img/001 kapak.jpg" style="width: 300px; height: 400px;" />
                        <a href="arsiv.aspx" style="">

                            <div id="hemenoku">
                            </div>
                        </a>
                    </div>
                    <div class="divaboneol">
                        <a href="#qualitydergisiabone" style="" id="kayola" class="js-popups">Abone Ol</a>
                    </div>

                </div>
            </aside>
        </div>

    </div>

    <div class="section">
        <div class="row">
            <div class="content">
                <div class="col-row col-eq">
                    <div class="date-tp-2">
                        <div class="pst-box">
                            <div id="mobilkapak" style="overflow: hidden; text-align: center; border-radius: 5px; position: relative !important;" class="image">
                                <a href="arsiv.aspx" style="">
                                    <img src="img/001 kapak.jpg" style="width: 300px; height: 400px; padding-top: 5px;" />
                                    <div id="mobilhemenoku">
                                    </div>
                                </a>
                            </div>
                            <div class="pst-box-head">
                                <div class="title-blc-1">
                                    <h2 class="title-4">Güncel Haberler </h2>
                                </div>
                                <div class="navs js-pst-navs"></div>
                            </div>
                            <div class="pst-box-main">
                                <div id="guncelhaberdiv" runat="server" class="pst-box-inner js-pst-block-2">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="anaicerik" runat="server">
                </div>

            </div>







            <aside class="side-bar  sticky-wrap">
                <asp:Literal runat="server" ID="sagbolme">


                </asp:Literal>

            </aside>


        </div>
    </div>




    <script type='text/javascript' src='<%= ResolveUrl("~/vendor/jquery/dist/jquery.js") %>'></script>


    <script type="text/javascript">

        $(document).ready(function () {
         

            $('#hemenoku').hover(function () {
                $('#hemenoku').css("background-image", "url('okuust.png')");


            })
            $('#hemenoku').mouseleave(function () {
                $('#hemenoku').css("background-image", "url('oku.png')");


            })


            jQuery('.js-thumbs-img').on('mouseover', function () {

                $("p").removeClass("resimaktif");
                jQuery(this).trigger('click');
 

            });

            $('.resimno').click(function () {

                $('.resimno').removeClass("resimaktif");

             });




        });



    </script>

    <img src="okuust.png" style="display: none;" />




    <script>
        (function () {
            $(document).ready(function () {
                var thumbs = $('.js-thumbs').find('.js-thumbs-img');

                var slider = new Swiper('.js-thumbs-slider', {
                    spaceBetween: 30,
                    watchActiveIndex: true,

                    loop: true,
                    autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                    },
                    noSwiping: false,
                    pagination: {
                        el: '.swiper-pagination',
                    },
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },




                    on: {
                        slideChange: function () {

                            $("#icerikplc_SlaytThumblar").find("div.js-thumbs-img").removeClass("resimaktif");
                            $("#icerikplc_SlaytRakamlar").find("div.js-thumbs-img").removeClass("resimaktif");

                            var ind = parseInt(this.activeIndex);

                             if (ind == "1") {

                                 $("#icerikplc_SlaytThumblar").find("div.js-thumbs-img:eq(0)").addClass("resimaktif");
                                 $("#icerikplc_SlaytRakamlar").find("div.js-thumbs-img:eq(0)").addClass("resimaktif");


                            } else {
                                var deger = ind - 1;
                                $("#icerikplc_SlaytThumblar").find("div.js-thumbs-img:eq(" + deger + ")").addClass("resimaktif");
                                $("#icerikplc_SlaytRakamlar").find("div.js-thumbs-img:eq(" + deger + ")").addClass("resimaktif");


                            }


                        },
                    },

                });

                thumbs.on('click', function (e) {
                    var el = $(this);
                    var i = el.index();
                    $("#icerikplc_SlaytThumblar").find(".one-sixth").removeClass("resimaktif");
                    $(this).addClass("resimaktif");
                    slider.slideTo(i + 1, 500);
                });
            });



        })();

    </script>

    <script type="text/javascript">
        $(document).ready(function () {





        });
    </script>


</asp:Content>
