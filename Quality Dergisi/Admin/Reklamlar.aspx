<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Reklamlar.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="min-height: 768px; background: #fff; padding-left: 20px;">
        <div class="container-fluid">
            <h3>Reklam Listesi</h3>

            <div style="display: none;">


                <asp:TextBox runat="server" ID="kelime" CssClass="form-control kelime"></asp:TextBox>

                <asp:DropDownList runat="server" ID="kriter" CssClass="form-control inputyukseklik">
                    <asp:ListItem Value="*">İçinde</asp:ListItem>
                    <asp:ListItem Value="b">Başında</asp:ListItem>
                    <asp:ListItem Value="s">Sonunda</asp:ListItem>
                </asp:DropDownList>


                <asp:Button runat="server" CssClass="btn btn-success" OnClick="Unnamed_Click" Text="Ara" />
            </div>

            <ul class="nav nav-tabs">
                <li class="aktiftab">
                    <a href="#1" data-toggle="tab">Reklam Listesi</a>
                </li>
                <li><a href="#2" data-toggle="tab">Anasayfa Bölümler arası Reklamlar</a>
                </li>
                <li><a href="#3" data-toggle="tab">Sağdaki Reklamlar</a>
                </li>

                <li><a href="#6" data-toggle="tab">Haber İçerik Reklamları</a>
                </li>
                <li><a href="#7" data-toggle="tab">Video İçerik Reklamları</a>
                </li>
                <li><a href="#8" data-toggle="tab">Foto Galeri İçerik Reklamları</a>
                </li>
            </ul>

            <div class="tab-content ">
                <div class="tab-pane active" id="1">
                    <div id="kaydirmasil">
                        <br />
                        <div id="datalistreklam" class="row text-center">
                            <div class="col-md-2  col-xs-2">
                                Başlık
                            </div>
                            <div class="col-md-3  col-xs-3">
                                Resim


                            </div>

                            <div class="col-md-2  col-xs-2">
                                Tarih
                 
                            </div>
                            <div class="col-md-3  col-xs-3">
                                Adres


                            </div>
                            <div class="col-md-1  col-xs-1">
                                Aktif


                            </div>
                            
                            <div class="col-md-1  col-xs-1">
                                Sil


                            </div>


                        </div>
                        <br />

                        <div runat="server" id="reklamlist" class="row text-center">
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="2">
                    <span class="fontbuyut">Anasayfa Bölümler arası Reklamlar</span>

   <div class="alert-danger"><b>Resim jpg veya gif formatında 600*100 formatında olmalıdır</b></div>


                    <div class="clearfix"></div>
                    <div class="row-fluid">

                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <h5>Bölümler</h5>
                                </div>
                                <div id="slaytalti" runat="server">
                                </div>

                            </div>
                        </div>
                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <h5 id="bolumbaslik">Reklam Detayları</h5>
                                </div>



                                <div id="ReklamDetaylari">
                                </div>

                            </div>
                        </div>




                    </div>

                </div>
                <div class="tab-pane" id="3">
                    <span class="fontbuyut">Sağdaki Reklamlar</span>
       <div class="alert-danger"><b>Resim jpg veya gif formatında 300*300 formatında olmalıdır</b></div>

                    <div class="row-fluid">

                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <h5>Bölümler</h5>
                                </div>
                                <div id="SagturlerListesi" runat="server">
                                </div>

                            </div>
                        </div>
                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <h5>Reklam Detayları</h5>
                                </div>



                                <div id="SagReklamDetaylari">
                                </div>

                            </div>
                        </div>




                    </div>
                </div>

                <div class="tab-pane" id="6">

                    <span class="fontbuyut">Haber İçerik Reklamları</span>
                    <div class="alert">
                        Bu özelliğin kullanımı için haber detayında 
                        <input type="text" style="width: 250px;" value="<iframe style='display:none;'></iframe>" />
                        kodu göstermek istediğiniz yere yapıştırın 
                    </div>
  <div class="alert-danger"><b>Resim jpg veya gif formatında 600*100 formatında olmalıdır</b></div>




                    <div class="row-fluid">

                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    Bölümler

                                </div>

                                <div id="bolumlerlistesi" runat="server">
                                </div>




                            </div>
                        </div>
                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <h5 id="kategoribaslik">Reklam Detayları</h5>
                                </div>



                                <div id="BolumHabericiReklamDetaylari">
                                </div>

                            </div>
                        </div>




                    </div>

                </div>
                <div class="tab-pane" id="7">

                    <span class="fontbuyut">Video İçerik Reklamları</span>
                    <div class="alert">
                        Bu özelliğin kullanımı için haber detayında 
                        <input type="text" style="width: 250px;" value="<iframe style='display:none;'></iframe>" />
                        kodu göstermek istediğiniz yere yapıştırın 
                    </div>


 <div class="alert-danger"><b>Resim jpg veya gif formatında 600*100 formatında olmalıdır</b></div>


                    <div class="row-fluid">

                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    Bölümler

                                </div>

                                <div id="VideoBolumlerListesi" runat="server">
                                </div>





                            </div>
                        </div>
                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <h5 id="Videokategoribaslik">Reklam Detayları</h5>
                                </div>



                                <div id="VideoBolumHabericiReklamDetaylari">
                                </div>

                            </div>
                        </div>




                    </div>

                </div>


                <div class="tab-pane" id="8">

                    <span class="fontbuyut">Galeri İçerik Reklamları</span>
                    <div class="alert">
                        Bu özelliğin kullanımı için haber detayında 
                        <input type="text" style="width: 250px;" value="<iframe style='display:none;'></iframe>" />
                        kodu göstermek istediğiniz yere yapıştırın 
                    </div>

                      <div class="alert-danger"><b>Resim jpg veya gif formatında 600*100 formatında olmalıdır</b></div>



                    <div class="row-fluid">

                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    Bölümler

                                </div>

                                <div id="GaleriBolumlerListesi" runat="server">
                                </div>





                            </div>
                        </div>
                        <div class="span6">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <h5 id="Galerikategoribaslik">Reklam Detayları</h5>
                                </div>



                                <div id="GaleriBolumHabericiReklamDetaylari">
                                </div>

                            </div>
                        </div>




                    </div>

                </div>

            </div>

        </div>





        <div class="modal fade" id="resimonizleme" tabindex="-1" style="opacity: !important;" role="dialog" aria-labelledby="popup" aria-hidden="true">
            <div style="width: 100% !important; height: 100%;" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><span>Detay   


                        </span></h4>
                    </div>
                    <div id="buyukresim" class="modal-body">
                        <div class="clearfix"></div>
                        <div id="reklamsorgusonuc">
                        </div>

                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" id="resimonizlemekapat" class="btn btn-info kapatma" data-dismiss="modal">Kapat</button>
                </div>
            </div>
        </div>

        <div class="modal fade" id="bilgipenceresi" tabindex="-1" style="opacity: !important;" role="dialog" aria-labelledby="popup" aria-hidden="true">
            <div style="width: 100% !important; height: 100%;" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><span id="plakalabel">Detay   
                            <asp:Label ForeColor="White" runat="server" ID="SlaytId"></asp:Label>
                        </span></h4>
                    </div>
                    <div class="modal-body">
                        <iframe id="bilgisayfasi" src="#deneme" style="width: 100%; height: 100%; overflow: hidden; border: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0;"></iframe>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-info kapatma" data-dismiss="modal">Kapat</button>
                </div>
            </div>
        </div>
    </div>
    <div class="reklambuiste"></div>
    <input type="text" style="display: none;" id="idaktif" />
    <input type="text" style="display: none;" id="hangisi" />
    <link href="css/Reklamlar.aspx.cs.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="bootstrap.css" rel="stylesheet" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet" />
    <script src="js/summernoteEDiTED.js"></script>

    <script src="js/matrix.js"></script>


    <script type="text/javascript">
        // This function is called from the pop-up menus to transfer to
        // a different page. Ignore if the value returned is a null string:
        function goPage(newURL) {

            // if url is empty, skip the menu dividers and reset the menu selection to default
            if (newURL != "") {

                // if url is "-", it is this page -- reset the menu:
                if (newURL == "-") {
                    resetMenu();
                }
                // else, send page to designated URL            
                else {
                    document.location.href = newURL;
                }
            }
        }

        // resets the menu selection upon entry to this page:
        function resetMenu() {
            document.gomenu.selector.selectedIndex = 2;
        }
    </script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".Sil").click(function () {

            if (confirm("Reklamı silmek istediğinizden emin misiniz?")) {
                var ID = $(this).attr('name');

                $.ajax({
                    url: "ReklamSil.ashx/id=" + ID,
                    type: "POST",
                    data: { "veri": ID },
                    success: function (result) {

                        window.location = "Reklamlar.aspx";

                    }
                });
            }
        });
    });
</script>

    <script type="text/javascript">

        $(document).ready(function () {


            $(".nav-tabs li").on("click", function (e) {

                $(".nav-tabs li").removeClass("aktiftab");
                $(this).addClass("aktiftab");
            });

            $(".turlistli").on("click", function (e) {
                $("#ReklamDetaylari").html("<div style='text-align:center;width:100%;background:#fff;'>Lütfen Bekleyin<br><br><img src='yukleme.gif' /><br><br></div>");
                $(".turlistli").removeClass("buyukyazi");
                var reklamid = $(this).attr("data-reklamid");
                $(this).addClass("buyukyazi");
                var bolumadi = $(this).html();
                $("#bolumbaslik").html(bolumadi + " Bölümü Reklam Değişiklik Alanı");
                $.ajax({
                    url: "TurReklamGetir.ashx",
                    type: "POST",
                    data: { "veri": reklamid },
                    success: function (result) {

                        $(".buyukyazi").css("background-image", "url('yukleme.gif')");
                        $(".buyukyazi").css("background-repeat", "no-repeat");
                        $(".buyukyazi").css("background-position", "right");


                        setTimeout(function () {
                            $("#ReklamDetaylari").html(result);
                            $(".buyukyazi").css("background-image", "url('')");



                        }, 1000


                        );



                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            });





            $(".bolumlistli").on("click", function (e) {
                $("#BolumHabericiReklamDetaylari").html("<div style='text-align:center;width:100%;background:#fff;'>Lütfen Bekleyin<br><br><img src='yukleme.gif' /><br><br></div>");
                $(".bolumlistli").removeClass("bolumyazi");
                var reklamid = $(this).attr("data-reklamid");
                $(this).addClass("bolumyazi");
                var bolumadi = $(this).html();
                $("#kategoribaslik").html(bolumadi + " Bölümü Reklam Değişiklik Alanı");
                $.ajax({
                    url: "TurBolumReklamGetir.ashx",
                    type: "POST",
                    data: { "veri": reklamid },
                    success: function (result) {

                        $(".bolumyazi").css("background-image", "url('yukleme.gif')");
                        $(".bolumyazi").css("background-repeat", "no-repeat");
                        $(".bolumyazi").css("background-position", "right");


                        setTimeout(function () {
                            $("#BolumHabericiReklamDetaylari").html(result);
                            $(".bolumyazi").css("background-image", "url('')");



                        }, 1000


                        );



                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            });

            $(".videobolumlistli").on("click", function (e) {
                $("#VideoBolumHabericiReklamDetaylari").html("<div style='text-align:center;width:100%;background:#fff;'>Lütfen Bekleyin<br><br><img src='yukleme.gif' /><br><br></div>");
                $(".videobolumlistli").removeClass("videobolumyazi");
                var reklamid = $(this).attr("data-reklamid");
                $(this).addClass("videobolumyazi");
                var bolumadi = $(this).html();

                $("#Videokategoribaslik").html(bolumadi + " Bölümü Reklam Değişiklik Alanı");
                $.ajax({
                    url: "VideoTurBolumReklamGetir.ashx",
                    type: "POST",
                    data: { "veri": reklamid },
                    success: function (result) {

                        $(".videobolumyazi").css("background-image", "url('yukleme.gif')");
                        $(".videobolumyazi").css("background-repeat", "no-repeat");
                        $(".videobolumyazi").css("background-position", "right");


                        setTimeout(function () {
                            $("#VideoBolumHabericiReklamDetaylari").html(result);
                            $(".videobolumyazi").css("background-image", "url('')");



                        }, 1000


                        );



                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            });





            $(".sagturlistli").on("click", function (e) {
                $(".sagturlistli").removeClass("sagbuyukyazi");
                var reklamid = $(this).attr("data-reklamid");
                $(this).addClass("sagbuyukyazi");
                $.ajax({
                    url: "SagTurReklamGetir.ashx",
                    type: "POST",
                    data: { "veri": reklamid },
                    success: function (result) {
                        $("#SagReklamDetaylari").html(result);
                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            });

            $(".Galeribolumlistli").on("click", function (e) {
                $("#GaleriBolumHabericiReklamDetaylari").html("<div style='text-align:center;width:100%;background:#fff;'>Lütfen Bekleyin<br><br><img src='yukleme.gif' /><br><br></div>");
                $(".Galeribolumlistli").removeClass("Galeribolumyazi");
                var reklamid = $(this).attr("data-reklamid");
                $(this).addClass("Galeribolumyazi");
                var bolumadi = $(this).html();

                $("#Galerikategoribaslik").html(bolumadi + " Bölümü Reklam Değişiklik Alanı");
                $.ajax({
                    url: "GaleriTurBolumReklamGetir.ashx",
                    type: "POST",
                    data: { "veri": reklamid },
                    success: function (result) {

                        $(".Galeribolumyazi").css("background-image", "url('yukleme.gif')");
                        $(".Galeribolumyazi").css("background-repeat", "no-repeat");
                        $(".Galeribolumyazi").css("background-position", "right");


                        setTimeout(function () {
                            $("#GaleriBolumHabericiReklamDetaylari").html(result);
                            $(".Galeribolumyazi").css("background-image", "url('')");



                        }, 1000


                        );



                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            });




            $("#reklamlistele").addClass("active");
            $("#reklamlar").addClass("open");


            $('input[type=checkbox]').click(function () {
                var progress = setInterval(function () { var $bar = $('#bar3'); if ($bar.width() >= 1000) { clearInterval(progress); $('#bar3').css('width', 0 + '% '); } else { $bar.width($bar.width() + 350); } }, 100);
                var Checkbxid = jQuery(this).attr("id");
                $("#idaktif").val(Checkbxid);
                Dd(Checkbxid.substring(1));
                var ckbxkpt = "#D" + Checkbxid;
                $(ckbxkpt).css("display", "none");
                var resimid = "#R" + Checkbxid;

                $(resimid).css("display", "block");
            });
            function Dd(id) {



                $.ajax({
                    url: "ReklamDurumDegistir.ashx",
                    type: "POST",
                    data: { "veri": id },
                    success: function (result) {
                        var inputit = "#" + $("#idaktif").val()


                        var cekboxid = "C" + result.substring(0, 2);
                        var islemeid = "#R" + cekboxid;
                        $(inputit).toggle();
                        ResimKapat();






                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            }

            function ResimKapat() {
                var imajid = $("#idaktif").val();
                var resimid = "#R" + imajid;
                $(resimid).css("display", "none");
                var inputit = "#D" + $("#idaktif").val();
                $(inputit).toggle();
            }



            $(".big").show();
            $(".small").show();



            $(".small").before("<p class='megabaslik'>Küçük</p>");

            $(".big").before("<p  class='megabaslik'>Büyük</p>");



        });

    </script>

    <script type="text/javascript">
        function reklamdegistirfonk(id) {

            var reklamid = id;
            var turid = $(".buyukyazi").attr("data-turid");
            $.ajax({
                url: "ReklamDegistir.ashx",
                type: "POST",
                data: { "reklamid": reklamid, "turid": turid },
                success: function (result) {


                    $("#ReklamDetaylari").html("<div style='background:#fff;text-align:center;min-height:300px;'>Kaydediliyor <br><br><br><img src='yukleme.gif'/></div>");




                    setTimeout(
                        function () {
                            location.reload();
                        }, 3000


                    )

                },
                error: function (err) {
                    alert(err.statusText);
                }
            });

        }
        function sagreklamdegistirfonk(id) {

            var reklamid = id;
            var turid = $(".sagbuyukyazi").attr("data-turid");
            $.ajax({
                url: "SagReklamDegistir.ashx",
                type: "POST",
                data: { "reklamid": reklamid, "turid": turid },
                success: function (result) {


                    $("#SagReklamDetaylari").html("<div style='background:#fff;text-align:center;min-height:300px;'>Kaydediliyor <br><br><br><img src='yukleme.gif'/></div>");




                    setTimeout(
                        function () {
                            location.reload();
                        }, 3000


                    )

                },
                error: function (err) {
                    alert(err.statusText);
                }
            });

        }
        function KategoriReklamDegistir(id) {

            var reklamid = id;
            var turid = $(".bolumyazi").attr("data-turid");
            $.ajax({
                url: "KategoriReklamDegistir.ashx",
                type: "POST",
                data: { "reklamid": reklamid, "turid": turid },
                success: function (result) {


                    $("#BolumHabericiReklamDetaylari").html("<div style='background:#fff;text-align:center;min-height:300px;'>Kaydediliyor <br><br><br><img src='yukleme.gif'/></div>");




                    setTimeout(
                        function () {
                            location.reload();
                        }, 3000


                    )

                },
                error: function (err) {
                    alert(err.statusText);
                }
            });

        }
        function VideoKategoriReklamDegistir(id) {

            var reklamid = id;
            var turid = $(".videobolumyazi").attr("data-turid");
            $.ajax({
                url: "VideoKategoriReklamDegistir.ashx",
                type: "POST",
                data: { "reklamid": reklamid, "turid": turid },
                success: function (result) {


                    $("#BolumHabericiReklamDetaylari").html("<div style='background:#fff;text-align:center;min-height:300px;'>Kaydediliyor <br><br><br><img src='yukleme.gif'/></div>");




                    setTimeout(
                        function () {
                            location.reload();
                        }, 3000


                    )

                },
                error: function (err) {
                    alert(err.statusText);
                }
            });

        }

        function GaleriKategoriReklamDegistir(id) {

            var reklamid = id;
            var turid = $(".Galeribolumyazi").attr("data-turid");
            $.ajax({
                url: "GaleriKategoriReklamDegistir.ashx",
                type: "POST",
                data: { "reklamid": reklamid, "turid": turid },
                success: function (result) {
                    setTimeout(
                        function () {
                            location.reload();
                        }, 3000


                    )

                },
                error: function (err) {
                    alert(err.statusText);
                }
            });

        }


        $(document).ready(function () {




            $(".icon-pencil").click(function () {

                var haberid = $(this).attr("data-url");
                console.log(haberid);

                $('#bilgipenceresi').modal('show');
                $('#bilgipenceresi').addClass('in');
                $("#bilgisayfasi").attr("src", haberid)

            })

            $("div.rimg").click(function () {

                var url = $(this).attr("src");
                var id = $(this).attr("data-reklamid");
                $.ajax({
                    url: "ReklamSorgula.ashx",
                    type: "POST",
                    data: { "veri": id },
                    success: function (result) {
                        var inputit = "#" + $("#idaktif").val()
                        if (result.length == 2) {
                        }
                        else {
                            $("#reklamsorgusonuc").html(result);
                        }
                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });




                $("#buyukresim").css("background-image", "url('" + url + "')");

                $('#resimonizleme').modal('show');
                $('#resimonizleme').addClass('in');


            })


        });
    </script>
</asp:Content>
