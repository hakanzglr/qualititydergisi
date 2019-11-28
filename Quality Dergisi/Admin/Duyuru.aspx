<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Duyuru.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        .new{

           height:100px;
            float:left;
            width:150px;
            text-align:center;
            line-height:100%;
             color:#fff;
            line-height:50px;
            border:1px solid black;
            margin-right:5px;
           
        }
           .new:hover{

               background:#17325c !important;

           }

    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="min-height:500px;" class="container-fluid">

   <h3>Duyuru</h3>
                        <textarea class="span11" runat="server" enableviewstate="false" id="duyuruhtml" style="width: 100%; height: 200px; background-color: white;" cols="5" rows="2"></textarea>

     <br /><br />

        <asp:Button runat="server" OnClick="guncelle_Click" ID="guncelle" Text="Güncelle" CssClass="btn btn-success" />



        <br /><br />
 <div>

 



 </div>
    
     </div>

       
  <script src="editor/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet" />
    <script src="js/summernoteEDiTED.js"></script>
        <link href="css/OzellestirilmisMODAL.css" rel="stylesheet" />
        <script src="js/matrix.js"></script>


    <script type='text/javascript'>  
        $(document).ready(function () {






             $("#duyuruli").addClass("active");
 
             $('#duyuruhtml').summernote({

                 height: 200,
                 tabsize: 5,
                 height: 500,

             });
            

             });


 
 
 


</script>
     


</asp:Content>


