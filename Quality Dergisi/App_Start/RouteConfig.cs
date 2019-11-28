using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using Quality_Dergisi.Admin;

namespace Quality_Dergisi
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.MapPageRoute("HomeRoute", "Anasayfa"
            //    , "~/Default.aspx");
            //routes.MapPageRoute("HomeRoute1", "Anasayfa"
            //    , "~/ara.aspx");
            //routes.MapPageRoute("HomeRoute2", "Anasayfa"
            //    , "~/arsiv.aspx");
            //routes.MapPageRoute("HomeRoute3", "Anasayfa"
            //    , "~/Galeri.aspx");
            //routes.MapPageRoute("HomeRoute4", "Anasayfa"
            //    , "~/Haber.aspx");
            //routes.MapPageRoute("HomeRoute5", "Anasayfa"
            //    , "~/galeriler.aspx");
            //routes.MapPageRoute("HomeRoute6", "Anasayfa"
            //    , "~/gecici.aspx");
            //routes.MapPageRoute("HomeRoute7", "Anasayfa"
            //    , "~/HaberDetay.aspx");
            //routes.MapPageRoute("HomeRoute8", "Anasayfa"
            //    , "~/Haber.aspx");
            //routes.MapPageRoute("HomeRoute9", "Anasayfa"
            //    , "~/iletisim.aspx");
            //routes.MapPageRoute("HomeRoute11", "Anasayfa"
            //    , "~/Kategori.aspx");
            //routes.MapPageRoute("HomeRoute12", "Anasayfa"
            //    , "~/V2.aspx");
            //routes.MapPageRoute("HomeRoute13", "Anasayfa"
            //    , "~/video.aspx");
            //routes.MapPageRoute("HomeRoute14", "Anasayfa"
            //    , "~/Yazarlar.aspx");

            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
        }
    }
}
