<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ReklamEkleMegaUstHaberici.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css' />
    <meta charset="UTF-8" />

    <style type="text/css">
        #ceper {
            min-height: 500px;
        }

        .note-editor {
            float: left;
            width: 100%;
        }

        .span6 {
            min-height: 300px !important;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <h3>Mega Banner  / Haber İçi Reklam</h3>



    <div class="row-fluid">

        <div class="span6">
            <div class="widget-box">
                <div class="widget-title">
                    <span class="icon"><i class="icon-align-justify"></i></span>
                    <h5>Mega Banner Güncelle</h5>
                </div>
                <div class="widget-content nopadding">
                    <div class="form-horizontal">


                        <div class="control-group">
                            <label class="control-label"><b>Büyük</b> resim seçin 

                                1920px * 480px
                            </label>
                            <div class="controls">

                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="buyukresimfile" CssClass="span11" />

                                <img style="display: none;" id="buyukresimyukleniyor" src="yukleme.gif" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><b>Küçük</b> resim seçin
                                1920px * 120px
                            </label>
                            <div class="controls">
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="kucukresimfile" CssClass="span11" />

                                <img style="display: none;" id="kucukresimyukleniyor" src="yukleme.gif" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Reklam Adres</label>
                            <div class="controls">
                                <input type="text" runat="server" id="megaadres" class="span11" />
                            </div>
                        </div>
                        <div style="text-align: right;" class="form-actions">
                            <asp:Button runat="server" ID="MegaKaydetbtn" OnClick="MegaKaydet" Text="Kaydet" CssClass="btn btn-success" />

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div style="display:none;" class="span6">
            <div class="widget-box">
                <div class="widget-title">
                    <span class="icon"><i class="icon-align-justify"></i></span>
                    <h5>Üst Banner Güncelle</h5>
                </div>
                <div class="widget-content nopadding">
                    <div class="form-horizontal">


                        <div class="control-group">
                            <label class="control-label">Ust Banner resim seçin</label>
                            <div class="controls">
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="bannerfile" CssClass="span11" />

                                <img style="display: none;" id="bannerresimyukleniyor" src="yukleme.gif" />

                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Reklam Adres</label>
                            <div class="controls">
                                <input type="text" runat="server" id="banneradres" class="span11" />
                            </div>
                        </div>
                        <div style="text-align: right;" class="form-actions">
                            <asp:Button runat="server" ID="Button1" OnClick="UstBannerKaydet" Text="Kaydet" CssClass="btn btn-success" />

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="span6">
            <div class="widget-box">
                <div class="widget-title">
                    <span class="icon"><i class="icon-align-justify"></i></span>
                    <h5>Haber İçi Reklam Güncelle</h5>
                </div>
                <div class="widget-content nopadding">
                    <div class="form-horizontal">


                        <div class="control-group">
                            <label class="control-label">Resim seçin  728px X 90px  </label>
                            <div class="controls">
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="habericifile" CssClass="span11" />

                                <img style="display: none;" id="habericiresimyukleniyor" src="yukleme.gif" />
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label">Reklam Adres</label>
                            <div class="controls">
                                <input type="text" runat="server" id="habericireklamadres" class="span11" />
                            </div>
                        </div>
                        <div style="text-align: right;" class="form-actions">
                            <asp:Button runat="server" ID="Button2" OnClick="HabericiKaydet" Text="Kaydet" CssClass="btn btn-success" />

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div style="display:none;">
    <input type="text" runat="server" id="buyukresimadresi" />

    <input type="text" runat="server" id="kucukresimadresi" />
    <input type="text" runat="server" id="bannerresimadres" />

    <input type="text" runat="server" id="habericiadres" />


</div>
    <script src="editor/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>





    <script src="js/matrix.js"></script>







    <script type="text/javascript">

        $(document).ready(function () {
            $("#reklamekle2").addClass("active");
            $("#reklamlar").addClass("open");

            $('#buyukresimfile').on('change', function () {
                $("#buyukresimyukleniyor").show();
                var formData2 = new FormData();
                formData2.append('file', $('#buyukresimfile')[0].files[0]);
                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "MegaUpload.ashx?hangi=buyuk",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        $("#buyukresimyukleniyor").hide();
                        $("#buyukresimadresi").val(url);

                    }
                })

            });


            $('#kucukresimfile').on('change', function () {
                $("#kucukresimyukleniyor").show();
                var formData2 = new FormData();
                formData2.append('file', $('#kucukresimfile')[0].files[0]);
                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "MegaUpload.ashx?hangi=kucuk",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        $("#kucukresimyukleniyor").hide();
                        $("#kucukresimadresi").val(url);
                    }
                })

            });


            $('#bannerfile').on('change', function () {
                $("#bannerresimyukleniyor").show();
                var formData2 = new FormData();
                formData2.append('file', $('#bannerfile')[0].files[0]);
                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "MegaUpload.ashx?hangi=kucuk",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        $("#bannerresimyukleniyor").hide();
                        $("#bannerresimadres").val(url);
                    }
                })

            });

            $('#habericifile').on('change', function () {
                $("#habericiresimyukleniyor").show();
                var formData2 = new FormData();
                formData2.append('file', $('#habericifile')[0].files[0]);
                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "MegaUpload.ashx?hangi=kucuk",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        $("#habericiresimyukleniyor").hide();
                        $("#habericiadres").val(url);
                    }
                })

            });


        });
    </script>

    <link href="css/OzellestirilmisMODAL.css" rel="stylesheet" />

</asp:Content>
