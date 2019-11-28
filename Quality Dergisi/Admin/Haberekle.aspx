<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Haberekle.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm5" %>
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

        .dropdown-toggle {
            height: 30px !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" ClientIDMode="Static" runat="Server">
    <div class="container-fluid">

        <h3>Yeni Haber Ekle</h3>



        <div class="row-fluid">

            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5>Haber Ekle</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Kategori Seç</label>
                                <div class="controls">


                                    <asp:DropDownList ID="kategori" runat="server" CssClass="span11"></asp:DropDownList>





                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Haber Başlığı</label>
                                <div class="controls">
                                    <input type="text" runat="server" class="span11" id="haberbaslik" placeholder="" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Haber Spot</label>
                                <div class="controls">
                                    <input type="text" runat="server" class="span11" id="haberspot" placeholder="" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Haber Büyük Resim (605*360) boyutunda <b>jpg</b> resim olmalı</label>
                                <div class="controls">
                                    <input type="file" runat="server" id="buyukresimfile" class="span11" />
                                    <img style="display: none;" id="buyukresimyukleniyor" src="yukleme.gif" />
                                </div>
                            </div>


                            <div class="control-group">
                                <label class="control-label">Etiketler (Virgül ile ayırın)</label>
                                <div class="controls">
                                    <textarea style="height: 330px;" class="span11"></textarea>
                                </div>
                            </div>
                            <div style="text-align: right;" class="form-actions">
                                <div id="HaberEkle" class="btn btn-success">Kaydet</div>
                                <asp:ScriptManager runat="server" ID="psm"></asp:ScriptManager>
                                <asp:UpdatePanel runat="server" ID="eklepanel">
                                    <ContentTemplate>
                                        <div style="display:none;">
                                        <asp:Button runat="server" ID="Kaydet" OnClick="Kaydet_Click" Text="Kaydet" CssClass="btn btn-success" />
                                        </div>
                                    </ContentTemplate>

                                    <Triggers>
                                    </Triggers>
                                </asp:UpdatePanel>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5>Haber İçeriği</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">


                            <textarea class="span11" runat="server" enableviewstate="false" id="summernote" style="width: 100%; height: 200px; background-color: white;" cols="5" rows="2"></textarea>


                            <div style="display: none; padding: 10px; text-align: center;" id="cokludosyayukleniyor">
                                Lütfen bekleyin,yükleme devam ediyor<br />
                                <br />
                                <img src="../bigLoader.gif" />
                            </div>

                        </div>
                    </div>
                </div>



            </div>
        </div>
    </div>
    <div style="display: none;">
        <input type="text" runat="server" id="buyukresimadresi" style="display: none;" />
        <asp:TextBox runat="server" ID="kombokategori"></asp:TextBox>

    </div>


    <script src="editor/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet" />

    <link href="https://summernote.org/vendors/summernote/dist/summernote.css" rel="stylesheet" />

    <script src="js/summernoteEDiTED.js"></script>


    <script src="js/matrix.js"></script>







    <script type="text/javascript">

        $(document).ready(function () {
            $("#hekle").addClass("active");
            $("#haberler").addClass("open");

            $('#HaberEkle').click(function () {




                var r = confirm("Haber Kategorisi Doğru mu ?");
                if (r === false) {
                    return false;
                }
                else {
                    document.getElementById("Kaydet").click();

                }






            });


            $('#kategori').change(function () {
                var idsec = $(this).find("option:selected").attr('value');

                $("#kategori > option").attr("selected", false);
                $("#kategori > option[value=" + idsec + "]").attr("selected", true);

                $("input#kombokategori").val(idsec);
            });



            $('#summernote').summernote({
                height: 200,
                tabsize: 5,
                height: 500,




                callbacks: {
                    onImageUpload: function (files) {
                        that = $(this);
                        for (var i = files.length - 1; i >= 0; i--) {
                            sendFile(files[i], this);
                        }
                    }
                }

            });
            function sendFile(file, that) {
                $(".card-block").slideUp();
                $("#cokludosyayukleniyor").show();
                var formData = new FormData();
                formData.append('file', file);
                $.ajax({
                    data: formData,
                    type: "POST",
                    url: "Upload.ashx?konum=haber",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {


                        $(that).summernote('editor.insertImage', "../img/haber/" + url);
                        $(".card-block").slideDown();
                        $("#cokludosyayukleniyor").hide();

                    }
                })
            }





            $('#buyukresimfile').on('change', function () {



                $("#buyukresimyukleniyor").show();

                var formData2 = new FormData();
                formData2.append('file', $('#buyukresimfile')[0].files[0]);

                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "Upload.ashx?konum=haber",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (url) {
                        $("#buyukresimyukleniyor").hide();
                        $("#buyukresimadresi").val(url);


                    }
                })

            });




        });
    </script>

    <link href="css/OzellestirilmisMODAL.css" rel="stylesheet" />

</asp:Content>
