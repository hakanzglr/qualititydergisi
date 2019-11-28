<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MevcutfotografGuncelle.aspx.cs" Inherits="Quality_Dergisi.Admin.MevcutfotografGuncelle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .yuklenenresim {
            width: 100px;
        }

        .yesilcerceve {
            padding: 10px;
            border: 1px solid #0f9f12;
            border-radius: 4px;
            background: #fff;
            text-align: center;
            font-weight: 600;
            cursor: pointer;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            border-bottom: 1px solid #0f6e98;
        }

            .row > [class*='col-'] {
                display: flex;
                flex-direction: column;
            }

        .kirmizicerceve {
            padding: 10px;
            border: 1px solid #0f6e98;
            border-radius: 4px;
            background: #fff;
            text-align: center;
            font-weight: 600;
            color: #000;
            width: 50px;
            height: 50px;
            cursor: pointer;
         }

        .baslik {
            padding: 5px;
            font-weight: 600;
            border-bottom: 1px solid #0f6e98;
            background: #0f6e98;
            color: #fff;
            margin-bottom: 10px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 100;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />

        <div id="bekle" style="width: 100%; height: 200px; text-align: center;">
            <img src="yukleme.gif" />

        </div>

        <div id="bilgiler" style="min-height: 200px;">
            <input style="display: none;" type="text" id="galeriidtxt" runat="server" />

            <div class="row baslik">
                <div class="col-md-4">Fotoğraf</div>
                <div class="col-md-4">Açıklaması</div>
                <div class="col-md-4">Sıra</div>
                <br />

            </div>
            <div id="hamgelen"></div>


            <div class="yesilcerceve" style="display: none; bottom: 0; position: relative; background: #22c63e; color: #fff" id="kaydet">Açıklamaları Kaydet</div>
            <br />
            <br />
        </div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server" ID="silupdatepanel">
    <ContentTemplate>

        <asp:TextBox runat="server" ID="gecerliid"></asp:TextBox>
        <asp:Button runat="server" id="silmedugmesi"  OnClick="silmedugmesi_Click"/>
    </ContentTemplate>
    <Triggers>


    </Triggers>

</asp:UpdatePanel>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>


        <script type="text/javascript">
            $(document).ready(function () {

                setTimeout(function () { Galeri() }, 1000
                )



                function Galeri() {

                    var id = $("#galeriidtxt").val();
                    $.ajax({

                        type: "POST",
                        url: "Fotograflar.ashx?id=" + id + "",
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            $("#hamgelen").html(data + "<hr>");
                            $("#bilgiler").show();
                            $("#bekle").hide();
                            $(".resimaciklamasi:last-child").focusin();
                            $("#kaydet").show();
                            $("#yukleniyor").hide();
                        }
                    })

                }
                $("#kaydet").click(function () {

                    $('.resimaciklamasi').each(function () {

                        $("#bilgiler").fadeOut();

                        $("#bekle").show();




                        var id = $(this).attr("data-resimid");
                        var aciklama = $(this).val();

                        $.ajax({
                            type: "POST",
                            url: "GaleriCokluAciklamaGuncelle.ashx?id=" + id + "&aciklama=" + aciklama + "",
                            cache: false,
                            contentType: false,
                            processData: false,
                            success: function (data) {
                                $("#hamgelen").html("Kaydedildi");

                                $(".resimaciklamasi:first-child").focus();
                                $("#kaydet").show();
                                $("#yukleniyor").hide();

                                setTimeout(

                                    function () {

                                        Galeri();


                                    }, 2000
                                )


                            }
                        })

                    }



                    )
                })

                $(document).on('click', '.kirmizicerceve', function () {



           


 
                    var id = $(this).attr("data-resimid");

                    $.ajax({

                        type: "POST",
                        url: "FotografSil.ashx?id=" + id + "",
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            Galeri();
                        }
                    })

                });
                
            });


        </script>


    </form>
</body>
</html>

