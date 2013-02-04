using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Intertek.Business.Entity;
using Intertek.WebSite.Core.Helpers;
using Intertek.Business.Logic;

namespace Intertek.WebSite.Areas.Administracion.Controllers
{
    public class DistritoController : Controller
    {
        [HttpPost]
        public JsonResult Listar(int idProvincia)
        {

            IList<Distrito> items = new DistritoBL().GetAllDistrito(idProvincia);
            var listItems = Utils.ConvertToListItem(items, "IDDistrito", "DIS_Nombre");
            return Json(listItems, JsonRequestBehavior.AllowGet);
        }

    }
}
