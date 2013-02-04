using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Intertek.Business.Entity;
using Intertek.WebSite.Core.Helpers;
using Intertek.Business.Logic;
using Intertek.WebSite.Core;

namespace Intertek.WebSite.Areas.Administracion.Controllers
{
    public class ProvinciaController : BaseController

    {
        //
        // GET: /Administracion/Provincia/

        [HttpPost]
        public JsonResult Listar(int idDepartamento)
        {

            IList<Provincia> items = new ProvinciaBL().GetAllProvincia(idDepartamento);
            var listItems = Utils.ConvertToListItem(items, "IDProvincia", "PRO_Nombre");
            return Json(listItems, JsonRequestBehavior.AllowGet);
        }

    }
}
