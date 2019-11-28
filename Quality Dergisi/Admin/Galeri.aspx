<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Galeri.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
    <link href="css/galeri.aspx..css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="bootstrap.css" rel="stylesheet" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
 
   
      <script src="js/jquery.uniform.js"></script>
    <script src="js/matrix.js"></script>
     <script src="js/jquery.gritter.min.js"></script>
    <script src="js/matrix.interface.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">

    <h3>Galeri Listesi</h3>



    <asp:TextBox runat="server" ID="kelime" CssClass="form-control kelime"></asp:TextBox>

    <asp:DropDownList runat="server" ID="kriter" CssClass="form-control">
        <asp:ListItem Value="*">İçinde</asp:ListItem>
        <asp:ListItem Value="b">Başında</asp:ListItem>
        <asp:ListItem Value="s">Sonunda</asp:ListItem>
    </asp:DropDownList>


    <asp:Button runat="server" CssClass="btn btn-success" OnClick="Unnamed_Click" Text="Ara" />

    <hr />

    <asp:DataList Width="100%" ID="DataList1" runat="server" CssClass="table-responsive">
        <HeaderTemplate>
            <div style="font-size: 14px!important; font-weight: 600; margin-left: 10px !important; text-align: left !important" class="row text-left">
                <div class="col-md-2">
                    Galeri Başlığı
                </div>
                <div class="col-md-2">
                    Kategori


                </div>
                <div class="col-md-2">

                    Durum
                </div>

                 
                <div class="col-md-2">
                    Resim

                </div>
                <div class="col-md-1">
                    Hit


                </div>
                <div class="col-md-1">
                    #


                </div>
                     <div class="col-md-1">
                   Galeri Resimleri

                </div>
                <div class="col-md-1" >
                    Resim Ekle
                </div>
            </div>



        </HeaderTemplate>




        <ItemTemplate>

            <div style="margin-left: 10px !important;" class="table table-striped row altcizgi">

                <div class="col-md-2">


                    <%# DataBinder.Eval(Container.DataItem, "ad") %>
                </div>
                <div class="col-md-2">

                    <%# DataBinder.Eval(Container.DataItem, "tur_ad") %>
                </div>
                <div class="col-md-2">

                    <div id="DC<%#Eval("ID").ToString() %>" style="" class="switch">
<label style="padding-left:0px !important;">
<input  id="C<%#Eval("ID").ToString() %>"  type='checkbox'   <%# !bool.Parse(Eval("aktif").ToString())  ? "  > <span class='lever'>" : " checked='checked'><span class='lever'> " %> </label>

</div>    <img id="RC<%#Eval("ID").ToString()%>"  style="display:none;"  src="yukleme.gif" />

                </div>
                 
                <div class="col-md-2">

                    <img src='../img/galeri/thumbnail/<%# DataBinder.Eval(Container.DataItem, "resim") %>' style="width: 100px;" />


                </div>
                <div class="col-md-1">

                    <%# DataBinder.Eval(Container.DataItem, "hit") %>
                </div>
                <div style="font-size: 20px;" class="col-md-1">
                    <div class="duzenlelink">
                        <i data-url="GaleriDetayDuzenle.aspx?Hid=<%# DataBinder.Eval(Container.DataItem, "id") %>&Kategori=<%# DataBinder.Eval(Container.DataItem, "kategoriID") %>" class="icon-pencil"></i>
                     <a class="Sil" name="<%# DataBinder.Eval(Container.DataItem, "ID") %>"><i  class="icon-trash"></i></a>
                    </div>

                </div>
                <div class="col-md-1">
                    <div class="duzenlegaleri">
                        <i class="icon-picture" data-url="MevcutfotografGuncelle.aspx?galeriID=<%# DataBinder.Eval(Container.DataItem, "id") %>&Kategori=<%# DataBinder.Eval(Container.DataItem, "kategoriID") %>"></i>
                    </div>
                </div>
                     <div class="col-md-1" >

                         <span data-url="CokluYukle.aspx?galeriid=<%# DataBinder.Eval(Container.DataItem, "id") %>" class="resimekle">
                    Resim Ekle
                         </span>

                </div>
            </div>

        </ItemTemplate>

    

    </asp:DataList>
    <div class="clearfix"></div>


 
            <div class="modal fade" id="bilgipenceresi" tabindex="-1" style="opacity: !important;" role="dialog" aria-labelledby="popup" aria-hidden="true">
                <div style="width: 100% !important; height: 100%;" class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><span id="plakalabel">Detay   
                                            <asp:Label ForeColor="White" runat="server" ID="SlaytId"></asp:Label>
                            </span></h4>
                        </div>
                        <div class="modal-body">
                            <iframe id="bilgisayfasi" src="#deneme" style="width: 100%; height: 100%; overflow: hidden; border: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0;"></iframe>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-info kapatma" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
          
     </div>

 <input type="text" id="idaktif" />

    <script type="text/javascript">
        // This function is called from the pop-up menus to transfer to
        // a different page. Ignore if the value returned is a null string:
        function goPage(newURL) {

            // if url is empty, skip the menu dividers and reset the menu selection to default
            if (newURL != "") {

                // if url is "-", it is this page -- reset the menu:
                if (newURL == "-") {
                    resetMenu();
                }
                // else, send page to designated URL            
                else {
                    document.location.href = newURL;
                }
            }
        }

        // resets the menu selection upon entry to this page:
        function resetMenu() {
            document.gomenu.selector.selectedIndex = 2;
        }
    </script>

    

    <script type="text/javascript">


        $(document).ready(function () {


              $(".Sil").click(function () {
           
            if (confirm("Silmek istediğinizden emin misiniz?")) {
                var ID = $(this).attr('name');
                //Tıklanan ilgili linkin name özelliğindeki ID değerini çekiyoruz.
                $.ajax({
                    url: "GaleriSil.ashx/ID=" + ID,//Ajax ile tetiklenecek ilgili adresi belirliyoruz.
                    type: "POST",
                      data: { "veri": ID },
                    success: function (result) {

                        window.location = "Galeri.aspx";

                    }
                });
            }
        });



            $("#galerilistele").addClass("active");
            $("#galeriler").addClass("open");

            $(".icon-pencil").click(function () {

                var haberid = $(this).attr("data-url");
                console.log(haberid);

                $('#bilgipenceresi').modal('show');
                $('#bilgipenceresi').addClass('in');
                $("#bilgisayfasi").attr("src", haberid)

            })
            $(".icon-picture").click(function () {

                var haberid = $(this).attr("data-url");


                $('#bilgipenceresi').modal('show');
                $('#bilgipenceresi').addClass('in');
                $("#bilgisayfasi").attr("src", haberid)

            })
            $(".resimekle").click(function () {

                var haberid = $(this).attr("data-url");


                $('#bilgipenceresi').modal('show');
                $('#bilgipenceresi').addClass('in');
                $("#bilgisayfasi").attr("src", haberid)

            })



            $('input[type=checkbox]').click(function () {
                var progress = setInterval(function () { var $bar = $('#bar3'); if ($bar.width() >= 1000) { clearInterval(progress); $('#bar3').css('width', 0 + '% '); } else { $bar.width($bar.width() + 350); } }, 100);
                var Checkbxid = jQuery(this).attr("id");
                $("#idaktif").val(Checkbxid);
                Dd(Checkbxid.substring(1));
                var ckbxkpt = "#D" + Checkbxid;
                $(ckbxkpt).css("display", "none");
                var resimid = "#R" + Checkbxid;

                $(resimid).css("display", "block");
            });
            function Dd(id) {
                $.ajax({
                    url: "GaleriDurumDegistir.ashx",
                    type: "POST",
                    data: { "veri": id },
                    success: function (result) {
                        var cekboxid = "C" + result.substring(0, 2);
                        var islemeid = "#R" + cekboxid;
                        var inputit = "#" + $("#idaktif").val()

                        $(inputit).toggle();

                        setTimeout(ResimKapat, 500)
                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            }

            function ResimKapat() {
                var imajid = $("#idaktif").val();
                var resimid = "#R" + imajid;
                $(resimid).css("display", "none");
                var inputit = "#D" + $("#idaktif").val();
                $(inputit).toggle();
            }

            $(".kapatma").click(function () {

                yenile2();
                return false;

            });

            function yenile2() {
                parent.document.getElementById("yenile").click();


            }


            $('#bilgipenceresi').on('hidden.bs.modal', function (e) {
                location.reload();


            });
        });
    </script>
</asp:Content>


