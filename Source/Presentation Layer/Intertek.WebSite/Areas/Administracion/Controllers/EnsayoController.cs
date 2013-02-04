﻿
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
    public class EnsayoController : BaseController
    {
        //
        // GET: /Administracion/Ensayo/

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

                var generic = Listar(EnsayoBL.Instancia, grid.sidx, grid.sord, grid.page, grid.rows, grid._search, grid.searchField, grid.searchOper, grid.searchString, where);

                generic.Value.rows = generic.List
                    .Select(item => new Row
                    {
                        id = item.IDEnsayo,
                        cell = new[]
                            {
                                item.IDEnsayo.ToString(),
                                item.ENS_Codigo,
                                item.ENS_Nombre,
                                item.ENS_NombreIngles,
                                item.ENS_Descripcion,
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
                var entidad = new Ensayo
                {
                    ENS_Nombre = string.Empty
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
        public virtual JsonResult Crear(Ensayo entidad)
        {
            var jsonResponse = new JsonResponse { Success = false };

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioCreacion = UsuarioActual.IdUsuario.ToString();
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    // carga de data temporal 24/01/2013
                    if (entidad.ENS_NombreIngles == null)
                        entidad.ENS_NombreIngles = "";
                    if (entidad.ENS_Descripcion == null)
                        entidad.ENS_Descripcion = "";
                    if (entidad.IDLaboratorio == null || entidad.IDLaboratorio == 0)
                        entidad.IDLaboratorio = 2;
                    // fin carga

                    EnsayoBL.Instancia.Add(entidad);

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
                var entidad = EnsayoBL.Instancia.Single(Convert.ToInt32(id));
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
        public virtual JsonResult Modificar(Ensayo entidad)
        {
            var jsonResponse = new JsonResponse { Success = false };

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    // carga de data temporal 24/01/2013
                    if (entidad.ENS_NombreIngles == null)
                        entidad.ENS_NombreIngles = "";
                    if (entidad.ENS_Descripcion == null)
                        entidad.ENS_Descripcion = "";
                    if (entidad.IDLaboratorio == null || entidad.IDLaboratorio == 0)
                        entidad.IDLaboratorio = 2;
                    // fin carga
                    EnsayoBL.Instancia.Update(entidad);

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
        public virtual JsonResult ListarEnsayos()
        {
            try
            {
                var ensayo = EnsayoBL.Instancia.GetAll();
                var cadenaFormateada = string.Empty;
                foreach (var item in ensayo)
                {
                    cadenaFormateada += string.Format("<option value='{0}'>{1}</option>", item.IDEnsayo, item.ENS_Nombre);
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
            var jsonResponse = new JsonResponse { Success = false };
            try
            {
                string[] extensiones = forms.Get("ext").Split(';');

                string extensionArchivo = Path.GetExtension(file.FileName);

                if (extensiones.Contains(extensionArchivo.ToLower()))
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
                        DirectoryPath = ConfigurationManager.AppSettings["ImageFilePath"],
                        ApplicationPath = System.Web.HttpContext.Current.Request.PhysicalApplicationPath,
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

        private void PrepararDatos(ref Ensayo entidad, string accion)
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
