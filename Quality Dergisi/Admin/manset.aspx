<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manset.aspx.cs" Inherits="Quality_Dergisi.Admin.manset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .new {
            height: 100px;
            float: left;
            width: 150px;
            text-align: center;
            line-height: 100%;
            color: #fff;
            line-height: 50px;
            border: 1px solid black;
            margin-right: 5px;
        }

            .new:hover {
                background: #17325c !important;
            }

        .haberresimhavada {
            width: 300px;
            height: 300px;
            z-index: 900;
            position: fixed;
            top: 10%;
            left: 50%;
            display: block;
        }

        .haberresimm {
            cursor: pointer;
            width: 200px;
        }

        .bekleyinyukleniyor {
            z-index: 999;
            background: #fff;
            left: 0px;
            right: 0px;
            top: 0px;
            bottom: 0px;
            width: 100%;
            height: 100%;
            position: fixed;
            text-align: center;
            line-height: 100vh;
            display: block;
        }

      
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="mansetlertanimlari">
            <div style="display:none;"  id="bekleyinn">
                <img src="../bigLoader.gif" />
            </div>
            <div class="col-md-12">
                <div class="col-md-3">
                    <h3>Haber 1</h3>
                    <asp:ListBox ID="Haberlist1" DataTextField="spot" DataMember="id" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>
                </div>
                <div class="col-md-3">
                    <h3>Haber 2</h3>

                    <asp:ListBox ID="Haberlist2" DataTextField="spot" DataMember="id" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>
                </div>
                <div class="col-md-3">
                    <h3>Haber 3</h3>

                    <asp:ListBox ID="Haberlist3" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                    <h3>Haber 4</h3>

                    <asp:ListBox ID="Haberlist4" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                    <h3>Haber 5</h3>

                    <asp:ListBox ID="Haberlist5" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                    <h3>Haber 6</h3>

                    <asp:ListBox ID="Haberlist6" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                    <h3>Haber 7</h3>

                    <asp:ListBox ID="Haberlist7" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                    <h3>Haber 8</h3>

                    <asp:ListBox ID="Haberlist8" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                    <h3>Haber 9</h3>

                    <asp:ListBox ID="Haberlist9" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                    <h3>Haber 10</h3>

                    <asp:ListBox ID="Haberlist10" Width="100%" Height="150px" runat="server"></asp:ListBox>

                    <div class="onizleme"></div>

                </div>
                <div class="col-md-3">
                </div>
            </div>
            <br />
            <br />
            <br />
        </div>

        <div class="clearfix">
        </div>
        <div class="text-center">
            <div id="guncelle" style="display: none;" class="btn btn-success">Güncelle</div>
        </div>


        <div style="display: none;" id="haberresim"></div>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.ui.custom.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/fullcalendar.min.js"></script>
        <script src="js/matrix.js"></script>
        <script src="MansetlerHaberler.ashx"></script>



        <script type='text/javascript'>








            $(document).ready(function () {



                $("select option").on("click", function () {
                    var haberid = $(this).attr("value");

                    var parent = $(this).parents('select')[0];
                    $(parent).attr("data-id", haberid);
                    var basilacakdiv = $(parent).attr("id");
                    HaberGetir(haberid, basilacakdiv);

                })
                $("select option").dblclick(function () {
                    var haberid = $(this).attr("value");

                    var parent = $(this).parents('select')[0];
                    $(parent).slideUp();
                    $(parent).attr("data-id", haberid);

                });

                $(document).on('click', '.haberresimm', function () {

                    var resim = $(this).attr("data-name");
                    $(resim).slideToggle();
                    $("select").css("overflow", "scroll");
                })

                setTimeout(function () {



                    for (var i = 1; i < 11; i++) {

                        var list = "Haberlist" + i
                        var bir = MansetlerHaberler[list];

                        var divv = "#" + list
                        var option = $(divv + ' option[value="' + bir + '"]');
                        option.attr("selected", true);
                        ResimGetir(bir, divv);


                        $(divv).attr('data-id', bir);


                    }
                    $("#guncelle").show();
                }, 1000)


                function ResimGetir(haberid, divv) {
                    $.ajax({
                        url: 'HaberResmiGetir.ashx?id=' + haberid,
                        contentType: 'POST',
                        success: function (success) {
                            $(divv).next(".onizleme").html(success);
                            var resim = $(divv).next(".onizleme");
                            $(resim).children("img").attr("data-name", divv);
                        },

                    });

                }


                function HaberGetir(haberid, basilacakdiv) {
                    $.ajax({
                        url: 'HaberResmiGetir.ashx?id=' + haberid,
                        contentType: 'POST',
                        success: function (success) {
                            var yerdiv = "#" + basilacakdiv;
                            $(yerdiv).next(".onizleme").html(success);
                            var resim = $(yerdiv).next(".onizleme");
                            $(resim).children("img").attr("data-name", yerdiv);
                        },

                    });

                }



                $("#guncelle").on("click", function () {
                    $("#bekleyinn").show();
                     $("#bekleyinn").addClass("bekleyinyukleniyor");
                    for (var i = 1; i < 11; i++) {

                        var list = "#Haberlist" + i
                        var haberid = $(list).attr("data-id");
                        console.log(haberid);
                        $.ajax({
                            url: 'MansetGuncelle.ashx?id=' + i + '&haberid=' + haberid,
                            contentType: 'POST',
                            success: function (success) {

                            },

                        });

                    }
                    $("#bekleyinn").removeClass("bekleyinyukleniyor");
                    $("#bekleyinn").hide();

                });


            });







        </script>
    </form>
</body>
</html>
