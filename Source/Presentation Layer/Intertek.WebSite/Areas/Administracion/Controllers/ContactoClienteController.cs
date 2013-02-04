using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Intertek.WebSite.Core;
using Intertek.Business.Logic;
using Intertek.Business.Entity;

namespace Intertek.WebSite.Areas.Administracion.Controllers
{
    public class ContactoClienteController : BaseController

    {
        //
        // GET: /Administracion/ContactoCliente/

        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public JsonResult Buscar()
        {

            try
            {
                int idCiente = 32;
                var items = new ContactoClienteBL().Search(idCiente);
                return Respuesta(items);

            }
            catch (Exception ex)
            {

                return Respuesta(ex);
            }
        
        }

    }
}
