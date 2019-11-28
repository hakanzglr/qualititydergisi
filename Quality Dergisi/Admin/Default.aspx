<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="min-height: 500px;" class="container-fluid">


        <div class="alert-danger">
            <h3>Adblock var ise kapatın</h3>
        </div>



        <h2>Toplam  Kayıt </h2>

        <div style="" id="sonuclar"></div>


        <div id="mansetlertanimlari">
            <h2>Haber Manşetleri</h2>
            <iframe style="width: 100%; height: 100vh; border: 0px;" src="manset.aspx"></iframe>


        </div>
    </div>



    <div style="display: none;" id="haberresim"></div>

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/matrix.js"></script>



    <script type='text/javascript'>








        $(document).ready(function () {

            $("#anasayfa").addClass("active");

            $.ajax({
                url: 'CHARTSToplamHaberler.ashx',
                contentType: 'POST',
                success: function (success) {

                    $("#sonuclar").html(success);
                },

            });


        });







    </script>



</asp:Content>
