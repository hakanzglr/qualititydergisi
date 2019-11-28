<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Quality_Dergisi.abone.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">


    <link href="https://v4-alpha.getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        sad {
            background-image: url('https://www.w3schools.com/css/searchicon.png'); /* Add a search icon to input */
            background-position: 10px 12px; /* Position the search icon */
            background-repeat: no-repeat; /* Do not repeat the icon image */
            width: 100%; /* Full-width */
            font-size: 16px; /* Increase font-size */
            padding: 12px 20px 12px 40px; /* Add some padding */
            border: 1px solid #ddd; /* Add a grey border */
            margin-bottom: 12px; /* Add some space below the input */
        }

        .aktif {
            background: Red;
        }

        tr {
            cursor: pointer;
        }

        .gizle {
            display: none;
            outline: 1px solid #0094ff;
            background: #0094ff;
            color: #fff !important;
        }

            .gizle:hover {
                outline: 1px solid #0094ff;
                background: #0094ff !important;
                color: #fff !important;
            }

        .secili {
            outline: 1px solid #0094ff;
        }

        .container {
            width: 100% !important;
        }
       
        .normalth{
            background:url('cifok.gif');
            background-position:right;
            background-repeat:no-repeat;

        }
        .aktifth{

             background:url('tekok.gif');
            background-position:right;
            background-repeat:no-repeat;
        }
        .modal-dialog{
            width:100% !important;
            max-width:100% !important;
        }
        .ara{
            color:#0275d8 !important;
        }
    </style>
</head>

<body >

    <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#">Abone Yönetimi</a>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <%--<li class="nav-item active">
                    <a class="nav-link" href="#">Müşteriler <span class="sr-only">(current)</span></a>
                </li>--%>
               <%-- <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>--%>
                
              <%--  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>--%>
            </ul>
            <form class="form-inline my-2 my-lg-0">

                <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Çıkış Yap</button>
            </form>
        </div>
    </nav>



    <div style="margin-top: 100px;" class="container">
        <!-- Example row of columns -->
        <div style="min-height:450px !important;" class="row">
            <form id="form1" style="width: 100%;" runat="server">
                <div class="row">
                    <div class="col-md-12 col-xs-12">

                        <div style="float: left;" class="col-md-3 col-xs-6">
                            <select id="filtretur" data-value="" class="form-control">
                                <option value="0">Başvuru No</option>
                                <option value="1">İsim</option>
                                <option value="4">TC</option>
                                <option value="3">E-posta</option>
                                <option value="2">Telefon</option>
                            </select><br />
                        </div>
                        <div style="float: left;" class="col-md-9 col-xs-6">
                            <input type="text" id="myInput" class="form-control" onkeyup="myFunction()" onfocus="Temizle()" placeholder="İsimde Ara">
                        </div>
                    </div>
                    <div style="display: inline-block" class="col-md-12 col-xs-12">
                        <div class='table-responsive'>

                            <table id='myTable' class='table  table-hover'>
                                <thead>
                                    <tr id="thbaslik">
                                        <th class="normalth">Abone No</th>
                                        <th class="normalth">İsim</th>
                                        <th class="normalth">Telefon</th>
                                        <th class="normalth">E-posta</th>
                                        <th class="normalth">TC.No</th>
                                        <th class="normalth">Durum-Detay</th>
                                    </tr>
                                </thead>


                                <asp:Literal runat="server" ID="musteriler">

                                </asp:Literal>


                            </table>
                            <div class="text-center">
     <asp:Button runat="server" ID="aktar" CssClass="btn btn-outline-primary" Text="Excel Olarak Kaydet" OnClick="aktar_Click" />

                        </div></div>
                    </div>
                </div>

            </form>
        </div>

        <hr>

        <footer>

            
            <p>&copy;  2018</p>
        </footer>
    </div>

    <div class="modal fade" id="musteri" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Müşteri Detay</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <iframe runat="server" id="musteridetay" src="DetayMusteri.aspx" style="width:100%;height:550px;border:0px;"></iframe>
                </div>
               
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>

    <script src="https://v4-alpha.getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <script>
        function myFunction() {

            var indeks = $("#filtretur").attr('data-value');

            if (indeks == "") {

                indeks = 0;

            }
            else {

                indeks = indeks;
            }


            var input, filter, table, tr, td, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            var t = parseInt(indeks);
            console.log(t);
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[indeks];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        $('.bilgi').dblclick(function () {

            
            //var id = $(this).attr("data-id");
            //$(".gizle").hide();
            //$("#" + id).show();

            //$("tr").removeClass("secili");

            //$(this).addClass("secili");
 

        });
        $('.ara').click(function () {
            var id = $(this).attr("data-id");


            $("#musteridetay").attr("src", "DetayMusteri.aspx?id=" + id);

            $("#musteri").modal("show");


        });

        $('#filtretur').change(function () {
            $("#filtretur").find('option').attr("selected", false);

            var filtre = $(this).find("option:selected").attr('value');
            $("#filtretur > option[value=" + filtre + "]").attr("selected", true);

          $(this).attr('data-value', filtre);

        
        });

        $('#musteri').on('hidden.bs.modal', function (e) {
            //alert("kapandı");
        })

        function Temizle() {


            document.getElementById('myInput').value = "";
            $("tr").show();
        }
        $('th').click(function () {
            
            $("#thbaslik").find("th").removeClass("aktifth");
            $("#thbaslik").find("th").addClass("normalth");

            $(this).removeClass("normalth");

            $(this).addClass("aktifth");

            var table = $(this).parents('table').eq(0)
            var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()))
            this.asc = !this.asc
            if (!this.asc) { rows = rows.reverse() }
            for (var i = 0; i < rows.length; i++) { table.append(rows[i]) }
        })
        function comparer(index) {
            return function (a, b) {
                var valA = getCellValue(a, index), valB = getCellValue(b, index)
                return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.toString().localeCompare(valB)
            }
        }
        function getCellValue(row, index) { return $(row).children('td').eq(index).text() }

    </script>
</body>
</html>