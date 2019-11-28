<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ara.aspx.cs" Inherits="Quality_Dergisi.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quality Dergisi - Sosyete Dergisi</title>
    <style>
        .konufiltre {
            margin: 0 auto;
            list-style: none;
            display: inline-block;
        }

            .konufiltre input {
                float: left;
                margin-right: 10px;
                padding: 10px;
                text-align: center;
                border: 1px solid #f15232;
                color: #000;
                cursor: pointer;
                border-radius: 4px;
                background: #f8f8f8;
            }

            .konufiltre li:hover {
                background: #f15232;
                color: #fff;
            }


        #webaramasonucsayfasi {
            background: #f15232;
            padding: 10px;
            text-align: center;
            color: #fff;
            cursor: pointer;
        }

        .konufiltre input.active {
            background: #f15232;
            color: #fff;
            font-weight: 600;
        }

        .videoadres > iframe {
            width: 450px !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="icerikplc" runat="Server">
    <div class="main-content">
        <div style="margin-top: 0px; padding-top: 0px" class="section post-section">
            <div class="row">
                <div style="overflow: hidden;" class="content">
                    <div class="pst-block">
                        <div class="pst-block-main">
                            <div class="post-content">
                                <div class="search-pane">

                                    <div class="search-form-1">
                                        <div class="src-form">
                                            <div class="src-input">
                                                <span class="src-icon"><i class="li_search"></i></span>
                                                <input type="text" runat="server" id="webkelimesonucsayfasi" placeholder="Arama" />
                                            </div>
                                            <div class="src-btn">
                                                <span id="webaramasonucsayfasi">Arama</span>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div style="text-align: center;">
                                        <ul class="konufiltre">
                                            <asp:Button runat="server" OnClick="icerikbtn_Click" ID="icerikbtn" CssClass="active" Text="İçerik" />

                                            <asp:Button runat="server" OnClick="galeribtn_Click" ID="galeribtn" Text="Galeri" />
                                            <asp:Button runat="server" OnClick="videobtn_Click" ID="videobtn" Text="Video" />
                                            <asp:Button runat="server" OnClick="yazarlarbtn_Click" ID="yazarlarbtn" Text="Yazarlar" />
                                        </ul>
                                    </div>

                                </div>





                                <span style="float: left; display: block;">Arama Sonuçları  </span>
                                <br />
                                <h2 id="haberbaslik" runat="server" class="title-21"></h2>


                                <div style="text-align: left;" id="haber">

                                    <div runat="server" id="videosection"></div>





                                    <asp:Literal runat="server" ID="icerik" Mode="PassThrough">




                                    </asp:Literal>
                                </div>




                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </div>

    </div>
    <script type='text/javascript' src='<%= ResolveUrl("~/vendor/jquery/dist/jquery.js") %>'></script>


    <script type="text/javascript">

        $(document).ready(function () {

            $('#icerikplc_webkelimesonucsayfasi').bind("enterKey", function (e) {
                var aramakelimesi = $("#icerikplc_webkelimesonucsayfasi").val();

                window.location = "../../ara/" + aramakelimesi;
            });
            $('#icerikplc_webkelimesonucsayfasi').keyup(function (e) {
                if (e.keyCode == 13) {

                    var aramakelimesi = $("#icerikplc_webkelimesonucsayfasi").val();

                    window.location = "../../ara/" + aramakelimesi;
                }
            });



            $("#webaramasonucsayfasi").click(function () {

                var aramakelimesi = $("#icerikplc_webkelimesonucsayfasi").val();

                window.location = "../../ara/" + aramakelimesi;

            });
        });
    </script>


</asp:Content>