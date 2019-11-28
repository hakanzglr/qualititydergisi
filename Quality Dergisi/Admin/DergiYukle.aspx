<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DergiYukle.aspx.cs" Inherits="Quality_Dergisi.Admin.DergiYukle" %>
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


    <h3>Dergi Yükle</h3>



    <div class="row-fluid">

        <div class="span6">
            <div class="widget-box">
                <div class="widget-title">
                    <span class="icon"><i class="icon-align-justify"></i></span>
                    <h5>Dergi Yükle</h5>
                </div>
                <div class="widget-content nopadding">
                       
                        
                    <div class="control-group">
                        <label class="control-label">Resim Adı</label>
                        <div class="controls">
                            <input type="text" runat="server" id="resimismi" class="span11" />

                        </div>
                    </div>


                      
                </div>
                <div class="widget-content nopadding">
                       
                        
                        <div class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <input type="file" runat="server" id="buyukresimfile" class="span11" />
                                <img style="display: none;" id="buyukresimyukleniyor" src="yukleme.gif" />
                            </div>
                        </div>


                      
                    </div>
                </div>
        <div class="span6">

        
            <div style="text-align: right;" class="form-actions">
                <div style="display: none;" id="HaberEkle" class="btn btn-success">Kaydet</div>
                <asp:Button runat="server" ID="Kaydet" OnClick="Kaydet_Click" Text="Kaydet" CssClass="btn btn-success" />

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
            $("#hekle").addClass("active");
            $("#haberler").addClass("open");


           







            $('#buyukresimfile').on('change', function () {



                $("#buyukresimyukleniyor").show();

                var formData2 = new FormData();
                formData2.append('file', $('#buyukresimfile')[0].files[0]);

                $.ajax({
                    data: formData2,
                    type: "POST",
                    url: "Upload.ashx?konum=galeri",
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

