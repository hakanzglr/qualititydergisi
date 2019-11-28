<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Reklam.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm19" %>
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






        <h2>Reklam Bilgileri</h2>
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
                                <label class="control-label">Adres</label>
                                <div class="controls">
                                    <asp:TextBox ID="adrestx" runat="server" Width="245px"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Reklam Müdürü</label>
                                <div class="controls">

                                    <asp:TextBox ID="reklam_muduru" runat="server" Width="234px"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Reklam Müdürü E-Mail</label>
                                <div class="controls">

                                    <asp:TextBox ID="mailt" runat="server" Width="221px"></asp:TextBox>

                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Reklam Satış Sorumlusu</label>
                                <div class="controls">
                                    <asp:TextBox ID="sorumlu" runat="server"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Satış Sorumlusu E-Mail</label>
                                <div class="controls">
                                   
                                    <asp:TextBox ID="mailtx" runat="server"></asp:TextBox>

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
                               
                                    <asp:TextBox ID="faks" runat="server"></asp:TextBox>


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
