﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoDetay.aspx.cs" Inherits="Quality_Dergisi.Admin.VideoDetay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        ::-webkit-file-upload-button {
  background: #80bdff !important;
  color: white !important;
  padding: 1em;
}
        #resimbuyuk{
            height:40px !important;
            line-height:5px !important;
            border:0px !important;
            width:400px;
            font-size:12px;
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

        #kaydediliyor {
            display: none;
        }
    </style>

    <link href="css/DetaySayfalariGenel.css" rel="stylesheet" />
</head>
<body>
    <div id="kaydediliyor">

        <img src="yukleme.gif" />

    </div>

    <form id="form1" runat="server">
        <input type="text" runat="server" id="idaktif" />
        <br />
           <div class="col-md-12">

                <div class="alert">
                    Haber içi reklam kullanımı için haber detayında şunu kullanın. 
                                 <input type="text" style="width: 300px;" value="<iframe style='display:none;'></iframe>" />
                    kodu göstermek istediğiniz yere yapıştırın 
                </div>


            </div> 
        <div style="padding: 10px;" class=" ">

            <div class="row">

                <div class="col-md-12">

                    <div class="grupbaslik">Video Bilgileri</div>
                </div>

                <div class="col-md-2">
                    <div class="col-form-label">
                        Video Başlığı
                    </div>
                </div>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="haberbaslik" CssClass="form-control" ></asp:TextBox>


                </div>

            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="col-form-label">
                        Video Açıklama
                    </div>
                </div>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="aciklamatxt" CssClass="form-control"></asp:TextBox>


                </div>

            </div>

            <div class="row">
                <div class="col-md-2">
                    <div class="col-form-label">
                        Spot Açıklama
                    </div>
                </div>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="spottxt" CssClass="form-control"></asp:TextBox>


                </div>

            </div>


            <div class="row">
                <div class="col-md-2">
                    <div class="col-form-label">
                        Kategori
                    </div>
                </div>
                <div class="col-md-3">





                    <asp:DropDownList runat="server" ID="kategori" CssClass="form-control"></asp:DropDownList>
                    <input type="text" runat="server" id="kombokategori" style="display: none;" />


                </div>

                <div class="col-md-7">

                    <div class="row">
                        <div class="col-md-6">
                            Video Aktif/Değil

                        </div>
                        <div class="col-md-6">

                            <asp:Repeater runat="server" ID="Durum">

                                <ItemTemplate>
                                    <div id="DC<%#Eval("id").ToString() %>" style="" class="switch">
<label style="padding-left:0px !important;">
<input  id="C<%#Eval("id").ToString() %>"  type='checkbox'   <%# !bool.Parse(Eval("akt").ToString())  ? "  > <span class='lever'>" : " checked='checked'><span class='lever'> " %> </label>

</div>    <img id="RC<%#Eval("id").ToString()%>"  style="display:none;"  src="yukleme.gif" />
               
                                </ItemTemplate>

                            </asp:Repeater>

                        </div>

                    </div>



                </div>

            </div>
        </div>
        <hr />

        <div style="padding: 10px;" class="row">
            <div class="col-md-12">
                <div class="grupbaslik">Video Resmi</div>


            </div>

            <div class="col-md-6">

                <img runat="server" style="width: 200px;" id="buyukresim" src="#" />

            </div>


            <div class="col-md-6">
                <asp:FileUpload runat="server" ID="resimbuyuk" CssClass="form-control" />
                <br />
                <br />

                <label>
                    <input type="checkbox" runat="server" class="switch" id="boyutlandirsinmi" />
                    Resim Kalitesi Düşür</label>

            </div>
        </div>

        <br />
        <br />
        <div style="padding: 10px;" class="row">
            <div class="col-md-12">
                <div class="grupbaslik">Video Detay</div>


            </div>

            <div class="col-md-12">


                <textarea runat="server" id="summernote" style="width: 100%; height: 200px; background-color: white;" cols="5" rows="3"></textarea>
            </div>

        </div>

        <div class="clearfix">
        </div>
        <div class="row">
            <div class="col-md-12">
                <br />
                <br />
                <asp:Button runat="server" OnClick="Guncelle_Click" ID="Guncelle" CssClass="btn btn-success" Text="Güncelle" />

                <img src="yukleme.gif" style="display: none;" id="guncellemebekle" />

                <br />
                <br />
            </div>
            <asp:Literal runat="server" Mode="Encode" ID="cozme"></asp:Literal>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet" />
        <script src="js/summernoteEDiTED.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">


        <script type="text/javascript">


            $(document).ready(function () {

                $('#kategori').change(function () {
                    var secili = $("#kategori option:selected").val()
                    $('#kombokategori').val(secili);

                })


                $('#summernote').summernote({
                    height: 200,
                    tabsize: 5,
                    height: 500,

                    callbacks: {
                        onImageUpload: function (files) {
                            that = $(this);
                            for (var i = files.length - 1; i >= 0; i--) {
                                sendFile(files[0], that);


                            }
                        }
                    }







                });
                function sendFile(file, that) {


                    var formData = new FormData();
                    formData.append('file', $('input[type=file]')[0].files[0]);
                    $.ajax({
                        data: formData,
                        type: "POST",
                        url: "Upload.ashx",
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (url) {


                            $(that).summernote('editor.insertImage', url)
                        }
                    })
                }

                $('#buyukresim').click(function () {
                    var resim = $('#resimdiv');

                    if (resim.css("width") == "100px") {

                        $(resim).css("width", "100%");

                    }
                    else {
                        $(resim).css("width", "100px");
                    }





                });


                $('#Guncelle').click(function () {

                    $('#guncellemebekle').show();

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
                        url: "VideoDurumDegistir.ashx",
                        type: "POST",
                        data: { "veri": id },
                        success: function (result) {
                            var cekboxid = "C" + result.substring(0, 2);
                            var islemeid = "#R" + cekboxid;
                            var inputit = "#" + $("#idaktif").val()
                            $(inputit).toggle();

                            setTimeout(ResimKapat, 500)
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

            function sendFile(file, that) {


                var formData = new FormData();
                formData.append('file', $('input[type=file]')[0].files[0]);
                $.ajax({
                    data: formData,
                    type: "POST",
                    url: "Upload.ashx",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        console.log(url)

                        $(that).summernote('editor.insertImage', url)
                    }
                })
            }




        </script>






    </form>


</body>
</html>

