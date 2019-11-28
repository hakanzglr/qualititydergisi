<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Yazarlar.aspx.cs" Inherits="Quality_Dergisi.Admin.Yazarlar" %>

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
      <h3>Yazarlar</h3> 
      <hr />
    
     <div>
       <asp:TextBox runat="server" ID="kelime" CssClass="form-control kelime" ></asp:TextBox>
       <asp:DropDownList runat="server" ID="kriter" CssClass="form-control">
           <asp:ListItem Value="*" >İçinde</asp:ListItem>
           <asp:ListItem Value="b" >Başında</asp:ListItem>
           <asp:ListItem Value="s">Sonunda</asp:ListItem>
       </asp:DropDownList>
       <asp:Button runat="server" CssClass="btn btn-success" OnClick="Unnamed_Click" Text="Ara" style="margin-bottom:11px"/>

     </div>
       <hr />

        <asp:DataList Width="100%" ID="DataListYazar" runat="server" CssClass="table-responsive" >

            <HeaderTemplate>
                <div style="font-size: 14px!important; font-weight: 600; margin-left: 10px !important; text-align: left !important" class="row text-left">
                 
                    <div class="col-md-1">kullanici_ad</div>
                    <div class="col-md-1">kullanici_sifre</div>
                 
                    <div class="col-md-1">ad</div>
                    <div class="col-md-1">unvan</div>
                    <div class="col-md-1">resim</div>
                    <div class="col-md-1">bolum_ad</div>
                    <div class="col-md-1">email</div>
                    <div class="col-md-1">bolum</div>
                    <div class="col-md-1">ord</div>
                    <div class="col-md-1">#</div>
                    <div class="col-md-1">#</div>
                    
                    </div>
            </HeaderTemplate>
            <ItemTemplate>
             <div style="margin-left: 10px !important;" class="table table-striped row altcizgi">
                <div class="col-md-1"><%# DataBinder.Eval(Container.DataItem, "kullanici_ad") %></div>
                <div class="col-md-1"><%# DataBinder.Eval(Container.DataItem, "kullanici_sifre") %></div>
                
                <div class="col-md-1"><%# DataBinder.Eval(Container.DataItem, "ad") %></div>
                <div class="col-md-1"><%# DataBinder.Eval(Container.DataItem, "unvan") %></div>
                <div class="col-md-1"><img src='../Admin/img/galeri/thumbnail/<%# DataBinder.Eval(Container.DataItem, "resim") %>' style="width: 100px;" /></div>
                <div class="col-md-1"><%# DataBinder.Eval(Container.DataItem, "bolum_ad") %></div>
                <div class="col-md-1"><%# DataBinder.Eval(Container.DataItem, "email") %></div>
                <div class="col-md-1"><%# DataBinder.Eval(Container.DataItem, "bolum") %></div>
                <div class="col-md-1 " ><input type="text" class="sira col-xs-4" data-id="<%#Eval("yazar_id").ToString() %>" id='Sira<%# DataBinder.Eval(Container.DataItem,"ord") %>' value='<%# DataBinder.Eval(Container.DataItem,"ord") %>' /></div>
                <div class="col-md-1">
                    <div class="duzenlelink">
                        <a href="YazarDetayDuzenle.aspx?yazar_id=<%# DataBinder.Eval(Container.DataItem, "yazar_id") %>"> <i data-url="YazarDetayDuzenle.aspx?yazar_id=<%# DataBinder.Eval(Container.DataItem, "yazar_id") %>" class="icon-pencil"></i></a>
                    </div>
                </div>
                    <div class="col-md-1">
                    <div class="duzenlelink">
                        <a class="Sil" name="<%# DataBinder.Eval(Container.DataItem, "yazar_id") %>"><i  class="icon-trash"></i></a>
                    </div>
                </div>
               
            </div>
            </ItemTemplate>

         
            
        </asp:DataList>
     <div class="clearfix"></div>
         <div style="font-size: 14px!important; font-weight: 600; margin-left: 10px !important; text-align: left !important" class="row text-left">
                 
                    <div class="col-md-1"></div>
                    <div class="col-md-1"></div>
                    
                    <div class="col-md-1"></div>
                    <div class="col-md-1"></div>
                    <div class="col-md-1"></div>
                    <div class="col-md-1"></div>
                    <div class="col-md-1"></div>
                    <div class="col-md-1"> <div style="margin-right:100px;"><p id="siraguncelle" class="btn btn-success">Güncelle</p></div></div>
                    <div class="col-md-1"></div>
                    <div class="col-md-1"></div>
                    
                    </div>
         
     </div>
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
    <script type="text/javascript">
       
    $(document).ready(function () {
        $(".Sil").click(function () {
           
            if (confirm("Yazarı silmek istediğinizden emin misiniz?")) {
                var ID = $(this).attr('name');
                //Tıklanan ilgili linkin name özelliğindeki ID değerini çekiyoruz.
                $.ajax({
                    url: "YazarSil.ashx/yazar_id=" + ID,//Ajax ile tetiklenecek ilgili adresi belirliyoruz.
                    type: "POST",
                      data: { "veri": ID },
                    success: function (result) {

                        window.location = "Yazarlar.aspx";

                    }
                });
            }
        });

    });
    $('#siraguncelle').click(function () {
                var soncocuk = $('.sira:last-child').attr("data-id");


                $('.sira').each(function () {
                    var id = $(this).attr("data-id");
                    var sira = $(this).val();


                    $.ajax({
                        url: "yazarSiraDegistir.ashx",
                        type: "POST",
                        data: { "yazar_id": id, "ord": sira },
                        success: function (result) {

                            if (result == soncocuk) {

                                window.location = "Yazarlar.aspx";

                            }


                        },
                        error: function (err) {
                            alert(err.statusText);
                        }
                    });



                });

    });
    




</script>

</asp:Content>


