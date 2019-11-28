<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetayMusteri.aspx.cs" Inherits="Quality_Dergisi.abone.DetayMusteri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://v4-alpha.getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .col-form-label {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-12 col-xs-12">


            <div class="form-group row">
                <span class="col-sm-2 col-form-label">Abonelik</span>
                <div class="col-sm-10">

                    <div id="abonelik" runat="server" class="btn btn-outline-success">
                        Aboneliği Aktif Yap
                    </div>
                    <div class="btn btn-outline-info" runat="server" id="baslangic"></div>
                   

                </div>
            </div>


            <div class="form-group row">
                <span class="col-sm-2 col-form-label">Abone No</span>
                <div class="col-sm-10">
                    <span runat="server" id="aboneid"></span>
                </div>
            </div>


            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Müşteri Adı</label>
                <div class="col-sm-10">
                    <input type="text" runat="server" class="form-control" id="mad" placeholder="Müşteri Adı" />
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Tc No</label>
                <div class="col-sm-10">
                    <input type="text" runat="server" class="form-control" id="mtc" placeholder="Tc" />
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">E-posta</label>
                <div class="col-sm-10">
                    <input type="text" runat="server" class="form-control" id="eposta" placeholder="Tc" />
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Firma İse </label>
                <div class="col-sm-10">
                    <input type="text" runat="server" class="form-control" id="fadi" placeholder="Firma ise Firma adı burada yer alır" />
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Başvuru Tarihi</label>
                <div class="col-sm-10">
                    <input type="text" disabled="disabled" runat="server" class="form-control" id="mbasvuru" placeholder="Başvuru Tarihi" />
                </div>
            </div>
            <h4>Teslimat</h4>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Teslimat Adresi</label>
                <div class="col-sm-10">
                    <textarea type="text" runat="server" class="form-control" id="tadres" placeholder="Teslimat Adres" />
                </div>
            </div>

            <h4>Fatura</h4>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Fatura Adresi</label>
                <div class="col-sm-10">
                    <textarea type="text" runat="server" class="form-control" id="fadres" placeholder="Teslimat Adres" />
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://v4-alpha.getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#abonelik').click(function () {



                if (confirm("Abonelik Başlayacak Emin misiniz?")) {

                    $.ajax({
                        url: "AbonelikAktif.ashx?id=" + $("#aboneid").html(), success: function (result) {
                            alert("Güncellendi");
                        }
                    });

                }
                else {
                    return false;
                }
            })
        });

    </script>

</body>
</html>
