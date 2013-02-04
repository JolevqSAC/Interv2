using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Routing;

namespace Intertek.WebSite.Core.Extensiones
{
    public static class CheckBoxListExtensions
    {
        public static MvcHtmlString CheckBoxListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper,
                                                                       Expression<Func<TModel, TProperty[]>> expression,
                                                                       IEnumerable<SelectListItem> listInfo)
        {
            return htmlHelper.CheckBoxListFor(expression, listInfo, (null));
        }

        public static MvcHtmlString CheckBoxListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper,
                                                                       Expression<Func<TModel, TProperty[]>> expression,
                                                                       IEnumerable<SelectListItem> listInfo,
                                                                       object htmlAttributes)
        {
            return htmlHelper.CheckBoxListFor(expression, listInfo,
                                              ((IDictionary<string, object>)new RouteValueDictionary(htmlAttributes)));
        }

        public static MvcHtmlString CheckBoxListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper,
                                                                       Expression<Func<TModel, TProperty[]>> expression,
                                                                       IEnumerable<SelectListItem> listInfo,
                                                                       IDictionary<string, object> htmlAttributes)
        {
            if (listInfo == null)
                throw new ArgumentException("listInfo");
            if (listInfo.Count() < 1)
                throw new ArgumentException("La lista debe tener almenos un elemento", "listInfo");

            Func<TModel, TProperty[]> func = expression.Compile();
            TProperty[] result = func(htmlHelper.ViewData.Model);
            var list = new MultiSelectList(listInfo, "Value", "Text", result);

            var body = expression.Body as MemberExpression;
            string propertyName = body.Member.Name;

            return htmlHelper.EditorFor(expression, "CheckBoxList", new { checkBoxList = list, grupo = propertyName });
        }
    }
}