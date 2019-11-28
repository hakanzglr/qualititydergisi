<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="YazarDetayDuzenle.aspx.cs" Inherits="Quality_Dergisi.Admin.YazarDetayDuzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css' />
    <meta charset="UTF-8" />

    <style type="text/css">
        #ceper {
            min-height: 500px;
        }

        .note-editor {
            float: left;
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid"> 

    <h3>Yazar</h3>



    <div class="row-fluid">

        <div class="span6">
            <div class="widget-box">
                <div class="widget-title">
                    <span class="icon"><i class="icon-align-justify"></i></span>
                    <h5>Yazar Form</h5>
                </div>
                <div class="widget-content nopadding">
                    <div class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">Kullanıcı Adı</label>
                            <div class="controls">
                               <input type="text" id="kullanici_ad" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Şifre</label>
                            <div class="controls">
                                <input type="text" id="kullanici_sifre" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Ad-Soyad</label>
                            <div class="controls">
                                <input type="text" id="ad" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Unvan</label>
                            <div class="controls">
                                <input type="text" id="unvan" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Bölüm</label>
                            <div class="controls">
                                <input type="text" id="bolum_ad" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Email</label>
                            <div class="controls">
                                <input type="text" id="email" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sıra</label>
                            <div class="controls">
                                <input type="text" id="ord" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Web</label>
                            <div class="controls">
                                <input type="text" id="web" runat="server" class="span11"/> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Resim</label>
                            <div class="controls" id="rs">
                                <input type="file" runat="server" id="resim" class="span11"  src="" />
                                <img style="display: none;" id="resim1" src="<%resim.Value.ToString();%>" />
                            </div>
                         </div>
                        <div class="control-group">
                           <label class="control-label">Aktif mi?</label>
                              <div class="controls">
                                
                                 <asp:CheckBox ID="akt" runat="server" />
                             </div>
                           <label class="control-label">Yetki</label>
                            <div class="controls">
                                <asp:CheckBox ID="kullanici_yetki" runat="server"/>
                            </div>
                       
                        </div>
                        <div style="text-align: right;" class="form-actions">
                            <div style="display:none;" id="YazarEkle" class="btn btn-success">Güncelle</div>
                            <asp:Button runat="server" ID="Kaydet" OnClick="Kaydet_Click" Text="Kaydet" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
        
    </div></div>

</asp:Content>