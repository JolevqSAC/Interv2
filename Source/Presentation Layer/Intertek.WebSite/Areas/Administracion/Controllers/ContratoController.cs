
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

    [Authorize]
    public class ContratoController : BaseController
    {
        //
        // GET: /Administracion/Contrato/

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

                var generic = Listar(ContratoBL.Instancia, grid.sidx, grid.sord, grid.page, grid.rows, grid._search, grid.searchField, grid.searchOper, grid.searchString, where);

                generic.Value.rows = generic.List
                    .Select(item => new Row
                    {
                        id = item.IDContrato,
                        cell = new[]
                            {
                                item.IDContrato.ToString(),
                                item.CON_Codigo,
                                //NombreCliente(item.IDCliente),
                                item.NombreCliente,
                                item.CON_Descripcion,
                                item.CON_FechaInico.ToString("dd/MM/yyyy"),
                                item.CON_FechaFin.ToString("dd/MM/yyyy"),
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

        private string NombreCliente(int idCliente)
        {
            var NombreCliente = " ";
            try
            {
                NombreCliente = ContratoBL.Instancia.SearchNombre(idCliente);
            }
            catch (Exception ex)
            {
                return "";
            }
            return NombreCliente;
        }

        public virtual ActionResult Crear()
        {
            try
            {
                var entidad = new Contrato
                {
                    CON_Descripcion = string.Empty
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
        public virtual JsonResult Crear(Contrato entidad)
        {
            var jsonResponse = new JsonResponse {Success = false};

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioCreacion = UsuarioActual.IdUsuario.ToString();
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();

                    if (entidad.CON_Descripcion == null)
                        entidad.CON_Descripcion = "";
                    if (entidad.CON_EstadoContrato == null)
                        entidad.CON_EstadoContrato = "Activo";
                    //if (entidad.CON_FechaInico == null)
                    entidad.CON_FechaInico = DateTime.Now;
                    //if (entidad.CON_FechaFin == null)
                        entidad.CON_FechaFin = DateTime.Now;
                    if (entidad.IDCliente == 0) entidad.IDCliente = 1;

                    ContratoBL.Instancia.Add(entidad);

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
                var entidad = ContratoBL.Instancia.Single(Convert.ToInt32(id));
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
        public virtual JsonResult Modificar(Contrato entidad)
        {
            var jsonResponse = new JsonResponse {Success = false};
            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    if (entidad.CON_Descripcion == null)
                        entidad.CON_Descripcion = "";
                    if (entidad.CON_EstadoContrato == null)
                        entidad.CON_EstadoContrato = "Activo";
                    //if (entidad.CON_FechaInico == null)
                    entidad.CON_FechaInico = DateTime.Now;
                    //if (entidad.CON_FechaFin == null)
                        entidad.CON_FechaFin = DateTime.Now;
                    if (entidad.IDCliente == 0) entidad.IDCliente = 1;

                    ContratoBL.Instancia.Update(entidad);
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
        public virtual JsonResult ListarContratos()
        {
            try
            {
                var contrato = ContratoBL.Instancia.GetAll();
                var cadenaFormateada = string.Empty;
                foreach (var item in contrato)
                {
                    cadenaFormateada += string.Format("<option value='{0}'>{1}</option>", item.IDContrato, item.CON_EstadoContrato);
                }

                return Json(cadenaFormateada);
            }
            catch (Exception ex)
            {
                logger.Error(string.Format("Mensaje: {0} Trace: {1}", ex.Message, ex.StackTrace));
                return MensajeError();
            }
        }


        public virtual JsonResult Search()
        {
            var jsonResponse = new JsonResponse { Success = false };
            if (ModelState.IsValid)
            {
                try
                {
                    var nombre = Request["term"].ToString();
                    var lista = ContratoBL.Instancia.Search(nombre);
                    var lista2 = new List<string>();
                    foreach (var item in lista)
                    {
                        lista2.Add(item.CLI_RazonSocial);
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

        public virtual JsonResult BurcarIDCliente(string nombre)
        {
            var jsonResponse = new JsonResponse { Success = false };
            if (ModelState.IsValid)
            {
                try
                {
                    string[] name = nombre.Split('-');
                    var lista = (Cliente)ContratoBL.Instancia.Search(name.ElementAt(1).Trim()).SingleOrDefault();

                    jsonResponse.Data = lista.IDCliente;
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

        private void PrepararDatos(ref Contrato entidad, string accion)
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
