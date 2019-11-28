<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Ayarlar.aspx.cs" Inherits="Quality_Dergisi.Admin.WebForm1" %>
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






        <h2>Ayarlar</h2>
        <div class="row-fluid">
            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5>Sosyal Medya</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Facebook</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtface" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Instagram</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtins" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Twitter</label>
                                <div class="controls">
                                    <asp:TextBox ID="txttwitter" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Youtube</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtyoutube" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Site Alt Açıklama</label>
                                <div class="controls">
                                    <textarea id="altaciklama" style="width: 220px; height: 200px;" runat="server" class="span6"></textarea>



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
            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-align-justify"></i></span>
                        <h5>Top Mekanlar</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">1.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">2.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">3.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">4.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">5.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">6.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">7.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">8.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">9.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">10.Mekan</label>
                                <div class="controls">
                                    <asp:TextBox ID="TextBox10" runat="server" CssClass="span"></asp:TextBox>



                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <div class="controls">
                                    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Güncelle" CssClass="btn btn-success"></asp:Button>



                                </div>
                            </div>


                        </div>


                    </div>
                </div>
            </div>
        </div>

    </div>
    <div>
    </div>


    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/matrix.js"></script>
    <script type='text/javascript'>

        $(document).ready(function () {

            $("#ayarlar").addClass("active");



        });
    </script>



</asp:Content>

