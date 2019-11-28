<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReklamSec.aspx.cs" Inherits="Quality_Dergisi.Admin.ReklamSec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

         .minyukseklik{

             min-height:500px !important;
         }

        .table th, .table td{

            border:0px !important;

        }
        .altcizgi {

            border-bottom:1px solid #b5e288 !important;
            width:100% !important;
            padding-top:10px;
            padding-bottom:10px;
           

        }
        .turad{

            color:white;


        }
        .table-responsive{
            width:100%;

        }
        .duzenlelink:hover{
            text-decoration:none !important;
            color:red;

        }
        
 
.fade.in{    top: 0 !important;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  width:100% !important;
  margin:0 auto !important;
 

}

.modal-dialog {
   margin: 0;
  width: 100%;
  height: 100%;
  padding: 0;
}

.modal-content {
      position: absolute;

   top: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  left: 0!important;
  border: 2px solid #3c7dcf;
  border-radius: 0;
  box-shadow: none;
}

.modal-header {
      position: absolute;

   top: 0;
  right: 0;
  left: 0;
  height: 50px;
  padding: 10px;
  background: #6598d9;
  border: 0;
}
 
.modal-body {
  position: absolute;
  top: 50px;
  bottom: 60px;
  width: 100%;
  font-weight: 300;
  overflow: auto;
  max-height:100% !important;
}

.modal-footer {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  height: 60px;
  padding: 10px;
  background: #f1f3f5;
}



  #idaktif{
      display:none;
         }

        .form-control{

            border:1px solid #80bdff !important;

        }
         .card-header.note-toolbar>.btn-group{


             margin-right:30px !important;
         }
       .kategori{

           padding:10px;
           color:#fff !important;
           text-align:center;
       }
       

.switch label .lever, .switch label .lever:after {
    content: "";
    display: inline-block;
}

.switch, .switch * {
    user-select: none;
}

    .switch label {
        cursor: pointer;
    }

        .switch label input[type=checkbox] {
            opacity: 0;
            width: 0;
            height: 0;
            margin: 0;
        }

        .switch label .lever {
            position: relative;
            width: 40px;
            height: 15px;
            background-color: #e0e0e0;
            border-radius: 15px;
            -webkit-transition: background .3s ease;
            -o-transition: background .3s ease;
            transition: background .3s ease;
            vertical-align: middle;
            margin: 0 16px;
        }

            .switch label .lever:after {
                position: absolute;
                width: 25px;
                height: 25px;
                background-color: #FFF;
                border-radius: 21px;
                -webkit-box-shadow: 0 1px 1px 1px rgba(0,0,0,.2);
                box-shadow: 0 1px 1px 1px rgba(0,0,0,.2);
                left: -5px;
                top: -5px;
                -webkit-transition: left .3s ease,background .3s ease,box-shadow .1s ease;
                -o-transition: left .3s ease,background .3s ease,box-shadow .1s ease;
                transition: left .3s ease,background .3s ease,box-shadow .1s ease;
            }

.timeline > li:after, .timeline > li:before {
    display: table;
    content: " ";
}

input[type=checkbox]:checked:not(:disabled) ~ .lever:active:after {
    -webkit-box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(233,30,99,.1);
    box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(233,30,99,.1);
}

input[type=checkbox]:not(:disabled) ~ .lever:active:after {
    -webkit-box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(0,0,0,.08);
    box-shadow: 0 1px 3px 1px rgba(0,0,0,.4),0 0 0 15px rgba(0,0,0,.08);
}

.switch label input[type=checkbox]:checked + .lever:after {
    left: 24px;
}

.switch input[type=checkbox][disabled] + .lever {
    cursor: default;
}

.switch label input[type=checkbox][disabled] + .lever:after, .switch label input[type=checkbox][disabled]:checked + .lever:after {
    background-color: transparent;
}
.switch label input[type=checkbox]:checked + .lever {

     background-color: #80bdff !important;

}

.note-editor .note-dropzone { opacity: 0 !important; }

#resimdiv{

    width:100px;
}
 .genisle{

     width:100%;

 }


 .tamekran{

     left:0px;
     top:0px;
     bottom:0px;
     position:fixed;
     right:0px;
     width:100%;
     height:100%;
     background:white;
     z-index:999999;
     display:table-caption;
     text-align:center;
     

 }
 .tamekran > img{
     position:absolute;
     top:50%;

 }



 
    </style>
</head>
<body>
    <form id="form1" runat="server">
   

 

    
    <asp:DataList ID="DataList1" runat="server"   cellspacing="0" Width="100%" CssClass="table-striped">
       

        <HeaderTemplate><div class="row">
               <div class="col-md-2">
                Başlık

            </div>
            <div class="col-md-5">
                Adres

            </div>
         
            <div class="col-md-5">

                Resim
            </div></div>
        </HeaderTemplate>




        <ItemTemplate>
           <div style="line-height:70px" class="row">
               <div class="col-md-2">
                                        <%# DataBinder.Eval(Container.DataItem, "baslik") %>


            </div>
            <div class="col-md-5">
                 <%# DataBinder.Eval(Container.DataItem, "adres") %>

            </div>
         
            <div class="col-md-5">

                            <img width="100%" src='../<%# DataBinder.Eval(Container.DataItem, "resim") %>' />

            </div></div>

          
            

 
                  
              
        </ItemTemplate>



    </asp:DataList>









    
    <input type="text" id="idaktif" value="0" placeholder="sadadasdasdas" />
  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"/>
             <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>


    <script type="text/javascript">

          $(document).ready(function () {
            

            

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
                    url: "KategoriAnasayfaDegistir.ashx",
                    type: "POST",
                    data: { "veri": id },
                    success: function (result) {

 
                         var cekboxid = "C" + result.substring(0, 2);
                        var islemeid = "#R" + cekboxid;
                         var inputit = "#" + $("#idaktif").val()
                         $(inputit).toggle();
                         ResimKapat();
                     },
                    error: function (err) {
                        alert(err.statusText);
                    }
                }); }

            function ResimKapat() {
                 var imajid=   $("#idaktif").val();
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
          
        });
        </script>
    </form>
</body>
</html>

