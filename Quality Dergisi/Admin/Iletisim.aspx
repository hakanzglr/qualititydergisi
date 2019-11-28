<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm18" %>
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






        <h2>İletişim Bilgileri</h2>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Adres</label>
                                <div class="controls">
                                    <asp:TextBox ID="adrest" runat="server"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">E-mail</label>
                                <div class="controls">

                                    <asp:TextBox ID="mailt" runat="server"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Telefon</label>
                                <div class="controls">

                                    <asp:TextBox ID="tel" runat="server"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Faks</label>
                                <div class="controls">
                                    <asp:TextBox ID="fakst" runat="server"></asp:TextBox>



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