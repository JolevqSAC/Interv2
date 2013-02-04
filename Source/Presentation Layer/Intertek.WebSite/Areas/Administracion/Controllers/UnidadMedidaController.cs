using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Intertek.WebSite.Core;
using Intertek.Business.Entity.JQGrid;
using Intertek.WebSite.Core.Helpers;
using Palmmedia.Common.Net.Mvc;
using System.IO;
using Intertek.Business.Entity;
using Intertek.Business.Logic;
using Intertek.Business.Entity.Enums;

namespace Intertek.WebSite.Areas.Administracion.Controllers
{
     [Authorize]
    public class UnidadMedidaController : BaseController
    {
        //
        // GET: /UnidadMedida/

      

        #region Metodos Publicos

        public ActionResult Index()
        {
            var viewName = ControllerContext.RouteData.Values["Controller"];
           // ViewBag["prueba"] = System.Security.AccessControl.ResourceType=typeof(Resources.Master).ToString();

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

                var generic = Listar(UnidadMedidaBL.Instancia, grid.sidx, grid.sord, grid.page, grid.rows, grid._search, grid.searchField, grid.searchOper, grid.searchString, where);

                generic.Value.rows = generic.List
                    .Select(item => new Row
                    {
                        id = item.IDUnidadMedida,
                        cell = new[]
                            {
                                item.IDUnidadMedida.ToString(),
                                item.UNM_Codigo,
                                item.UNM_Nombre,
                                item.UNM_NombreCorto,
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
                var entidad = new UnidadMedida
                {
                    UNM_Nombre = string.Empty
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
        public virtual JsonResult Crear(UnidadMedida entidad)
        {
            var jsonResponse = new JsonResponse { Success = false };

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioCreacion = UsuarioActual.IdUsuario.ToString();
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    UnidadMedidaBL.Instancia.Add(entidad);

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
                var entidad = UnidadMedidaBL.Instancia.Single(Convert.ToInt32(id));
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
        public virtual JsonResult Modificar( UnidadMedida entidad)
        {
            var jsonResponse = new JsonResponse { Success = false };

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    UnidadMedidaBL.Instancia.Update(entidad);
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
        public virtual JsonResult ListarAreas()
        {
            try
            {
                var areas = UnidadMedidaBL.Instancia.GetAll();
                var cadenaFormateada = string.Empty;
                foreach (var item in areas)
                {
                    cadenaFormateada += string.Format("<option value='{0}'>{1}</option>", item.IDUnidadMedida, item.UNM_Nombre);
                }

                return Json(cadenaFormateada);
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                return MensajeError();
            }
        }


     

        #endregion Metodos Publicos

        #region Metodos Privados

        private void PrepararDatos(ref UnidadMedida entidad, string accion)
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
