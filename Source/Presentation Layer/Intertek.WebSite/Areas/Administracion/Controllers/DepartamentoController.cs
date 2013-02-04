using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Intertek.WebSite.Core;
using Intertek.WebSite.Core.Helpers;
using Intertek.Business.Entity;
using Intertek.Business.Logic;

namespace Intertek.WebSite.Areas.Administracion.Controllers
{
    public class DepartamentoController : BaseController

    {
        //
        // GET: /Administracion/Departamento/

        [HttpPost]
        public JsonResult Listar(int idPais)
        {
         
            IList<Departamento> items = new DepartamentoBL().GetAllDepartamento(idPais);
            var listItems = Utils.ConvertToListItem(items, "IDDepartamento", "DEP_Nombre");

            return Json(listItems, JsonRequestBehavior.AllowGet);
    
        }

    }
}
