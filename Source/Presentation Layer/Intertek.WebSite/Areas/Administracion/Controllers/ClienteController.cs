
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
    public class ClienteController : BaseController
    {
        //
        // GET: /Administracion/Cliente/

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

                var generic = Listar(ClienteBL.Instancia, grid.sidx, grid.sord, grid.page, grid.rows, grid._search, grid.searchField, grid.searchOper, grid.searchString, where);

                generic.Value.rows = generic.List
                    .Select(item => new Row
                    {
                        id = item.IDCliente,
                        cell = new[]
                            {
                                item.IDCliente.ToString(),
                                item.CLI_Codigo,
                                //item.CLI_RUC,
                                item.CLI_RazonSocial,
                                item.CLI_Direccion,
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

                Session["ClienteData"] = null;
                var entidad = new Cliente
                {
                    CLI_RazonSocial = string.Empty,
                    IDDistrito=0,
                    IDDepartamento=0,
                    IDProvincia=0,
                    CLI_RUC= string.Empty,
                    CLI_Correo= string.Empty,
                    CLI_Fax= string.Empty,
                    CLI_IndicadorArea= string.Empty,
                    CLI_Observaciones= string.Empty,
                     IDCliente= 0,
                     CLI_Telefono1= string.Empty,
                     CLI_Telefono2= string.Empty
                 
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
        public virtual JsonResult Crear(Cliente entidad, string camposJson)
        {
           // Distrito cc = new Distrito();
            //  MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(camposJson));
             // DataContractJsonSerializer serializer = new DataContractJsonSerializer(cc.GetType());
             // cc  = (Distrito)serializer.ReadObject(ms);

              JavaScriptSerializer serializer2 = new JavaScriptSerializer();

              var  item2 = serializer2.Deserialize<Cliente>(camposJson);

             // var campos = new JavaScriptSerializer().Deserialize<IList<Distrito>>(camposJson);


            var jsonResponse = new JsonResponse { Success = false };

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.IDCliente = item2.IDCliente;
                    entidad.UsuarioCreacion = UsuarioActual.IdUsuario.ToString();
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    entidad.CLI_RazonSocial = entidad.CLI_RazonSocial;
                    entidad.CLI_RUC = entidad.CLI_RUC;
                    entidad.CLI_Telefono1 = entidad.CLI_Telefono1;
                  
                    entidad.CLI_Correo = entidad.CLI_Correo;
                    entidad.CLI_Fax = entidad.CLI_Fax;
                    entidad.CLI_Observaciones = entidad.CLI_Observaciones;
                    entidad.Distrito = new Distrito();
                    entidad.Distrito.IDDistrito = item2.IDDistrito;
                    entidad.CLI_Telefono2 = entidad.CLI_Telefono2;
                    entidad.CLI_AnexoOficina = entidad.CLI_AnexoOficina;
                    entidad.ClI_AnexoPlanta = entidad.ClI_AnexoPlanta;
                    entidad.CLI_IndicadorArea = item2.CLI_IndicadorArea;
                    entidad.Estado = item2.Estado;
                    // fin data temporal

                    Respuesta itemRespuesta = new ClienteBL().Guardar(entidad);
                    jsonResponse.Success = true;
                    jsonResponse.Message = itemRespuesta.Mensaje;
                    jsonResponse.Data = itemRespuesta.Extra;
                  //  return this.Respuesta(entidad);

                 
                   
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
        public  ActionResult Detalle( int id)
        {

            try
            {
              //  var entidad = ClienteBL.Instancia.Single(Convert.ToInt32(id));

                Cliente  entidad = (Cliente)Session["ClienteData"];
                return Respuesta(entidad);

            }
            catch (Exception ex  )
            {

                return Respuesta(ex);
            }

        }
        public virtual ActionResult Modificar(string id)
        {
            try
            {
                var entidad = ClienteBL.Instancia.Single(Convert.ToInt32(id));
                Session["ClienteData"] = entidad;
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
        public virtual JsonResult Modificar(Cliente entidad, string camposJson)
        {
            var jsonResponse = new JsonResponse { Success = false };

            if (ModelState.IsValid)
            {
                try
                {
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();

                    JavaScriptSerializer serializer2 = new JavaScriptSerializer();

                    var item2 = serializer2.Deserialize<Cliente>(camposJson);

                    entidad.IDCliente = item2.IDCliente;
                    entidad.UsuarioCreacion = UsuarioActual.IdUsuario.ToString();
                    entidad.UsuarioModificacion = UsuarioActual.IdUsuario.ToString();
                    entidad.CLI_RazonSocial = entidad.CLI_RazonSocial;
                    entidad.CLI_RUC = entidad.CLI_RUC;
                    entidad.CLI_Telefono1 = entidad.CLI_Telefono1;
                  
                    entidad.CLI_Correo = entidad.CLI_Correo;
                    entidad.CLI_Fax = entidad.CLI_Fax;
                    entidad.CLI_Observaciones = entidad.CLI_Observaciones;
                    entidad.Distrito = new Distrito();
                    entidad.Distrito.IDDistrito = item2.Distrito.IDDistrito;
                    entidad.CLI_Telefono2 = entidad.CLI_Telefono2;
                    entidad.CLI_AnexoOficina = entidad.CLI_AnexoOficina;  
                    entidad.ClI_AnexoPlanta = entidad.ClI_AnexoPlanta;
                    entidad.CLI_IndicadorArea = item2.CLI_IndicadorArea;
                    entidad.Estado = item2.Estado;                  

                    Respuesta itemRespuesta = new ClienteBL().Guardar(entidad);
                    jsonResponse.Success = true;
                    jsonResponse.Message = itemRespuesta.Mensaje;
                    jsonResponse.Data = itemRespuesta.Extra;
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
        public virtual JsonResult ListarClientes()
        {
            try
            {
                var areas = ClienteBL.Instancia.GetAll();
                var cadenaFormateada = string.Empty;
                foreach (var item in areas)
                {
                    cadenaFormateada += string.Format("<option value='{0}'>{1}</option>", item.IDCliente, item.CLI_RazonSocial);
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

        private void PrepararDatos(ref Cliente entidad, string accion)
        {
            ViewData["IDCliente"] = entidad.IDCliente;
            entidad.Accion = accion;
            ViewData["idMenu"] = this.IdMenu;
            entidad.IdMenu = this.IdMenu;
            entidad.IdModulo = this.IdModulo;
            entidad.Estados = Utils.EnumToList<TipoEstado>();
        }

        #endregion Metodos Privados

        #region Contacto

        [HttpPost]
        public JsonResult BuscarContacto()
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


        [HttpPost]
        public virtual JsonResult RegistrarContacto(ContactoCliente   entidad)
        {

            try
            {

                Respuesta itemRespuesta = new ContactoClienteBL().Guardar(entidad);

                return Respuesta(itemRespuesta.Mensaje, true, itemRespuesta.Extra);

            }
            catch (Exception  ex)
            {

                return Respuesta(ex);
            }

        }
        #endregion



    }
}
