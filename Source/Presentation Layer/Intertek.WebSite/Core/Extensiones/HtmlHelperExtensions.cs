namespace Intertek.WebSite.Core.Extensiones
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.WebPages;
    using Business.Entity;
    using Helpers;
    using Business.Logic;
    using System;

    public static class HtmlHelperExtensions
    {
        
        
        public static string ResolveUrl(this HtmlHelper helper, string relativeUrl)
        {
            if (VirtualPathUtility.IsAppRelative(relativeUrl))
            {
                return VirtualPathUtility.ToAbsolute(relativeUrl);
            }
            else
            {
                string curPath = WebPageContext.Current.Page.TemplateInfo.VirtualPath;
                string curDir = VirtualPathUtility.GetDirectory(curPath);
                return VirtualPathUtility.ToAbsolute(VirtualPathUtility.Combine(curDir, relativeUrl));
            }
        }

        public static List<Modulo> GetModulos(Usuario user,string cultura)
        {
            List<Modulo> modulos = new List<Modulo>();

            if (System.Web.HttpContext.Current.Session["Modulo"] == null)
            {
                modulos = UsuarioBL.Instancia.GetModulos(user.IdRole, cultura).ToList();
                foreach (var modulo in modulos)
                {
                    List<MenuAdmin> menus = UsuarioBL.Instancia.GetMenuByModulo(Convert.ToInt32(modulo.IdModulo), cultura).OrderBy(p => p.IdMenu).ToList();
                    modulo.Menus = menus;
                }
            }
            else
            {
                modulos = (List<Modulo>)System.Web.HttpContext.Current.Session["Modulo"];
            }

            foreach (Modulo item in modulos)
            {
                if (cultura.Equals("en"))
                {
                    item.NombreActual = item.Nombre_US;

                }
                else
                {

                    item.NombreActual = item.Nombre;
                }
            }



            foreach (Modulo item2 in modulos)
            {
                if (item2.Menus.Count > 0)
                {
                    for (int i = 0; i < item2.Menus.Count; i++)
                    {

                        if (cultura.Equals("en"))
                        {
                           // item2.NombreActual = item2.Nombre_US;
                       
                            item2.Menus[i].NombreActual = item2.Menus[i].Nombre_US;
                        }
                        else
                        {

                          //  item2.NombreActual = item2.Nombre;

                            item2.Menus[i].NombreActual = item2.Menus[i].Nombre;
                        
                        }

                    }
                
                }
                
                
            }

           
      

       
            
            return modulos;

           

        }

        public static MvcHtmlString SetImage(this HtmlHelper helper, string url, string nombre, int alto, int ancho)
        {
            string htmlImage = string.Empty;
            url = string.Format("{0}{1}", Utils.AbsoluteWebRoot, url);

            if (alto == 0 && ancho != 0)
            {
                htmlImage = string.Format("<img src='{0}' alt='{1}'  width='{2}' />", url, nombre, ancho);
            }

            if (ancho == 0 && alto != 0)
            {
                htmlImage = string.Format("<img src='{0}' alt='{1}' height ='{2}' />", url, nombre, alto);
            }

            if (alto == 0 && ancho == 0)
            {
                htmlImage = string.Format("<img src='{0}' alt='{1}' />", url, nombre);
            }

            if (alto != 0 && ancho != 0)
            {
                htmlImage = string.Format("<img src='{0}' alt='{1}' width ='{2}' height = '{3}' />", url, nombre, ancho, alto);
            }

            return MvcHtmlString.Create(htmlImage);
        }
    }
}