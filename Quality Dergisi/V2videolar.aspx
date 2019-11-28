<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="V2videolar.aspx.cs" Inherits="Quality_Dergisi.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Videolar - Quality Dergisi - Sosyete ve Magazinin Kalbi
 </title>

     
    <style>
        .fontkucuk {
            font-size: 16px !important;
            padding: 5px;
            font-weight: 300;
        }

        .page-title {
            background: #e10a17;
            color: #fff;
            padding: 10px;
        }

        .title-16 {
            color: #fff !important;
        }

        .page-title {
            width: 50% !important;
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

        .post-tp-12 .ptp-1-data {
            margin-bottom: 5px !important;
            padding: 5px !important;
        }

        .page-head-tile {
            margin: 0px 0 10px !important;
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

        .thumbs-slider .title-18 {
            bottom: 120px;
            position: absolute;
        }

        @media screen and (max-width: 600px) {
            #icerikplc_anaicerik {
                margin-left: 0px;
            }

            .thumbs-slider .title-18 {
                bottom: 150px !important;
                position: absolute;
            }

            #icerikplc_SlaytRakamlar {
                display: block;
            }

            #icerikplc_SlaytThumblar {
                display: none;
            }

            .one-sixth {
                width: 20% !important;
            }
        }

        #icerikplc_SlaytRakamlar .one-sixth {
            margin-right: 0px !important;
            width: 16% !important;
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
            background-color: rgb(227, 30, 36);
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

        .resimno {
            height: 30px;
            line-height: 30px;
        }

        #icerikplc_SlaytRakamlar {
            padding-left: 10px !important;
            background: red !important;
        }
        .thumbs-img figure img {
        
        height:80px !important;
        }

        .post-tp-8 {
            background: #e31e24;
             border-radius: 3px;
            text-align: center;
        }
        .title-5 > a {
            color:#fff !important;
            padding:5px !important;
        }

       

    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">
    <div style="margin-bottom: 100px !important;" class="main">

        <div class="main-content">

            <div class="page-head-tile">
                <div class="container">

                    <div class="page-title">
                        <h1 class="title-16"><strong>Videolar</strong></h1>

                    </div>
                </div>
            </div>

            <div class="section">
                <div class="row">
                    <div class="content">
                        <div class="pst-block">
                            <div class="pst-block-main">
                                <div style="padding: 0px !important;" class="main-posts-3">
                                     <div  class="thumbs-slider">
                                        <div   class="swiper-container Mansetler">
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
                        <div class="section">
                            <div class="row">


                                <div id="liste" runat="server" class="col-row">
                                </div>
                                <div style="text-align: center;" id="lastPostsLoader"></div>

                                <div class="col-xs-12">

                                    <div id="mobildahafazlahaber" class="col-xs-6 btn-1">Daha fazla Yükle</div>

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



    </div>


    <div style="opacity: 0; width: 0px !important; display: none">
        <asp:Label runat="server" ID="enbuyukhaber"></asp:Label>
        <asp:Label runat="server" ID="enkucukhaber"></asp:Label>
        <div runat="server" id="gecicispot3"></div>

        <asp:Label runat="server" ID="m1"></asp:Label>
        <asp:Label runat="server" ID="m2"></asp:Label>
        <asp:Label runat="server" ID="m3"></asp:Label>
        <asp:Label runat="server" ID="m4"></asp:Label>
        <asp:Label runat="server" ID="m5"></asp:Label>
        <asp:Label runat="server" ID="m6"></asp:Label>
        <div id="sonyuklenenid" runat="server"></div>
        <asp:TextBox runat="server" ClientIDMode="Static" ID="kategoriID"></asp:TextBox>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {

            $(".sticky-header").removeClass("visible");



            var katid = "galeriler";
            $("ul#menu11 >li[data-id=" + katid + "]").addClass("active");

            $("ul.mobile-nav-list >li.mn-item[data-id=" + katid + "]").addClass("mobilaktif");
            $("ul#ikincimenu >li[data-id=" + katid + "]").addClass("active");
            $("#saggaleribir").hide();

            function lastPostFunc() {
                $('div#lastPostsLoader').html('<img src="../../bigLoader.gif">');
                $.post("../../VideoYukle.ashx?sonid=" + $("div.col-half:last-child").attr("data-id"),

                    function (data) {
                        if (data != "") {


                            $(".col-half:last-child").after("<div class='newajax'>" + data + "</div>");
                            $(".newajax").hide().fadeIn("fast");
                        }
                        $('div#lastPostsLoader').empty();
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


        });

    </script>
    <script>
        (function () {
            $(document).ready(function () {

                jQuery('.js-thumbs-img').on('mouseover', function () {

                    $("p").removeClass("resimaktif");
                    jQuery(this).trigger('click');


                });

                $('.resimno').click(function () {

                    $('.resimno').removeClass("resimaktif");

                });


                var thumbs = $('.js-thumbs').find('.js-thumbs-img');

                var slider = new Swiper('.Mansetler', {
                    spaceBetween: 30,
                    watchActiveIndex: true,

                    loop: true,
                    autoplay: {
                        delay: 800000,
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
</asp:Content>
