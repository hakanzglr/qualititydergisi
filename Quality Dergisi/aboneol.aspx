<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboneol.aspx.cs" Inherits="Quality_Dergisi.aboneol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div style="color: #e4322b; font-size: 24px; font-weight: 600; width: 100%; text-align: center;">
                <img width="235" height="58" src="img/logo01.PNG" /><br />
                ABONELİK FORMU
            </div>

            <div style="background: #fd3a13; border-bottom: 5px solid #bfa6a6" class="pst-block-head">
                <h3 style="color: #fff !important;"><strong>Kişisel Bilgiler</strong></h3>

                <div class="all-sb"></div>
            </div>
            <div class="col-md-6">
                <br />
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="inputSuccess">Ad Soyad</label>
                        <div class="col-xs-9">
                            <input type="text" id="ad" class="form-control" placeholder=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="inputWarning">T.C Kimlik No</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="tcno" placeholder="T.C Kimlik No zorunludur" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Email</label>
                        <div class="col-xs-9">
                            <input type="email" id="mail" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Firma Adı</label>
                        <div class="col-xs-9">
                            <input type="email" id="fad" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Telefon No</label>
                        <div class="col-xs-9">
                            <input type="email" id="tel" class="form-control" placeholder="" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">

                <br />
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Dergi Teslimat Adresi</label>
                        <div class="col-xs-9">
                            <textarea id="teslimatadres" style="height: 80px;" class="form-control" placeholder="Açık Adres"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Posta Kodu</label>
                        <div class="col-xs-9">
                            <input id="tpk" type="text" class="form-control" placeholder="Posta Kodu" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Şehir</label>
                        <div class="col-xs-9">

                            <input id="til" type="text" class="form-control" placeholder="İl" />

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Semt</label>
                        <div class="col-xs-9">

                            <input id="tilce" type="text" class="form-control" placeholder="İlçe" />

                        </div>
                    </div>

                </div>
            </div>

        </div>


        <div class="col-md-12">
            <div style="background: #fd3a13; border-bottom: 5px solid #bfa6a6" class="pst-block-head">
                <h3 style="color: #fff !important;"><strong>Fatura Bilgileri</strong></h3>

                <div class="all-sb"></div>
            </div>
            <br />
            <div class="col-md-6">

                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Fatura Adresi</label>
                        <div class="col-xs-9">
                            <textarea id="adres" style="height: 80px;" class="form-control" placeholder="Açık Adres"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Posta Kodu</label>
                        <div class="col-xs-9">
                            <input type="text" id="fpk" class="form-control" placeholder="Posta Kodu" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3  control-label" for="in">Şehir</label>
                        <div class="col-xs-9">

                            <input type="text" id="fil" class="form-control" placeholder="İl" />

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Semt</label>
                        <div class="col-xs-9">

                            <input type="email" id="filce" class="form-control" placeholder="İlçe" />

                        </div>
                    </div>

                </div>


            </div>
            <div class="col-md-6">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Vergi Dairesi</label>
                        <div class="col-xs-9">
                            <input type="text" id="vergidairesi" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="in">Vergi No Kodu</label>
                        <div class="col-xs-9">
                            <input type="text" id="vergino" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-3"></div>
                        <div class="col-xs-9">
                            Derginiz ayın 20'sine kadar ulaşan abone başvuruları çıkacak ilk sayıdan itibaren uygulanacaktır. * Derginiz abone işlemlerinin tamamlanmasından sonra özel ulaşım sistemi ile düzenli olarak adresinize teslim edilecektir. 
            <br />
                            <br />
                            <div style="width: 100px; height: 40px; text-align: center;" class="btn btn-success pull-right">
                                Gönder

                            </div>
                        </div>


                    </div>

                </div>
            </div>

        </div>

        <div class="col-md-12">

           
        </div>
          <br /><br />  <br /><br />
    </form>
</body>
</html>