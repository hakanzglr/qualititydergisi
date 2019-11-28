<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="arsiv.aspx.cs" Inherits="Quality_Dergisi.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .resimtutar {
            width: 80%;
            height: 80%;
            text-align: center;
        }


        .dergikapak {
            max-height: 100%;
            width: auto;
            cursor: pointer;
        }

        .aktifdergi {
            border: 5px solid red;
        }

        #arsivkontroller2017 {
            border: 1px solid #ccc2c2;
        }

        .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next {
            margin-right: -50px !important;
        }

        .carousel-control .glyphicon-chevron-left, .carousel-control .icon-prev {
            margin-left: -50px !important;
        }

        @media screen and (max-width: 1077px) {
            .section .side-bar {
                text-align: center;
                margin: 0 auto;
                display: block !important;
                width: 100%;
                padding: 0px !important;
            }

            .section .content {
                padding: 0px !important;
            }
        }

        @media screen and (max-width: 600px) {

            .content {
                padding: 0px !important;
                margin: 0 !important;
            }

            #dergiokur {
                width: 100% !important;
            }
        }
    </style>
    <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css' />
    <style>
        .carousel-inner .active.left {
            left: -33%;
        }

        .carousel-inner .next {
            left: 33%;
        }

        .carousel-inner .prev {
            left: -33%;
        }

        .carousel-control.left,
        .carousel-control.right {
            background-image: none;
        }

        .carousel-multi .carousel-inner > .item {
            transition: 500ms ease-in-out left;
        }

            .carousel-multi .carousel-inner > .item > .media-card {
                border-right: 10px solid #fff;
                display: table-cell;
                width: 1%;
            }

                .carousel-multi .carousel-inner > .item > .media-card:last-of-type {
                    border-right: none;
                }

        .carousel-multi .carousel-inner .active {
            display: table;
        }

            .carousel-multi .carousel-inner .active.left {
                left: -33%;
            }

            .carousel-multi .carousel-inner .active.right {
                left: 33%;
            }

        .carousel-multi .carousel-inner .next {
            left: 33%;
        }

        .carousel-multi .carousel-inner .prev {
            left: -33%;
        }

        .item {
            text-align: center;
        }

        .glyphicon {
            background: black;
        }

        @media all and (transform-3d), (-webkit-transform-3d) {
            .carousel-multi .carousel-inner > .item {
                transition: 500ms ease-in-out all;
                backface-visibility: visible;
                transform: none !important;
            }
        }

        .tamdivekran {
            z-index: 999;
            height: 100%;
            width: 100%;
            display: block;
            left: 0;
            position: fixed;
            right: 0;
            border: 0;
            top: 0;
        }

        .ulyillar {
            list-style: none;
            text-align: center;
        }

            .ulyillar li {
                width: 60px;
                min-height: 50px;
                text-align: center;
                float: left;
                line-height: 50px;
                display: inline-block;
                border: 1px solid #fd3a13;
                margin-right: 5px;
                font-weight: 600;
                cursor: pointer;
            }

        .arsivyillar {
            display: inline-block;
        }

        body {
            -webkit-user-select: none; /* Chrome all / Safari all */
            -moz-user-select: none; /* Firefox all */
            -ms-user-select: none; /* IE 10+ */
            user-select: none;
        }

        .gorunmez div {
            display: none;
        }

        .aktifyil {
            background-color: #fd3a13;
            color: #fff;
        }

        .tamekraniframeyap {
            position: fixed;
            top: 0px;
            bottom: 0px;
            right: 0px;
            width: 100%;
            border: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            z-index: 1000;
            height: 100%;
        }
            @media screen and (max-width: 600px) {
            #mobildekaybol {
               display:none !important;
            }
        }
            h2{
                   margin-top: 0px !important;
    margin-bottom: 0px !important;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">



   
    <div class="section">
        <div class="row">
            <div class="content">
                <div class="pst-block">
                            <div class="pst-block-main">
                                <br /><br />  
                                <h3>Arşiv</h3>
                                <br />  <br /> 

                                <div style="width: 100%; text-align: center;">

                                    <div class="arsivyillar">

                                        <ul class="ulyillar">

                                            <li data-id="arsiv2018">2018</li>
                                            <li data-id="arsiv2017">2017</li>
                                            <li data-id="arsiv2016">2016</li>
                                            <li data-id="arsiv2015">2015</li>
                                            <li data-id="arsiv2014">2014</li>
                                            <li data-id="arsiv2013">2013</li>
                                        </ul>

                                    </div>
                                </div>
                                <div class="clearfix"></div>


                                <div class="arsivyil" id="arsiv2018">
                                    <div id="arsivkontroller2018" class="carousel carousel-multi slide">

                                        <div class="carousel-inner" role="listbox">
<div class="item active">
<div class="media media-card">
<h4 class="media-heading">
<img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymayis2018.jpg" data-id="http://qualityofmagazine.com/2018/qualitymayis2018/files/mobile/index.html" />
</h4>
<a class="aside" href="#">Mayıs </a>
</div>
</div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitynisan2018.jpg" data-id="http://qualityofmagazine.com/2018/qualitynisan2018/files/mobile/index.html" />
                                                    </h4>
                                                    <a class="aside" href="#">Nisan </a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymart2018.jpg" data-id="http://qualityofmagazine.com/2018/qualitymart2018/files/mobile/index.html" />

                                                    </h4>
                                                    Mart    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitysubat2018.jpg" data-id="http://qualityofmagazine.com/2018/qualitysubat2018/files/mobile/index.html" />
                                                    </h4>
                                                    Şubat  
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityocak2018.jpg" data-id="http://qualityofmagazine.com/2018/qualityocak2018/files/mobile/index.html" />
                                                    </h4>
                                                    <a class="aside" href="#">Ocak </a>
                                                </div>
                                            </div>







                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#arsivkontroller2018" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Geri</span>
                                        </a>
                                        <a class="right carousel-control" href="#arsivkontroller2018" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">ileri</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="arsivyil" id="arsiv2017">

                                    <div id="arsivkontroller2017" class="carousel carousel-multi slide">

                                        <div class="carousel-inner" role="listbox">
                                            <div class="item active">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityocak2017.jpg" data-id="http://qualityofmagazine.com/2017/qualityocak2017/files/mobile/index.html" />
                                                    </h4>
                                                    <a class="aside" href="#">Ocak </a>
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitysubat2017.jpg" data-id="http://qualityofmagazine.com/2017/qualitysubat2017/files/mobile/index.html" />
                                                    </h4>
                                                    Şubat  
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymart2017.jpg" data-id="http://qualityofmagazine.com/2017/qualitymart2017/files/mobile/index.html" />

                                                    </h4>
                                                    Mart    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitynisan2017.jpg" data-id="http://qualityofmagazine.com/2017/qualitynisan2017/files/mobile/index.html" />

                                                    </h4>
                                                    Nisan    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymayis2017.jpg" data-id="http://qualityofmagazine.com/2017/qualitymayis2017/files/mobile/index.html" />

                                                    </h4>
                                                    Mayıs    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityhaziran2017.jpg" data-id="http://qualityofmagazine.com/2017/qualityhaziran2017/files/mobile/index.html" />

                                                    </h4>
                                                    Haziran    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitytemmuz2017.jpg" data-id="http://qualityofmagazine.com/2017/qualitytemmuz2017/files/mobile/index.html" />

                                                    </h4>
                                                    Temmuz    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityagustos2017.jpg" data-id="http://qualityofmagazine.com/2017/qualityagustos2017/files/mobile/index.html" />

                                                    </h4>
                                                    Ağustos    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityeylul2017.jpg" data-id="http://qualityofmagazine.com/2017/qualityeylul2017/files/mobile/index.html" />

                                                    </h4>
                                                    Eylül    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityekim2017.jpg" data-id="http://qualityofmagazine.com/2017/qualityekim2017/files/mobile/index.html" />

                                                    </h4>
                                                    Ekim    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitykasim2017.jpg" data-id="http://qualityofmagazine.com/2017/qualitykasim2017/files/mobile/index.html" />

                                                    </h4>
                                                    Kasım    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityaralik2017.jpg" data-id="http://qualityofmagazine.com/2017/qualityaralik2017/files/mobile/index.html" />

                                                    </h4>
                                                    Aralık    
                                                </div>
                                            </div>


                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#arsivkontroller2017" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Geri</span>
                                        </a>
                                        <a class="right carousel-control" href="#arsivkontroller2017" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">ileri</span>
                                        </a>
                                    </div>

                                </div>
                                <div class="arsivyil" id="arsiv2016">

                                    <div id="arsivkontroller2016" class="carousel carousel-multi slide">

                                        <div class="carousel-inner" role="listbox">
                                            <div class="item active">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityocak2016.jpg" data-id="http://qualityofmagazine.com/2016/qualityocak2016/files/mobile/index.html" />
                                                    </h4>
                                                    <a class="aside" href="#">Ocak </a>
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitysubat2016.jpg" data-id="http://qualityofmagazine.com/2016/qualitysubat2016/files/mobile/index.html" />
                                                    </h4>
                                                    Şubat  
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymart2016.jpg" data-id="http://qualityofmagazine.com/2016/qualitymart2016/files/mobile/index.html" />

                                                    </h4>
                                                    Mart    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitynisan2016.jpg" data-id="http://qualityofmagazine.com/2016/qualitynisan2016/files/mobile/index.html" />

                                                    </h4>
                                                    Nisan    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymayis2016.jpg" data-id="http://qualityofmagazine.com/2016/qualitymayis2016/files/mobile/index.html" />

                                                    </h4>
                                                    Mayıs    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityhaziran2016.jpg" data-id="http://qualityofmagazine.com/2016/qualityhaziran2016/files/mobile/index.html" />

                                                    </h4>
                                                    Haziran    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitytemmuz2016.jpg" data-id="http://qualityofmagazine.com/2016/qualitytemmuz2016/files/mobile/index.html" />

                                                    </h4>
                                                    Temmuz    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityagustos2016.jpg" data-id="http://qualityofmagazine.com/2016/qualityagustos2016/files/mobile/index.html" />

                                                    </h4>
                                                    Ağustos    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityeylul2016.jpg" data-id="http://qualityofmagazine.com/2016/qualityeylul2016/files/mobile/index.html" />

                                                    </h4>
                                                    Eylül    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityekim2016.jpg" data-id="http://qualityofmagazine.com/2016/qualityekim2016/files/mobile/index.html" />

                                                    </h4>
                                                    Ekim    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitykasim2016.jpg" data-id="http://qualityofmagazine.com/2016/qualitykasim2016/files/mobile/index.html" />

                                                    </h4>
                                                    Kasım    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityaralik2016.jpg" data-id="http://qualityofmagazine.com/2016/qualityaralik2016/files/mobile/index.html" />

                                                    </h4>
                                                    Aralık    
                                                </div>
                                            </div>


                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#arsivkontroller2016" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Geri</span>
                                        </a>
                                        <a class="right carousel-control" href="#arsivkontroller2016" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">ileri</span>
                                        </a>
                                    </div>

                                </div>
                                <div class="arsivyil" id="arsiv2015">
                                    <div id="arsivkontroller2015" class="carousel carousel-multi slide">

                                        <div class="carousel-inner" role="listbox">
                                            <div class="item active">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityocak2015.jpg" data-id="http://qualityofmagazine.com/2015/qualityocak2015/files/mobile/index.html" />
                                                    </h4>
                                                    <a class="aside" href="#">Ocak </a>
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitysubat2015.jpg" data-id="http://qualityofmagazine.com/2015/qualitysubat2015/files/mobile/index.html" />
                                                    </h4>
                                                    Şubat  
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymart2015.jpg" data-id="http://qualityofmagazine.com/2015/qualitymart2015/files/mobile/index.html" />

                                                    </h4>
                                                    Mart    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitynisan2015.jpg" data-id="http://qualityofmagazine.com/2015/qualitynisan2015/files/mobile/index.html" />

                                                    </h4>
                                                    Nisan    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymayis2015.jpg" data-id="http://qualityofmagazine.com/2015/qualitymayis2015/files/mobile/index.html" />

                                                    </h4>
                                                    Mayıs    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityhaziran2015.jpg" data-id="http://qualityofmagazine.com/2015/qualityhaziran2015/files/mobile/index.html" />

                                                    </h4>
                                                    Haziran    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitytemmuz2015.jpg" data-id="http://qualityofmagazine.com/2015/qualitytemmuz2015/files/mobile/index.html" />

                                                    </h4>
                                                    Temmuz    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityagustos2015.jpg" data-id="http://qualityofmagazine.com/2015/qualityagustos2015/files/mobile/index.html" />

                                                    </h4>
                                                    Ağustos    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityeylul2015.jpg" data-id="http://qualityofmagazine.com/2015/qualityeylul2015/files/mobile/index.html" />

                                                    </h4>
                                                    Eylül    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityekim2015.jpg" data-id="http://qualityofmagazine.com/2015/qualityekim2015/files/mobile/index.html" />

                                                    </h4>
                                                    Ekim    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitykasim2015.jpg" data-id="http://qualityofmagazine.com/2015/qualitykasim2015/files/mobile/index.html" />

                                                    </h4>
                                                    Kasım    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityaralik2015.jpg" data-id="http://qualityofmagazine.com/2015/qualityaralik2015/files/mobile/index.html" />

                                                    </h4>
                                                    Aralık    
                                                </div>
                                            </div>


                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#arsivkontroller2015" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Geri</span>
                                        </a>
                                        <a class="right carousel-control" href="#arsivkontroller2015" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">ileri</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="arsivyil" id="arsiv2014">
                                    <div id="arsivkontroller2014" class="carousel carousel-multi slide">

                                        <div class="carousel-inner" role="listbox">
                                            <div class="item active">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityocak2014.jpg" data-id="http://qualityofmagazine.com/2014/qualityocak2014/files/mobile/index.html" />
                                                    </h4>
                                                    <a class="aside" href="#">Ocak </a>
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitysubat2014.jpg" data-id="http://qualityofmagazine.com/2014/qualitysubat2014/files/mobile/index.html" />
                                                    </h4>
                                                    Şubat  
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymart2014.jpg" data-id="http://qualityofmagazine.com/2014/qualitymart2014/files/mobile/index.html" />

                                                    </h4>
                                                    Mart    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitynisan2014.jpg" data-id="http://qualityofmagazine.com/2014/qualitynisan2014/files/mobile/index.html" />

                                                    </h4>
                                                    Nisan    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymayis2014.jpg" data-id="http://qualityofmagazine.com/2014/qualitymayis2014/files/mobile/index.html" />

                                                    </h4>
                                                    Mayıs    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityhaziran2014.jpg" data-id="http://qualityofmagazine.com/2014/qualityhaziran2014/files/mobile/index.html" />

                                                    </h4>
                                                    Haziran    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitytemmuz2014.jpg" data-id="http://qualityofmagazine.com/2014/qualitytemmuz2014/files/mobile/index.html" />

                                                    </h4>
                                                    Temmuz    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityagustos2014.jpg" data-id="http://qualityofmagazine.com/2014/qualityagustos2014/files/mobile/index.html" />

                                                    </h4>
                                                    Ağustos    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityeylul2014.jpg" data-id="http://qualityofmagazine.com/2014/qualityeylul2014/files/mobile/index.html" />

                                                    </h4>
                                                    Eylül    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityekim2014.jpg" data-id="http://qualityofmagazine.com/2014/qualityekim2014/files/mobile/index.html" />

                                                    </h4>
                                                    Ekim    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitykasim2014.jpg" data-id="http://qualityofmagazine.com/2014/qualitykasim2014/files/mobile/index.html" />

                                                    </h4>
                                                    Kasım    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityaralik2014.jpg" data-id="http://qualityofmagazine.com/2014/qualityaralik2014/files/mobile/index.html" />

                                                    </h4>
                                                    Aralık    
                                                </div>
                                            </div>


                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#arsivkontroller2014" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Geri</span>
                                        </a>
                                        <a class="right carousel-control" href="#arsivkontroller2014" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">ileri</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="arsivyil" id="arsiv2013">
                                    <div id="arsivkontroller2013" class="carousel carousel-multi slide">

                                        <div class="carousel-inner" role="listbox">
                                            <div class="item active">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityocak2013.jpg" data-id="http://qualityofmagazine.com/2013/qualityocak2013/files/mobile/index.html" />
                                                    </h4>
                                                    <a class="aside" href="#">Ocak </a>
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitysubat2013.jpg" data-id="http://qualityofmagazine.com/2013/qualitysubat2013/files/mobile/index.html" />
                                                    </h4>
                                                    Şubat  
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymart2013.jpg" data-id="http://qualityofmagazine.com/2013/qualitymart2013/files/mobile/index.html" />

                                                    </h4>
                                                    Mart    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitynisan2013.jpg" data-id="http://qualityofmagazine.com/2013/qualitynisan2013/files/mobile/index.html" />

                                                    </h4>
                                                    Nisan    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymayis2013.jpg" data-id="http://qualityofmagazine.com/2013/qualitymayis2013/files/mobile/index.html" />

                                                    </h4>
                                                    Mayıs    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityhaziran2013.jpg" data-id="http://qualityofmagazine.com/2013/qualityhaziran2013/files/mobile/index.html" />

                                                    </h4>
                                                    Haziran    
                                                </div>
                                            </div>

                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitytemmuz2013.jpg" data-id="http://qualityofmagazine.com/2013/qualitytemmuz2013/files/mobile/index.html" />

                                                    </h4>
                                                    Temmuz    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityagustos2013.jpg" data-id="http://qualityofmagazine.com/2013/qualityagustos2013/files/mobile/index.html" />

                                                    </h4>
                                                    Ağustos    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityeylul2013.jpg" data-id="http://qualityofmagazine.com/2013/qualityeylul2013/files/mobile/index.html" />

                                                    </h4>
                                                    Eylül    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityekim2013.jpg" data-id="http://qualityofmagazine.com/2013/qualityekim2013/files/mobile/index.html" />

                                                    </h4>
                                                    Ekim    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitykasim2013.jpg" data-id="http://qualityofmagazine.com/2013/qualitykasim2013/files/mobile/index.html" />

                                                    </h4>
                                                    Kasım    
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="media media-card">
                                                    <h4 class="media-heading">
                                                        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityaralik2013.jpg" data-id="http://qualityofmagazine.com/2013/qualityaralik2013/files/mobile/index.html" />

                                                    </h4>
                                                    Aralık    
                                                </div>
                                            </div>


                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#arsivkontroller2013" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Geri</span>
                                        </a>
                                        <a class="right carousel-control" href="#arsivkontroller2013" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">ileri</span>
                                        </a>
                                    </div>
                                </div>




                            </div>
                        </div>
                            <a name="dergiss" style=""></a>


                        <div id="mobildekaybol" style="text-align: left; width: 450px; float: left;">
                            <br />
                            <div style="display: none; border: 1px solid #808080; padding: 10px; text-align: center; cursor: pointer;" id="dugmefull">Tam Ekran</div>
                            <br />
                            <iframe  id="dergiokur" src="kapat" style="width: 450px; height: 600px; border: 0; min-height: 500px; display: none;"></iframe>


                        </div>

                    </div>

                    <aside class="side-bar sticky-wrap">
                        <asp:Literal runat="server" ID="sagbolme">


                        </asp:Literal>
                    </aside>

                </div>
            </div>
        
    <div id="tamekrankapat" style="position: fixed; z-index: 1100; position: fixed; right: 0px; top: 0px; background: #fff; padding: 10px; display: none; cursor: pointer;">KAPAT</div>
    <iframe id="tamekraniframe" style=""></iframe>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'></script>
    <script src='https://code.jquery.com/ui/1.10.4/jquery-ui.min.js'></script>
    <script>
        $('.carousel.carousel-multi .item').each(function () {
            var next = $(this).next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }
            next.children(':first-child').clone().attr("aria-hidden", "true").appendTo($(this));

            if (next.next().length > 0) {
                next.next().children(':first-child').clone().attr("aria-hidden", "true").appendTo($(this));
            }
            else {
                $(this).siblings(':first').children(':first-child').clone().appendTo($(this));
            }
        });




    </script>








    <%--  <div id="yil2017" class="resimtutar">

    </div>
  <div id="yil2018" class="resimtutar">
        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualityocak2018.jpg" data-id="http://qualityofmagazine.com/2018/qualitysubat2018/files/mobile/index.html" />
        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitysubat2018.jpg" data-id="http://qualityofmagazine.com/2018/qualityocak2018/files/mobile/index.html" />
        <img class="dergikapak" src="http://qualityofmagazine.com/images/qualitymart2018.jpg" data-id="http://qualityofmagazine.com/2018/qualitymart2018/files/mobile/index.html" />

    </div>--%>







    <a id="dergikay" href="#dergiss"></a>















    <script type='text/javascript' src='<%= ResolveUrl("~/vendor/jquery/dist/jquery.js") %>'></script>


    <script type="text/javascript">

        $(document).ready(function () {


            $('img.dergikapak').on('click', function () {

                $("#dergiokur").show();
                $("img.dergikapak").removeClass("aktifdergi");
                $(this).addClass("aktifdergi");
                var dergi = $(this).attr("data-id");
                $("#dergiokur").attr("src", dergi);
                //$("#tamekraniframe").attr("src", dergi);
                $("#dugmefull").show();
 
                document.getElementById("dergikay").click();
                //$("#tamekraniframe").addClass("tamekraniframeyap");

                //$("#tamekraniframe").attr("src", dergi);
                //$("#tamekrankapat").show();
            }

            );


            $('#dugmefull').on('click', function () {
                $("#tamekraniframe").addClass("tamekraniframeyap");

                var url = $("#dergiokur").attr("src");
                $("#tamekraniframe").attr("src", url);
                $("#tamekrankapat").show();


            });

            $('#tamekrankapat').on('click', function () {
                $("#tamekraniframe").removeClass("tamekraniframeyap");

                $("#tamekrankapat").hide();
                $("#tamekraniframe").attr("src", "");

            });


            $(".arsivyil").hide();
            $(".ulyillar li:first-child").addClass("aktifyil");
            $("#arsiv2018").show();
            $(".ulyillar li").on('click', function () {
                $(".ulyillar li").removeClass("aktifyil");

                $(".arsivyil").hide();
                $(this).addClass("aktifyil");
                var hangisi = $(this).attr("data-id");
                var duzenlenmis = "#" + hangisi;
                $(duzenlenmis).show();
            })




        });



    </script>




</asp:Content>


