
namespace Intertek.WebSite.Areas.Administracion.Controllers
{
    using System.Web.Mvc;
    using Core;

    //[Authorize]
    public class PanelController : BaseController
    {
        //
        // GET: /Administracion/Panel/

        public ActionResult Index()
        {
            return View();
        }

    }
}
