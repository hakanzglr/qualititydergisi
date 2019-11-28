<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="KategoriYonetimi.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .sira {
            width: 30px;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }

        .minyukseklik {
            min-height: 500px !important;
        }

        .table th, .table td {
            border: 0px !important;
        }

        .altcizgi {
            border-bottom: 1px solid #b5e288 !important;
            width: 100% !important;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .turad {
            color: white;
        }

        .table-responsive {
            width: 100%;
        }

        .duzenlelink:hover {
            text-decoration: none !important;
            color: red;
        }


        .fade.in {
            top: 0 !important;
            right: 0;
            bottom: 0;
            left: 0;
            overflow: hidden;
            width: 100% !important;
            margin: 0 auto !important;
        }

        .modal-dialog {
            margin: 0;
            width: 100%;
            height: 100%;
            padding: 0;
        }

        .modal-content {
            position: absolute;
            top: 0 !important;
            right: 0 !important;
            bottom: 0 !important;
            left: 0 !important;
            border: 2px solid #3c7dcf;
            border-radius: 0;
            box-shadow: none;
        }

        .modal-header {
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            height: 50px;
            padding: 10px;
            background: #6598d9;
            border: 0;
        }

        .modal-body {
            position: absolute;
            top: 50px;
            bottom: 60px;
            width: 100%;
            font-weight: 300;
            overflow: auto;
            max-height: 100% !important;
        }

        .modal-footer {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            height: 60px;
            padding: 10px;
            background: #f1f3f5;
        }



        #idaktif {
            display: none;
        }

        .form-control {
            border: 1px solid #80bdff !important;
        }

        .card-header.note-toolbar > .btn-group {
            margin-right: 30px !important;
        }

        .kategori {
            padding: 10px;
            color: #fff !important;
            text-align: center;
        }


        .switch label .lever, .switch label .lever:after {
            content: "";
            display: inline-block;
        }

        .switch, .switch * {
            user-select: none;
        }

            .switch label {
                cursor: pointer;
            }

                .switch label input[type=checkbox] {
                    opacity: 0;
                    width: 0;
                    height: 0;
                    margin: 0;
                }

                .switch label .lever {
                    position: relative;
                    width: 40px;
                    height: 15px;
                    background-color: #e0e0e0;
                    border-radius: 15px;
                    -webkit-transition: background .3s ease;
                    -o-transition: background .3s ease;
                    transition: background .3s ease;
                    vertical-align: middle;
                    margin: 0 16px;
                }

                    .switch label .lever:after {
                        position: absolute;
                        width: 25px;
                        height: 25px;
                        background-color: #FFF;
                        border-radius: 21px;
                        -webkit-box-shadow: 0 1px 1px 1px rgba(0,0,0,.2);
                        box-shadow: 0 1px 1px 1px rgba(0,0,0,.2);
                        left: -5px;
                        top: -5px;
                        -webkit-transition: left .3s ease,background .3s ease,box-shadow .1s ease;
                        -o-transition: left .3s ease,background .3s ease,box-shadow .1s ease;
                        transition: left .3s ease,background .3s ease,box-shadow .1s ease;
                    }

        .timeline > li:after, .timeline > li:before {
            display: table;
            content: " ";
        }

        input[type=checkbox]:checked:not(:disabled) ~ .lever:active:after {
            -webkit-box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(233,30,99,.1);
            box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(233,30,99,.1);
        }

        input[type=checkbox]:not(:disabled) ~ .lever:active:after {
            -webkit-box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(0,0,0,.08);
            box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(0,0,0,.08);
        }

        .switch label input[type=checkbox]:checked + .lever:after {
            left: 24px;
        }

        .switch input[type=checkbox][disabled] + .lever {
            cursor: default;
        }

        .switch label input[type=checkbox][disabled] + .lever:after, .switch label input[type=checkbox][disabled]:checked + .lever:after {
            background-color: transparent;
        }

        .switch label input[type=checkbox]:checked + .lever {
            background-color: #80bdff !important;
        }

        .note-editor .note-dropzone {
            opacity: 0 !important;
        }

        #resimdiv {
            width: 100px;
        }

        .genisle {
            width: 100%;
        }


        .tamekran {
            left: 0px;
            top: 0px;
            bottom: 0px;
            position: fixed;
            right: 0px;
            width: 100%;
            height: 100%;
            background: white;
            z-index: 999999;
            display: table-caption;
            text-align: center;
        }

            .tamekran > img {
                position: absolute;
                top: 50%;
            }

        .satirreklam {
            cursor: pointer;
        }

        .beyazarkaplan {
            background: #fff;
            padding-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="minyukseklik">
            <h3>Kategori Listesi</h3>
            <asp:DataList ID="DataList1" runat="server" CellSpacing="0" Width="100%" CssClass="beyazarkaplan table-responsive">
                <HeaderTemplate>
                    <div style="font-size: 14px!important; font-weight: 600; margin-left: 10px !important; padding-top: 10px; text-align: left !important" class="row text-left">
                        <div class="col-md-3"  style="font-size: 14px !important;">
                            Kategori Adı
                        </div>

                        <div class="col-md-2 text-center">
                            Anasayfada Gösterilecek mi?

                        </div>

                        <div class="col-md-2">
                            Anasayfa Sırası

                        </div>

                        <div class="col-md-1" style="font-size: 20px;">
                            DÜzenle
                 
                        </div>
                         <div class="col-md-1" style="font-size: 20px;">
                            Sil
                 
                        </div>
                    </div>

                </HeaderTemplate>
                <ItemTemplate>

                    <div style="margin-left: 10px !important; text-align: center;" class="row altcizgi">

                        <div style="font-size: 14px !important;" class="col-md-3 ">


                            <div style='text-align: center; padding: 5px; color: white; background-color: <%# DataBinder.Eval(Container.DataItem,"renk") %>'>
                                <%# DataBinder.Eval(Container.DataItem, "tur_ad") %>
                            </div>
                        </div>
                        <div class="col-md-2 ">

                            <div id="DC<%#Eval("tur_id").ToString() %>" style="" class="switch">
                                <label style="padding-left: 0px !important;">
                                    <input id="C<%#Eval("tur_id").ToString() %>" type='checkbox' <%#Eval("Anasayfada").ToString()=="0"  ? "  > <span class='lever'" : " checked='checked'><span class='lever' " %> />
                                </label>

                            </div>
                            <img id="RC<%#Eval("tur_id").ToString()%>" style="display: none;" src="yukleme.gif" />


                        </div>

                        <div class="col-md-2 ">


                            <input type="text" class="sira col-xs-4" data-id="<%#Eval("tur_id").ToString() %>" id='Sira<%# DataBinder.Eval(Container.DataItem,"AnasayfaSira") %>' value='<%# DataBinder.Eval(Container.DataItem,"AnasayfaSira") %>' />

                        </div>
                        <div style="font-size: 20px;" class="col-md-1 ">
                            <div class="duzenlelink">
                                <i data-url="HaberDetay.aspx?Hid=<%# DataBinder.Eval(Container.DataItem, "tur_id") %>" class="icon-pencil"></i>

                            </div>

                        </div>
                       <div style="font-size: 20px;" class="col-md-1 ">
                            <div class="duzenlelink">
                                <a class="Sil" name="<%# DataBinder.Eval(Container.DataItem, "tur_id") %>"><i  class="icon-trash"></i></a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>



            </asp:DataList><div class="row">
                <div style="width: 100%; border-collapse: collapse; text-align: center" class="table-responsive">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-2">
                        <p id="siraguncelle" class="btn btn-success">Güncelle</p>


                    </div>
                    <div class="col-md-1"></div>
                </div>

            </div>




            <div class="modal fade" id="bilgipenceresi" tabindex="-1" style="" role="dialog" aria-labelledby="popup" aria-hidden="true">
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

            <h3>Yeni Kategori</h3>
            <br />
            <div style="padding: 10px; margin-top: 10px; background: #f9fefd">
                <div style="padding: 10px;">




                    <div style="text-align: center;" class="row">
                        <div class="col-md-3">

                            <input type="text" class="form form-control" id="ad" placeholder="Kategori Adı Girin" />
                        </div>
                        <div class="col-md-1">


                            <div class="btn btn-info satirreklam" data-id=''>
                                Reklam
                            </div>



                        </div>
                        <div style="text-align: center;" class="col-md-2">
                            <input type="text" class="" id="sira" style="width: 30px" />
                        </div>
                        <div class="col-md-2">

                            <div id="Kaydet" class="btn btn-success">Kaydet</div>
                            <img style="display: none" id="kaydediliyor" src="yukleme.gif" />
                        </div>
                        <div class="col-md-1">

                            <div style="display: none" id="bilgi">
                                Kaydedildi

                            </div>


                        </div>



                    </div>

                </div>

            </div>
        </div>
    </div>

    <input type="text" id="idaktif" value="0" />

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="bootstrap.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/matrix.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#kategoriyonetimi").addClass("active");

            $('.satirreklam').click(function () {

                $('#bilgipenceresi').modal('show');
                $("#bilgisayfasi").attr("src", "ReklamSec.aspx?id=" + $(this).attr("data-id"));
            });

              $(".Sil").click(function () {
           
                        if (confirm("kategoriyi silmek istediğinizden emin misiniz?")) {
                            var ID = $(this).attr('name');
                            //Tıklanan ilgili linkin name özelliğindeki ID değerini çekiyoruz.
                            $.ajax({
                                url: "KategoriSil.ashx/tur_id=" + ID,//Ajax ile tetiklenecek ilgili adresi belirliyoruz.
                                type: "POST",
                                  data: { "veri": ID },
                                success: function (result) {

                                    window.location = "KategoriYonetimi.aspx";

                                }
                            });
                        }
                  });



            function bilgigizle() {
                var ad = $('#ad').val();
                var sira = $('#sira').val();
                setTimeout(

                    function () {

                        $('#bilgi').fadeOut();
                        $.ajax({
                            url: "KategoriEkle.ashx",
                            type: "POST",
                            data: { "sira": sira, "ad": ad },
                            success: function (result) {


                                var cekboxid = "C" + result.substring(0, 2);
                                var islemeid = "#R" + cekboxid;
                                var inputit = "#" + $("#idaktif").val()
                                $(inputit).toggle();
                                ResimKapat();
                            },
                            error: function (err) {
                                alert(err.statusText);
                            }
                        });

                    }, 1000


                )

            }

            $('#Kaydet').click(function () {


                $('#Kaydet').hide();

                $('#kaydediliyor').fadeIn();


                setTimeout(function basarili() {
                    $('#Kaydet').fadeIn();
                    $('#kaydediliyor').fadeOut();
                    $('#bilgi').fadeIn();

                    bilgigizle();


                }, 2000


                )


            });

            $('#siraguncelle').click(function () {
                var soncocuk = $('.sira:last-child').attr("data-id");


                $('.sira').each(function () {
                    var id = $(this).attr("data-id");
                    var sira = $(this).val();


                    $.ajax({
                        url: "KategoriSiraDegistir.ashx",
                        type: "POST",
                        data: { "tur_id": id, "AnasayfaSira": sira },
                        success: function (result) {

                            if (result == soncocuk) {

                                window.location = "KategoriYonetimi.aspx";

                            }


                        },
                        error: function (err) {
                            alert(err.statusText);
                        }
                    });



                });

            });


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
                    url: "KategoriAnasayfaDegistir.ashx",
                    type: "POST",
                    data: { "veri": id },
                    success: function (result) {


                        var cekboxid = "C" + result.substring(0, 2);
                        var islemeid = "#R" + cekboxid;
                        var inputit = "#" + $("#idaktif").val()
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

            $(".kapatma").click(function () {

                yenile2();
                return false;

            });

            function yenile2() {
                parent.document.getElementById("yenile").click();


            }

        });
    </script>
</asp:Content>
