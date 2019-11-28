<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Yoneticiler.aspx.cs" Inherits="Quality_Dergisi.Admin.Yoneticiler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <h3>Yöneticiler</h3>
        <hr />
        <hr />


        <asp:DataList Width="100%" ID="DataListYazar" runat="server" CssClass="table-responsive">

            <HeaderTemplate>
                <div style="font-size: 14px!important; font-weight: 600; margin-left: 10px !important; text-align: left !important" class="row text-left">

                    <div class="col-md-3">Username</div>
                    <div class="col-md-3">Auth</div>
                    <div class="col-md-2">Aktif mi?</div>
                    <div class="col-md-1">#</div>
                    <div class="col-md-1">#</div>

                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div style="margin-left: 10px !important;" class="table table-striped row altcizgi">
                    <div class="col-md-3"><%# DataBinder.Eval(Container.DataItem, "adm_username") %></div>
                    <div class="col-md-3"><%# DataBinder.Eval(Container.DataItem, "adm_auth") %></div>
                    <div class="col-md-2"><%# DataBinder.Eval(Container.DataItem, "adm_akt").ToString() == "1" ? "aktif" : "pasif" %></div>
                    <div class="col-md-1">
                        <div class="duzenlelink">
                            <a href="YoneticiDetayDuzenle.aspx?adm_id=<%# DataBinder.Eval(Container.DataItem, "adm_id") %>"><i data-url="YazarDetayDuzenle.aspx?yazar_id=<%# DataBinder.Eval(Container.DataItem, "adm_id") %>" class="icon-pencil"></i></a>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="duzenlelink">
                            <a class="Sil" name="<%# DataBinder.Eval(Container.DataItem, "adm_id") %>"><i class="icon-trash"></i></a>
                        </div>
                    </div>

                </div>
            </ItemTemplate>



        </asp:DataList>
        <div class="clearfix"></div>
   
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            $(".Sil").click(function () {

                if (confirm("Yazarı silmek istediğinizden emin misiniz?")) {
                    var ID = $(this).attr('name');
                    //Tıklanan ilgili linkin name özelliğindeki ID değerini çekiyoruz.
                    $.ajax({
                        url: "YoneticiSil.ashx/adm_id=" + ID,//Ajax ile tetiklenecek ilgili adresi belirliyoruz.
                        type: "POST",
                        data: { "veri": ID },
                        success: function (result) {

                            window.location = "Yoneticiler.aspx";

                        }
                    });
                }
            });

        });
     





    </script>
</asp:Content>
