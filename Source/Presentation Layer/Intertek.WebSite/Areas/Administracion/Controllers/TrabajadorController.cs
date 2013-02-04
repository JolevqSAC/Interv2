
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
    using System.Collections.Generic;
    using System.Web.Script.Serialization;
    using System.Text;
    using System.Runtime.Serialization;
    using System.Runtime.Serialization.Json;

    [Authorize]
    public class TrabajadorController : BaseController
    {
        //
        // GET: /Administracion/Area/

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

                var generic = Listar(TrabajadorBL.Instancia, grid.sidx, grid.sord, grid.page, grid.rows, grid._search,
                                     grid.searchField, grid.searchOper, grid.searchString, where);

                generic.Value.rows = generic.List
                    .Select(item => new Row
                                        {
                                            id = item.IDPersonal,
                                            cell = new[]
                                                       {
                                                           item.IDPersonal.ToString(),
                                                           item.PER_Codigo,
                                                           item.PER_Nombres,
                                                           item.PER_Apellidos,
                                                           item.PER_DNI,
                                                             item.Cargo.CAR_Nombre,
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
                var entidad = new Trabajador
                                  {
                                      PER_Nombres = string.Empty
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
        public virtual JsonResult Crear(Trabajador entidad, string camposJson)
        {
            //Ubigeo
            JavaScriptSerializer serializer2 = new JavaScriptSerializer();
            var item2 = serializer2.Deserialize<Trabajador>(camposJson);
            //Fin Ubigeo
            var jsonResponse = new JsonResponse {Success = false};

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioCreacion = UsuarioActual.IdUsuario.ToString();
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();

                    if (entidad.PER_Direccion == null)
                        entidad.PER_Direccion = "";
                    if (entidad.PER_DNI == null)
                        entidad.PER_DNI = "";
                    //Ubigeo
                    entidad.Distrito = new Distrito();
                    entidad.Distrito.IDDistrito = item2.Distrito.IDDistrito;
                    if (entidad.IDCargo == 0) entidad.IDCargo = 1;
                    //Fin Ubigeo

                    TrabajadorBL.Instancia.Add(entidad);

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

        // Para Ubigeo
        [HttpPost]
        public ActionResult Detalle(int id)
        {
            try
            {
                //  var entidad = ClienteBL.Instancia.Single(Convert.ToInt32(id));
                Trabajador entidad = (Trabajador)Session["TrabajadorData"];
                return Respuesta(entidad);
            }
            catch (Exception ex)
            {
                return Respuesta(ex);
            }
        }
        // Fin Ubigeo
        public virtual ActionResult Modificar(string id)
        {
            try
            {
                var entidad = TrabajadorBL.Instancia.Single(Convert.ToInt32(id));
                Session["TrabajadorData"] = entidad;// Para Ubigeo
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
        public virtual JsonResult Modificar(Trabajador entidad, string camposJson)
        {
            //Ubigeo
            JavaScriptSerializer serializer2 = new JavaScriptSerializer();
            var item2 = serializer2.Deserialize<Trabajador>(camposJson);
            //Fin Ubigeo

            var jsonResponse = new JsonResponse {Success = false};

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    if (entidad.PER_Direccion == null)
                        entidad.PER_Direccion = "";
                    if (entidad.PER_DNI == null)
                        entidad.PER_DNI = "";
                    //Ubigeo
                    entidad.Distrito = new Distrito();
                    entidad.Distrito.IDDistrito = item2.Distrito.IDDistrito;
                    if (entidad.IDCargo == 0) entidad.IDCargo = 1;
                    //Fin Ubigeo

                    TrabajadorBL.Instancia.Update(entidad);
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


        /*Inicio Metodo carga combo Cargo*/

        public virtual JsonResult Search()
        {
            var jsonResponse = new JsonResponse {Success = false};
            if (ModelState.IsValid)
            {
                try
                {
                    var nombre = Request["term"].ToString();
                    var lista = TrabajadorBL.Instancia.Search(nombre);
                    var lista2 = new List<string>();
                    foreach (var item in lista)
                    {
                        lista2.Add(item.CAR_Nombre);
                    }

                    return Json(lista2, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json("ERROR - Vuelva a cargar la Página", JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                jsonResponse.Message = "Por favor ingrese todos los campos requeridos";
            }
            return Json(jsonResponse, JsonRequestBehavior.AllowGet);
        }

        public virtual JsonResult BuscarIDCargo(string nombre)
        {
            var jsonResponse = new JsonResponse {Success = false};
            if (ModelState.IsValid)
            {
                try
                {
                    string[] name = nombre.Split('-');
                    //var lista = (Cargo)TrabajadorBL.Instancia.Search(name.ElementAt(1).Trim()).SingleOrDefault();
                    var lista = (Cargo)TrabajadorBL.Instancia.Search(nombre.Trim()).SingleOrDefault();

                    jsonResponse.Data = lista.IDCargo;
                    jsonResponse.Success = true;
                }
                catch (Exception ex)
                {
                    jsonResponse.Success = false;
                    return Json("ERROR - Vuelva a cargar la Página", JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                jsonResponse.Message = "Por favor ingrese todos los campos requeridos";
            }
            return Json(jsonResponse, JsonRequestBehavior.AllowGet);
        }

        /*Fin Metodo*/

        #endregion Metodos Publicos

        #region Metodos Privados

        private void PrepararDatos(ref Trabajador entidad, string accion)
        {
            // Para Ubigeo
            ViewData["IDPersonal"] = entidad.IDPersonal;//entidad.IDCliente;
            // Fin Ubigeo
            entidad.Accion = accion;
            ViewData["idMenu"] = this.IdMenu;
            entidad.IdMenu = this.IdMenu;
            entidad.IdModulo = this.IdModulo;
            entidad.Estados = Utils.EnumToList<TipoEstado>();
        }

        #endregion Metodos Privados

    }
}
