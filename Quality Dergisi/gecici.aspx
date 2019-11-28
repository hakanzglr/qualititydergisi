<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gecici.aspx.cs" Inherits="Quality_Dergisi.gecici" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<form id="form1" runat="server">
      

    <meta itemprop='image' content='"+haberresim+"' />
    <meta property='og:site_name' content='quality' />
    <meta property='og:title' content='"+haberbaslik+"' />
    <meta property='og:type' content='article' />
    <meta property='article:id' content='"+haberid+"' />
    <meta property='article:section' content='"+kategoriadi+"' />
    <meta property='article:section:type' content='Detail Page' />
    <meta property='article:section:list' content='"+kategoriadi+"' />
    <meta property='article:tag' content='"+habericerikkisa+"' />
    <meta property='literal-category' content='"+kategoriadi+"' />
    <meta property='og:url' content='"+link+"' />
    <link rel='canonical' href='"+link+"' />   
    <meta property='og:image' content='"+haberresim+"' />
    <meta name='twitter:card' content='summary_large_image' />
    <meta name='twitter:site' content='@qualitydergisi' />
    <meta name='twitter:title' content='"+haberbaslik+" - "+kategoriadi+ "' />
    <meta name='twitter:description' content='"+haberbaslik+"' />
    <meta name='twitter:image' content='"+haberresim+"' />         
    <link rel='image_src' href='"+haberresim+"' />

</form>
</body>
</html>
