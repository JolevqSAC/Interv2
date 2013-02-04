namespace Intertek.WebSite.Controllers
{
    using System;
    using System.Configuration;
    using System.IO;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;
    using Areas.Administracion.Models;
    using Business.Entity;
    using Business.Entity.Enums;
    using Business.Logic;
    using Core;
    using Core.Helpers;
    using Models;
    using Newtonsoft.Json;
    using Palmmedia.Common.Net.Mvc;

    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }


        public string Upload(HttpPostedFileBase file, FormCollection forms)
        {
            var jsonResponse = new JsonResponse { Success = false };
            try
            {
                var content = new byte[file.ContentLength];
                file.InputStream.Read(content, 0, file.ContentLength);
                var indexOfLastDot = file.FileName.LastIndexOf('.');
                var extension = file.FileName.Substring(indexOfLastDot + 1, file.FileName.Length - indexOfLastDot - 1);
                var name = file.FileName.Substring(0, indexOfLastDot);

                var fileUpload = new ImageFile
                {
                    Id = string.Format("_{0}", DateTime.Now.ToString("M_dd_yyyy_H_M_s")),
                    Name = name,
                    DirectoryPath = ConfigurationManager.AppSettings["TempFilePath"],
                    ApplicationPath = System.Web.HttpContext.Current.Request.PhysicalApplicationPath,
                    Extension = extension,
                    Data = content
                };

                jsonResponse.Data = fileUpload.RelativePath;
                jsonResponse.Success = true;
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                jsonResponse.Message = "Ocurrio un error, por favor intente de nuevo o más tarde.";
            }

            return JsonConvert.SerializeObject(jsonResponse);
        }
    }
}