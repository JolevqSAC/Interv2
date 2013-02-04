
namespace Intertek.WebSite.Areas.Administracion.Controllers
{
    using System;
    using System.Configuration;
    using System.IO;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;
    using Business.Entity;
    using Business.Entity.Enums;
    using Business.Entity.JQGrid;
    using Business.Logic;
    using Core;
    using Core.Helpers;
    using Newtonsoft.Json;
    using Palmmedia.Common.Net.Mvc;

    [Authorize]
    public class NormaMuestreoController : BaseController
    {
        //
        // GET: /Administracion/NormaMuestreo/

        #region Metodos Publicos

        public ActionResult Index()
        {
            var viewName = ControllerContext.RouteData.Values["Controller"];

            return BasePartialView(viewName.ToString());
        }

        [HttpPost]
        public virtual JsonResult Listar(GridTable grid)
        {
            try
            {
                grid.page = (grid.page == 0) ? 1 : grid.page;

                grid.rows = (grid.rows == 0) ? 100 : grid.rows;

                var where = (Utils.GetWhere(grid.filters, grid.rules));

                if (!string.IsNullOrEmpty(where))
                {
                    grid._search = true;

                    if (!string.IsNullOrEmpty(grid.searchString))
                    {
                        where = where + " and ";
                    }
                }

                var generic = Listar(NormaMuestreoBL.Instancia, grid.sidx, grid.sord, grid.page, grid.rows, grid._search,
                                     grid.searchField, grid.searchOper, grid.searchString, where);

                generic.Value.rows = generic.List
                    .Select(item => new Row
                                        {
                                            id = item.IDNormaMuestreo,
                                            cell = new[]
                                                       {
                                                           item.IDNormaMuestreo.ToString(),
                                                           item.NOM_Codigo,
                                                           item.NOM_Nombre,
                                                           item.NOM_Acreditador,
                                                           item.NOM_Anio.ToString(),
                                                           item.NOM_Descripcion,
                                                           item.NombreEstado
                                                       }
                                        }).ToArray();

                return Json(generic.Value);
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                return MensajeError();
            }
        }

        public virtual ActionResult Crear()
        {
            try
            {
                var entidad = new NormaMuestreo
                                  {
                                      NOM_Nombre = string.Empty,
                                      NOM_Acreditador = string.Empty,
                                      NOM_Descripcion = string.Empty
                                  };
                PrepararDatos(ref entidad, "Crear");
                return PartialView("Edit", entidad);
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                return new HttpNotFoundWithViewResult("Error");
            }
        }

        [HttpPost]
        public virtual JsonResult Crear(NormaMuestreo entidad)
        {
            var jsonResponse = new JsonResponse {Success = false};

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioCreacion = UsuarioActual.IdUsuario.ToString();
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    // data temporal
                    //entidad.NOM_Acreditador = entidad.NOM_Nombre + " - NOM_Acreditador";
                    //entidad.NOM_Anio = 2013;
                    if (entidad.NOM_Acreditador == null)
                        entidad.NOM_Acreditador = "";
                    if (entidad.NOM_Anio == null)
                        entidad.NOM_Anio = DateTime.Now.Year;
                    if (entidad.NOM_Descripcion == null)
                        entidad.NOM_Descripcion = "";
                    // fin data
                    NormaMuestreoBL.Instancia.Add(entidad);

                    jsonResponse.Success = true;
                    jsonResponse.Message = "Se Proceso con éxito";
                }
                catch (Exception ex)
                {
                    logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                    jsonResponse.Message = "Ocurrio un error, por favor intente de nuevo o más tarde.";
                }
            }
            else
            {
                jsonResponse.Message = "Por favor ingrese todos los campos requeridos";
            }
            return Json(jsonResponse, JsonRequestBehavior.AllowGet);
        }

        public virtual ActionResult Modificar(string id)
        {
            try
            {
                var entidad = NormaMuestreoBL.Instancia.Single(Convert.ToInt32(id));
                PrepararDatos(ref entidad, "Modificar");
                return PartialView("Edit", entidad);
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                return MensajeError();
            }
        }

        [HttpPost]
        public virtual JsonResult Modificar(NormaMuestreo entidad)
        {
            var jsonResponse = new JsonResponse {Success = false};

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    // data temporal
                    //entidad.NOM_Acreditador = entidad.NOM_Nombre + " - NOM_Acreditador";
                    //entidad.NOM_Anio = 2013;
                    if (entidad.NOM_Acreditador == null)
                        entidad.NOM_Acreditador = "";
                    if (entidad.NOM_Anio == null)
                        entidad.NOM_Anio = DateTime.Now.Year;
                    if (entidad.NOM_Descripcion == null)
                        entidad.NOM_Descripcion = "";
                    // fin data
                    NormaMuestreoBL.Instancia.Update(entidad);
                    jsonResponse.Success = true;
                    jsonResponse.Message = "Se Proceso con éxito";
                }
                catch (Exception ex)
                {
                    logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                    jsonResponse.Message = "Ocurrio un error, por favor intente de nuevo o más tarde.";
                }
            }
            else
            {
                jsonResponse.Message = "Por favor ingrese todos los campos requeridos";
            }
            return Json(jsonResponse, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public virtual JsonResult ListarNormaMuestreos()
        {
            try
            {
                var normaMuestreo = NormaMuestreoBL.Instancia.GetAll();
                var cadenaFormateada = string.Empty;
                foreach (var item in normaMuestreo)
                {
                    cadenaFormateada += string.Format("<option value='{0}'>{1}</option>", item.IDNormaMuestreo,
                                                      item.NOM_Nombre);
                }

                return Json(cadenaFormateada);
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                return MensajeError();
            }
        }

        public string Upload(HttpPostedFileBase file, FormCollection forms)
        {
            var jsonResponse = new JsonResponse {Success = false};
            try
            {
                string[] extensiones = forms.Get("ext").Split(';');

                string extensionArchivo = Path.GetExtension(file.FileName);

                if (extensiones.Contains(extensionArchivo.ToLower()))
                {
                    var content = new byte[file.ContentLength];
                    file.InputStream.Read(content, 0, file.ContentLength);
                    var indexOfLastDot = file.FileName.LastIndexOf('.');
                    var extension = file.FileName.Substring(indexOfLastDot + 1,
                                                            file.FileName.Length - indexOfLastDot - 1);
                    var name = file.FileName.Substring(0, indexOfLastDot);

                    var fileUpload = new ImageFile
                                         {
                                             Id = string.Format("_{0}", DateTime.Now.ToString("M_dd_yyyy_H_M_s")),
                                             Name = name,
                                             DirectoryPath = ConfigurationManager.AppSettings["ImageFilePath"],
                                             ApplicationPath =
                                                 System.Web.HttpContext.Current.Request.PhysicalApplicationPath,
                                             Extension = extension,
                                             Data = content
                                         };

                    jsonResponse.Data = fileUpload.RelativePath;
                    jsonResponse.Success = true;
                }
                else
                {
                    jsonResponse.Success = false;
                    jsonResponse.Message = "0";
                }
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                jsonResponse.Message = "Ocurrio un error, por favor intente de nuevo o más tarde.";
            }

            return JsonConvert.SerializeObject(jsonResponse);
        }

        #endregion Metodos Publicos

        #region Metodos Privados

        private void PrepararDatos(ref NormaMuestreo entidad, string accion)
        {
            entidad.Accion = accion;

            ViewData["idMenu"] = this.IdMenu;
            entidad.IdMenu = this.IdMenu;
            entidad.IdModulo = this.IdModulo;
            entidad.Estados = Utils.EnumToList<TipoEstado>();
        }

        #endregion Metodos Privados

    }
}
