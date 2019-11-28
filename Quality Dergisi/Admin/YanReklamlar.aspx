<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="YanReklamlar.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm14" %>
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


    <h3>Yan Reklamlar (120px*600px)</h3>



    <div class="row-fluid">

        <div class="span6">
            <div class="widget-box">
                <div class="widget-title">
                    <span class="icon"><i class="icon-align-justify"></i></span>
                    <h5>Sol Resim Güncelle </h5>
                </div>
                <div class="widget-content nopadding">
                    <div class="form-horizontal">


                        <div class="control-group">
                            <label class="control-label"><b>Sol</b> resim seçin</label>
                            <div class="controls">

                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="solfile" CssClass="span11" />

                                <img style="display: none;" id="solyukleniyor" src="yukleme.gif" />
                            </div>
                        </div>
                    

                        <div class="control-group">
                            <label class="control-label">Sol Adres</label>
                            <div class="controls">
                                <input type="text" runat="server" id="soladres" class="span11" />
                            </div>
                        </div>
                        <div style="text-align: right;" class="form-actions">
                            <asp:Button runat="server" ID="MegaKaydetbtn" OnClick="solkaydet" Text="Kaydet" CssClass="btn btn-success" />

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="span6">
            <div class="widget-box">
                <div class="widget-title">
                    <span class="icon"><i class="icon-align-justify"></i></span>
                    <h5>Sağ Güncelle</h5>
                </div>
                <div class="widget-content nopadding">
                    <div class="form-horizontal">


                        <div class="control-group">
                            <label class="control-label">Sağ seçin</label>
                            <div class="controls">
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="sagfile" CssClass="span11" />

                                <img style="display: none;" id="sagyukleniyor" src="yukleme.gif" />

                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Sağ Adres</label>
                            <div class="controls">
                                <input type="text" runat="server" id="sagadres" class="span11" />
                            </div>
                        </div>
                        <div style="text-align: right;" class="form-actions">
                            <asp:Button runat="server" ID="Button1" OnClick="sagkaydet" Text="Kaydet" CssClass="btn btn-success" />

                        </div>
                    </div>
                </div>
            </div>

        </div>

         
    </div>
    <div style="display:none;">
    <input type="text" runat="server" id="solresimadres" />

    <input type="text" runat="server" id="sagresimadres" />
 
 
    </div>

    <script src="editor/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>





    <script src="js/matrix.js"></script>







    <script type="text/javascript">

        $(document).ready(function () {
            $("#reklamekle3").addClass("active");
            $("#reklamlar").addClass("open");

            $('#solfile').on('change', function () {
                $("#buyukresimyukleniyor").show();
                var formData2 = new FormData();
                formData2.append('file', $('#solfile')[0].files[0]);
                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "YanReklamlar.ashx?tur=sol.png",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        $("#solyukleniyor").hide();
                        $("#solresimadres").val(url);

                    }
                })

            });


            $('#sagfile').on('change', function () {
                $("#kucukresimyukleniyor").show();
                var formData2 = new FormData();
                formData2.append('file', $('#sagfile')[0].files[0]);
                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "YanReklamlar.ashx?tur=sag.png",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        $("#sagyukleniyor").hide();
                        $("#sagresimadres").val(url);
                    }
                })

            });


 
          


        });
    </script>

    <link href="css/OzellestirilmisMODAL.css" rel="stylesheet" />

</asp:Content>
