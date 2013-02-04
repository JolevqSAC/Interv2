using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Intertek.WebSite.Core;
using Intertek.Business.Entity;
using Intertek.Business.Logic;
using Intertek.WebSite.Core.Helpers;

namespace Intertek.WebSite.Areas.Administracion.Controllers
{
    public class PaisController : BaseController
    {
        //
        // GET: /Administracion/Pais/

        public ActionResult Index()
        {
            return View();
        }
          [HttpPost]
        public JsonResult Listar()
        {

            List<Pais> items = new PaisBL().GetAllPais();
            var listItems = Utils.ConvertToListItem(items, "IDPais", "PAI_Nombre");

           return Json(listItems, JsonRequestBehavior.AllowGet);
           // return Respuesta(items);

        }

    }
}
