<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Videolar.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  

    <style>

        #Datalist1{

            width:100% !important;
        }
        td{
            padding:5px !important;
            cursor:pointer;
        }
        .icon-pencil{

            cursor:pointer;
        }

        hr{


            border-top:1px solid #2255a4 !important;
        }
        .kelime {

            height:35px !important;
        }
        
        #plakalabel {

            color:#fff !important;

        }
        .detaycss{
            cursor:pointer;
        }
    </style>
     

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <div class="container-fluid"> 
    <h3 >Video Listesi</h3>

            

    <asp:TextBox runat="server" ID="kelime" CssClass="form-control kelime"></asp:TextBox>

    <asp:DropDownList runat="server" ID="kriter" CssClass="form-control">
        <asp:ListItem Value="*">İçinde</asp:ListItem>
        <asp:ListItem Value="b">Başında</asp:ListItem>
        <asp:ListItem Value="s">Sonunda</asp:ListItem>
    </asp:DropDownList>


    <asp:Button runat="server" CssClass="btn btn-success" OnClick="Unnamed_Click" Text="Ara" />

    <hr />
  <div style="display:inline-block;">
    
        <div style="font-size:14px!important;font-weight:600;" class="table-responsive table-hover">
<div class="col-md-2"> 
Video Resim
</div>
<div  class="col-md-1"> 
Kategori 
</div>        
<div class="col-md-3">
Başlık          
</div>

<div class="col-md-3">
Spot            
</div>
<div  class="col-md-2"> 
Hit 
</div>
<div  class="col-md-1"> 
# 
</div>
             
           </div>
      
     
    <asp:Literal runat="server" Mode="PassThrough" ID="icerik">



    </asp:Literal>
    


    </div>
       
       


 
      <asp:ScriptManager runat="server" ID="modalicin1"></asp:ScriptManager>

    <asp:UpdatePanel runat="server" UpdateMode="Always" ID="GuncelleUpdatePanel">
                    <ContentTemplate>
                        <div class="modal fade" id="bilgipenceresi"  tabindex="-1" style="opacity:!important;" role="dialog" aria-labelledby="popup" aria-hidden="true">
                            <div style="width: 100% !important; height: 100%;" class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><span id="plakalabel">Detay   
                                            <asp:Label ForeColor="White" runat="server" ID="SlaytId"></asp:Label>
                                        </span></h4>
                                    </div>
                                    <div class="modal-body">
                                        <iframe id="bilgisayfasi" src="#deneme"  style="width: 100%;height:100%; overflow: hidden; border: none;position:absolute;left:0;top:0;bottom:0;right:0;"></iframe>
                                        
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                       
                                        <button type="button"  class="btn btn-info kapatma" data-dismiss="modal">Kapat</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>


        </div>
<style type="text/css">

   
 
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

 
    </style>
  

     <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
          <link  href="bootstrap.css" rel="stylesheet"/>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet" />
        <script src="js/summernoteEDiTED.js"></script>

        <%--<script src="js/jquery.flot.min.js"></script> 
<script src="js/jquery.flot.resize.min.js"></script> --%>
        <script src="js/jquery.peity.min.js"></script>
        <script src="js/fullcalendar.min.js"></script>
        <script src="js/jquery.uniform.js"></script>
        <script src="js/matrix.js"></script>
        <%--<script src="js/matrix.dashboard.js"></script> --%>
        <script src="js/jquery.gritter.min.js"></script>
        <script src="js/matrix.interface.js"></script>
        <%--<script src="js/matrix.chat.js"></script> --%>
        <script src="js/jquery.validate.js"></script>
        <script src="js/matrix.form_validation.js"></script>
        <script src="js/select2.min.js"></script>
        <script src="js/matrix.popover.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/matrix.tables.js"></script>

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

                $("#videolistele").addClass("active");
                $("#videolar").addClass("open");

                $('#summernote').summernote({
                    height: 200,
                    tabsize: 5,
                    height: 500,

                    callbacks: {
                        onImageUpload: function (files) {
                            that = $(this);
                            for (var i = files.length - 1; i >= 0; i--) {
                                sendFile(files[0], that);


                            }
                        }
                    }

                });
                function sendFile(file, that) {


                    var formData = new FormData();
                    formData.append('file', $('input[type=file]')[0].files[0]);
                    $.ajax({
                        data: formData,
                        type: "POST",
                        url: "Upload.ashx",
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (url) {
                            console.log(url)

                            $(that).summernote('editor.insertImage', url)
                        }
                    })
                }


            });

        </script>
      
  <script type="text/javascript">
       

        $(document).ready(function () {

            $(".detaycss").click(function () {

                var haberid = $(this).attr("data-url");
                console.log(haberid);

                $('#bilgipenceresi').modal('show');
                $('#bilgipenceresi').addClass('in');
                $("#bilgisayfasi").attr("src", haberid)

            })

        });
    </script>
</asp:Content>
