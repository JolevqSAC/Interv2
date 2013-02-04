using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace Intertek.WebSite.Core.Helpers
{
    public static class Extensiones
    {
        public static string Image(this HtmlHelper helper, string src, string alt)
        {
            TagBuilder tb = new TagBuilder("img");
            tb.Attributes.Add("src", helper.Encode(src));
            tb.Attributes.Add("alt", helper.Encode(alt));
            return tb.ToString(TagRenderMode.SelfClosing);
        }
    }
}