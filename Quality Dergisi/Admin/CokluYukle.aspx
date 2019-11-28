<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CokluYukle.aspx.cs" Inherits="Quality_Dergisi.Admin.CokluYukle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>

        .yuklenenresim{


            width:200px;
        }
         .yesilcerceve {

     padding:60px;
     border:1px solid #0f9f12;
     border-radius:4px;
     background:#fff;
     text-align:center;
  }
               .row {
    display: flex;
    flex-wrap: wrap;
    border-bottom:1px solid #0f9f12;
}
.row > [class*='col-'] {
    display: flex;
    flex-direction: column;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div><br /><br /><br />
        <input style="display:none;" type="text" id="galeriidtxt" runat="server" />
      <input type="file" id="coklutumresimsec" multiple="multiple" class="yesilcerceve" />

         <div id="resimyukledugmesi" style="cursor:pointer;" class="yesilcerceve" onClick="yukleresim()">Yükle</div>
        <div style="display:none;" id="yukleniyor">
            <img src="yukleme.gif" /></div>

          <div id="resimbasliklari" style="display:none;padding:10px; font-weight:600;border-bottom:1px solid #0f9f12;background:#0f9f12;color:#fff;margin-bottom:10px;position:fixed;top:0;width:100%;z-index:100;text-align:center;" class="row">
                <div class="col-md-4">Fotoğraf</div>
                <div class="col-md-4">Açıklaması</div>
                <div class="col-md-4">Sıra</div>


            </div>
         <div id="hamgelen"></div>


        <div class="yesilcerceve" style="display:none;" id="kaydet">Açıklamaları Kaydet</div>

    </div>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"/>
             <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
        <script>
    var counter;
    function yukleresim() {
        $("#coklutumresimsec").hide();
        $("#resimyukledugmesi").hide();
        $("#yukleniyor").show();
        var dosyalar = $("#coklutumresimsec")[0].files; 
        for (var i = 0; i < dosyalar.length ; i++) {
            var dosya = dosyalar[i]; 
            var formdata = new FormData();
            formdata.append('file', dosya);

           var id= $("#galeriidtxt").val(); 
           $.ajax({
               data: formdata,
               type: "POST",
               url: "GaleriDetayCokluResim.ashx?id=" + id + "&sira="+i,
               cache: false,
               contentType: false,
               processData: false,
               success: function (data) { 
                   $("#hamgelen").html($("#hamgelen").html() + data);

                   $(".resimaciklamasi:last-child").focus();
                   $("#kaydet").show();
                   $("#yukleniyor").hide();
                   $("#resimbasliklari").show();
               }
           })
        }
    }

 
    $(document).ready(function () {

        $("#kaydet").click(function () {

            $('.resimaciklamasi').each(function () {

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
                    }
                })

            }



        )
        })

    });
 
 
    
</script>

         


    </form>
</body>
</html>
