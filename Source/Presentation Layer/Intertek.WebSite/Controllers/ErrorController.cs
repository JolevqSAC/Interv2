namespace Intertek.WebSite.Controllers
{
    using System.Web.Mvc;

    public class ErrorController : Controller
    {
        //
        // GET: /Error/

        public ActionResult Index()
        {
            return View("Error");
        }

        /// <summary>
        /// Shows a 404 error message.
        /// </summary>
        /// <returns>A view showing a 404 error message.</returns>
        public virtual ActionResult NotFound()
        {
            //Response.StatusCode = (int)HttpStatusCode.NotFound;
            return View("NotFound");
        }

        public virtual ActionResult NotAccess()
        {
            // Response.StatusCode = (int)HttpStatusCode.Forbidden;
            return View("NotAccess");
        }
    }
}