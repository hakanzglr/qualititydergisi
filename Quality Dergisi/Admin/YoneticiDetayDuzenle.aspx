<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="YoneticiDetayDuzenle.aspx.cs" Inherits="Quality_Dergisi.Admin.YöneticiDetayDuzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">

        <h3>Admin Ekle</h3>
        <div class="row-fluid">

            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5>Admin Form</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Kuallnıcı Adı</label>
                                <div class="controls">
                                    <input type="text" id="adm_username" runat="server" class="span11" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Şifre</label>
                                <div class="controls">
                                    <input type="text" id="adm_password" runat="server" class="span11" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Admin Auth</label>
                                <div class="controls">
                                    <input type="text" id="adm_auth" runat="server" class="span11" />
                                </div>
                            </div>
                         
                            <div class="control-group">
                                <label class="control-label">Aktif mi?</label>
                                <div class="controls">
                                    <asp:CheckBox ID="adm_akt" runat="server"/>
                                </div>
                            </div>
                            <div style="text-align: right;" class="form-actions">
                                <div style="display: none;" id="YazarEkle" class="btn btn-success">Guncelle</div>
                                <asp:Button runat="server" ID="Kaydet" OnClick="Kaydet_Click" Text="Kaydet" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
