<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GaleriDetayDuzenle.aspx.cs" Inherits="Quality_Dergisi.Admin.GaleriDetayDuzenle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
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

        .yesilcerceve {
            padding: 10px;
            border: 1px solid #80bdff;
            border-radius: 4px;
            background: #fff;
            width: 200px;
            background:#80bdff;
        }
    </style>

    <link href="css/DetaySayfalariGenel.css" rel="stylesheet" />

</head>
<body>
    <div id="kaydediliyor">

        <img src="yukleme.gif" />
        <input type="text" runat="server" id="idaktif" />

    </div>

    <form id="form1" runat="server">
        <input type="text" runat="server" style="display: none;" id="kat" />


        <div id="yuklenenresimler"></div>
        <div class="grupbaslik">Galeri Bilgileri</div>
        <div id="galerisabit">
            <div class="row">
                <div class="col-md-2">
                    <div class="col-form-label">
                        Galeri Başlığı
                    </div>
                </div>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="haberbaslik" CssClass="form-control"></asp:TextBox>


                </div>

            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="col-form-label">
                        Spot
                    </div>
                </div>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="spottxt" CssClass="form-control"></asp:TextBox>


                </div>
                <div class="col-md-3">
                </div>
            </div>
            <div class="row">

                <div style="float: left;" class="col-md-2">
                    Kategori
                        
                </div>
                <div style="float: left;" class="col-md-6">
                    <asp:DropDownList ID="kategori" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div style="float: left;" class="col-md-2"></div>


            </div>
            <hr />

            <div class="grupbaslik">Galeri Resim</div>

            <div class="row">

                <div style="border: 1px solid #80bdff; border-radius: 4px; padding: 5px;" class="col-md-12 col-xs-12">

                    <div style="float: left;" class="col-md-6 col-xs-6">
                        <img src="#" runat="server" id="buyukresim" style="width: 200px;" />


                    </div>

                    <div style="float: left; text-align: left;" class="col-md-6 col-xs-6">
                        Galeri Büyük Resmi Değiştir<br />
                        <br />
                        <asp:FileUpload runat="server" CssClass="yesilcerceve" ID="resimbuyuk" /><br />
                        <br />
                        <br />
                        <asp:CheckBox runat="server" ID="boyutlandirsinmi" Text="Boyut Küçült" CssClass="yesilcerceve" />
                    </div>

                </div>



            </div>
            <br />
            <br />







            <div class="clearfix">
            </div>
            <div class="row">
                <div class="col-md-12">

                    <asp:Button runat="server" OnClick="Guncelle_Click" ID="Guncelle" CssClass="btn btn-success" Text="Güncelle" />



                </div>

            </div>
            <hr />









        </div>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>







        <script type="text/javascript">



            $(document).ready(function () {


                $('#kategori').change(function () {
                    var secili = $("#kategori option:selected").val()
                    $('#kat').val(secili);

                })


                $('#buyukresim').click(function () {
                    var resim = $('#resimdiv');

                    if (resim.css("width") == "100px") {

                        $(resim).css("width", "100%");

                    }
                    else {
                        $(resim).css("width", "100px");
                    }


                });






            });

        </script>


    </form>


</body>
</html>
