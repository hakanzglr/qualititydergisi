<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Kunye.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .new {
            height: 100px;
            float: left;
            width: 150px;
            text-align: center;
            line-height: 100%;
            color: #fff;
            line-height: 50px;
            border: 1px solid black;
            margin-right: 5px;
        }

            .new:hover {
                background: #17325c !important;
            }
    </style>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="min-height: 500px;" class="container-fluid">






        <h2>Künye Bilgileri</h2>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5></h5>
                    </div>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">İmtiyaz Sahibi</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtimt1" runat="server"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Adres</label>
                                <div class="controls">

                                    <asp:TextBox ID="adrestxt" runat="server"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Genel Yayın Yönetmeni</label>
                                <div class="controls">

                                    <asp:TextBox ID="yayinyonetmenitxt" runat="server"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Yazı İşleri Müdürü</label>
                                <div class="controls">
                                    <asp:TextBox ID="yaziisleri" runat="server" ></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Site Sorumlusu</label>
                                <div class="controls">
                                   
                                    <asp:TextBox ID="sitesorumlusutxt" runat="server"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Editör</label>
                                <div class="controls">
                                    <asp:TextBox ID="editor" runat="server" ></asp:TextBox>
                               



                                </div>
                            </div>


                        </div>
                        
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Görsel Yönetmen</label>
                                <div class="controls">
                               
                                    <asp:TextBox ID="gorselyonetmentxt" runat="server"></asp:TextBox>


                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Reklam Müdürü</label>
                                <div class="controls">
                               

                                    <asp:TextBox ID="reklammudurutxt" runat="server"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Satış Sorumlusu</label>
                                <div class="controls">
                               

                                    <asp:TextBox ID="satıssorumlusutxt" runat="server"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">İletişim</label>
                                <div class="controls">
                               
                                    <asp:TextBox ID="iletisimtxt" runat="server"></asp:TextBox>


                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Mail Adresi</label>
                                <div class="controls">
                                    <asp:TextBox ID="mailtxt" runat="server"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                   
                  
                    
                       
                        
                   
                        
                   
                        <div class="form-horizontal">
                            <div class="control-group">
                                <div class="controls">
                                    <asp:Button ID="Guncelle" OnClick="Guncelle_Click" runat="server" Text="Güncelle" CssClass="btn btn-success"></asp:Button>



                                </div>
                            </div>

                            </div>
                        </div>

                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
