using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace Intertek.WebSite.Core.Extensiones
{
    public static class RadioButtonListExtensions
    {
        public static MvcHtmlString RadioButtonListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper,
                                                                          Expression<Func<TModel, TProperty>> expression,
                                                                          params string[] items)
        {
            return htmlHelper.RadioButtonListFor(expression, new SelectList(items));
        }

        public static MvcHtmlString RadioButtonListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper,
                                                                          Expression<Func<TModel, TProperty>> expression,
                                                                          IEnumerable<SelectListItem> items)
        {
            Func<TModel, TProperty> func = expression.Compile();
            TProperty result = func(htmlHelper.ViewData.Model);
            var list = new SelectList(items, "Value", "Text", result);

            return htmlHelper.EditorFor(expression, "RadioButtonList", new { radioButtonList = list });
        }
    }
}