<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ReklamEkle.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm8" %>
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <h3>Yeni Reklam Ekle</h3>



        <div class="row-fluid">

            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5>Reklam Ekle</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Tür Seç</label>
                                <div class="controls">
                                    <asp:DropDownList ID="reklamturkombo" ClientIDMode="Static" runat="server" CssClass="span11">
                                        <asp:ListItem Value="1" Text="Resim"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Html"></asp:ListItem>
                                    </asp:DropDownList> 
                                    <input type="text" runat="server" id="kombokategori" style="display: none;" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Reklam Başlığı</label>
                                <div class="controls">
                                    <input type="text" runat="server" class="span11" id="basliktxt" placeholder="" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Reklam resim ise seçin</label>
                                <div class="controls">
                                    <input type="file" runat="server" accept=".jpg, .jpeg" id="buyukresimfile" class="span11" />
                                    <img style="display: none;" id="buyukresimyukleniyor" src="yukleme.gif" />
                                </div>

                            </div>


                            <div class="control-group">
                                <label class="control-label">Reklam Adres</label>
                                <div class="controls">
                                    <input type="text" runat="server" id="reklamadrestxt" class="span11" />
                                </div>
                            </div>
                            <div style="text-align: right;" class="form-actions">
                                <div style="display: none;" id="HaberEkle" class="btn btn-success">Kaydet</div>
                                <asp:Button runat="server" ID="Kaydet" OnClick="Kaydet_Click" Text="Kaydet" CssClass="btn btn-success" />

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5>Reklam Türü HTML ise kullanın</h5>
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
    <input type="text" runat="server" id="buyukresimadresi" style="display: none;" />




    <script src="editor/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet" />
    <script src="js/summernoteEDiTED.js"></script>




    <script src="js/matrix.js"></script>







    <script type="text/javascript">

        $(document).ready(function () {
            $("#reklamekle").addClass("active");
            $("#reklamlar").addClass("open");

            $('#reklamturkombo').change(function () {
                var secili = $("#reklamturkombo option:selected").val()
                $('#kombokategori').val(secili);

            })

            $('#summernote').summernote({
                height: 200,
                tabsize: 5,
                height: 500,
            });






            $('#buyukresimfile').on('change', function () {



                $("#buyukresimyukleniyor").show();

                var formData2 = new FormData();
                formData2.append('file', $('#buyukresimfile')[0].files[0]);

                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "Upload.ashx?konum=reklam",
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
