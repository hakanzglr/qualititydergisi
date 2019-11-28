<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SECGaleriler.aspx.cs" Inherits="Quality_Dergisi.Admin.SECGaleriler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"/>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-4 col-sm-4">
                    <input type="text" runat="server" class="form-control" id="kelime" />


                </div>
                <div class="col-md-8 col-sm-8">

                    <asp:Button runat="server" ID="Ara" OnClick="Ara_Click" CssClass="btn btn-success" Text="Ara" />


                </div>

            </div></div>



        <div runat="server" id="galerilist"></div>





    
    </div>
</form>
</body>
</html>
