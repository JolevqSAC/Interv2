using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using log4net;
using Intertek.Business.Entity;
using Intertek.Business.Entity.Enums;
using Intertek.Business.Entity.Generics;
using Intertek.Business.Entity.JQGrid;
using Intertek.Business.Logic;
using Intertek.WebSite.Core.Helpers;

namespace Intertek.WebSite.Core
{


    public class BaseController : Controller
    {
        #region Constructor

        public BaseController()
        {
            if (UsuarioActual == null) return;
            ViewData[Constantes.Usuario] = UsuarioActual;
            ViewData["FechaSistema"] = FechaSistema.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);

            var cultura = System.Web.HttpContext.Current.Session["culture"].ToString();
            if (string.IsNullOrEmpty(cultura))
                cultura = TipoIdioma.GN.ToString();
            ViewData["Cultura2"] = Resources.Master.Cultura;
            ViewData["Cultura"] = cultura;

        }

        #endregion Constructor

        #region Propiedades

        protected Usuario UsuarioActual
        {

            get { return (Usuario)System.Web.HttpContext.Current.Session[Constantes.Usuario]; }
            set { System.Web.HttpContext.Current.Session.Add(Constantes.Usuario, value); }
        }

        /// <summary>
        /// Logger instance.
        /// </summary>
        protected static readonly ILog logger = LogManager.GetLogger(string.Empty);

        public DateTime FechaSistema
        {
            get { return DateTime.Now; }
        }

        public DateTime FechaCreacion
        {
            get { return DateTime.Now; }
        }

        public DateTime FechaModificacion
        {
            get { return DateTime.Now; }
        }

        public Recurso Recurso
        {
            get
            {
                var cultura = System.Web.HttpContext.Current.Session["culture"].ToString();
                if (string.IsNullOrEmpty(cultura))
                    cultura = TipoIdioma.GN.ToString();
                var codigoCultura = (int)Enum.Parse(typeof(TipoIdioma), cultura.ToUpper());
                //return ItemTablaBL.Instancia.ObtenerRecurso(codigoCultura);
                return new Recurso();
            }
        }

        public int IdMenu
        {
            get { return (int)System.Web.HttpContext.Current.Session[Constantes.IdMenu]; }
            set { System.Web.HttpContext.Current.Session.Add(Constantes.IdMenu, value); }
        }

        public int IdModulo
        {
            get { return (int)System.Web.HttpContext.Current.Session[Constantes.IdModulo]; }
            set { System.Web.HttpContext.Current.Session.Add(Constantes.IdModulo, value); }
        }

        #endregion Propiedades

        #region Control Error

        protected override void OnException(ExceptionContext filterContext)
        {
            Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            var controllerName = filterContext.RouteData.Values["controller"];
            var actionName = filterContext.RouteData.Values["action"];

            logger.Error(string.Format("Controlador:{0}  Action:{1}  Mensaje:{2}", controllerName, actionName, filterContext.Exception.Message));
            filterContext.Result = View("Error");
        }

        protected JsonResult MensajeError(string mensaje = "Ocurrio un error al cargar...")
        {
            Response.StatusCode = 404;
            return Json(new JsonResponse { Message = mensaje }, JsonRequestBehavior.AllowGet);
        }

        #endregion Control Error

        #region Vista

        protected ActionResult BasePartialView(string viewName)
        {
            try
            {
                //  string path = Server.MapPath(@"~/Menus/MenuAdmin.xml");

                string url = string.Format("Administracion/{0}", viewName);


                IList<Modulo> items = (IList<Modulo>)Session["Modulo"];

                //  var entidad = Utils.XmlToObjectList<MenuAdmin>(path, "//MenuAdmins/MenuAdmin").SingleOrDefault(p => p.Url == url);

                if (items != null)
                {
                    foreach (var item in items)
                    {
                        if (item.Menus.Count > 0)
                        {
                            for (int i = 0; i <= item.Menus.Count; i++)
                            {
                                if (item.Menus[i].Url == url)
                                {
                                    ViewData["idMenu"] = item.Menus[i].IdMenu;
                                    IdMenu = item.Menus[i].IdMenu;
                                    ViewData["idModulo"] = item.IdModulo;
                                    IdModulo = item.IdModulo;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }





            }
            catch (Exception ex)
            {
                logger.Error(ex);
            }

            return PartialView("Index");
        }

        protected ActionResult BasePartialView(string viewName, object model)
        {
            try
            {
                string path = Server.MapPath(@"~/Menus/MenuAdmin.xml");
                string url = string.Format("Administracion/{0}", viewName);
                var entidad = Utils.XmlToObjectList<MenuAdmin>(path, "//MenuAdmins/MenuAdmin").SingleOrDefault(p => p.Url == url);

                if (entidad != null)
                {
                    ViewData["idMenu"] = entidad.IdMenu;
                    IdMenu = entidad.IdMenu;
                    ViewData["idModulo"] = entidad.IdModulo;
                    IdModulo = entidad.IdModulo;
                }
            }
            catch (Exception ex)
            {
                logger.Error(ex);
            }

            return PartialView(model);
        }

        #endregion Vista

        #region Paginacion

        protected GenericDouble<JQgrid, T> Listar<T>(IBaseLogic<T> logic, string sidx, string sord, int page, int rows, bool search, string searchField, string searchOper, string searchString) where T : class
        {
            if (string.IsNullOrEmpty(sidx))
            {
                sidx = string.Empty;
            }
            if (string.IsNullOrEmpty(sord))
            {
                sord = "desc";
            }
            if (page == 0)
            {
                page = 1;
            }
            if (rows == 0)
            {
                rows = 100;
            }

            return Listar(logic, sidx, sord, page, rows, search, searchField, searchOper, searchString, string.Empty);
        }

        protected GenericDouble<JQgrid, T> Listar<T>(IBaseLogic<T> logic, string sidx, string sord, int page, int rows, bool search, string searchField, string searchOper, string searchString, string @where) where T : class
        {
            var jqgrid = new JQgrid();
            IList<T> list;

            try
            {
                int totalPages = 0;

                if (search)
                {
                    @where = @where + GetWhere(searchField, searchOper, searchString);
                }

                var count = logic.Count(@where);

                if (count > 0 && rows > 0)
                {
                    if (count % rows > 0)
                    {
                        totalPages = (int)Math.Ceiling((decimal)(count / rows));
                        totalPages = (int)(count / rows) + 1;
                    }
                    else
                    {
                        totalPages = (int)(count / rows);
                    }
                    //totalPages = (int)Math.Ceiling((decimal)(count / rows));
                    totalPages = totalPages == 0 ? 1 : totalPages;
                }

                page = page > totalPages ? totalPages : page;

                var start = rows * page - rows;
                if (start < 0)
                {
                    start = 0;
                }

                jqgrid.total = totalPages;
                jqgrid.page = page;
                jqgrid.records = count;
                jqgrid.start = start;

                list = logic.GetAll(sidx, sord, rows, page, @where);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return new GenericDouble<JQgrid, T>(jqgrid, list);
        }

        protected String GetWhere(string columna, string operacion, string valor)
        {
            var opciones = new Dictionary<string, string>();
            {
                opciones.Add("eq", "=");
                opciones.Add("ne", "<>");
                opciones.Add("lt", "<");
                opciones.Add("le", "<=");
                opciones.Add("gt", ">");
                opciones.Add("ge", ">=");
                opciones.Add("bw", "LIKE");
                opciones.Add("bn", "NOT LIKE");
                opciones.Add("in", "LIKE");
                opciones.Add("ni", "NOT LIKE");
                opciones.Add("ew", "LIKE");
                opciones.Add("en", "NOT LIKE");
                opciones.Add("cn", "LIKE");
                opciones.Add("nc", "NOT LIKE");
                opciones.Add("fe", "NOT LIKE");
            }

            if (string.IsNullOrEmpty(operacion))
            {
                return string.Empty;
            }

            if (operacion.Equals("bw") || operacion.Equals("bn"))
            {
                valor = valor + "%";
            }
            if (operacion.Equals("ew") || operacion.Equals("en"))
            {
                valor = "%" + valor;
            }
            if (operacion.Equals("cn") || operacion.Equals("nc") || operacion.Equals("in") || operacion.Equals("ni"))
            {
                valor = "%" + valor + "%";
            }
            if (opciones.Take(6).ToDictionary(p => p.Key, p => p.Value).ContainsKey(operacion))
            {
                return string.IsNullOrEmpty(valor) ? string.Empty : (columna + " ") + opciones[operacion] + " " + valor;
            }
            if (operacion.Equals("fe"))
            {
                valor = String.Format("{0:yyyy-MM-dd}", valor);
            }

            return columna + " " + opciones[operacion] + " '" + valor + "'";
        }

        #endregion Paginacion


        #region "Respuestas JSON"
        //protected JsonResult Respuesta(string extra = "")
        //{
        //    List<string> items = this.Errors();
        //    return this.Respuesta(items, false, extra);
        //}
        protected JsonResult Respuesta(string mensaje, bool success = true, string extra = "")
        {
            List<string> items = new List<string> { mensaje };
            return this.Respuesta(items, success, extra);
        }

        protected JsonResult Respuesta(Exception ex)
        {
            bool success = false;
            List<string> items = new List<string> { ex.Message };
            return this.Respuesta(items, success);
        }
        protected JsonResult Respuesta<T>(List<T> items, bool success = true, string extra = "") where T : BaseEntity //class, IEntity
        {
            T item = items.Find(delegate(T t)
            {
                //if (t.Id == null) { t.Id = -1; }
                return (t.Id != null && t.Id.ToString() == 0.ToString());
            });
            JsonResult respuesta = Json(new
            {
                success = success,
                total = (item == null) ? items.Count : items.Count - 1,
                items = items,
                extra = extra
            });
            respuesta.ContentType = "text/plain";
            return respuesta;
        }

        protected JsonResult Respuesta<T>(T item, bool success = true, string extra = "") where T : BaseEntity
        {
            return Json(new
            {
                success = success,
                total = (item == null) ? 0 : 1,
                item = item,
                extra = extra
            });
        }

        protected JsonResult Respuesta(List<String> items, bool success = true, string extra = "")
        {
            JsonResult respuesta = Json(new
            {
                success = success,
                message = items,
                extra = extra
            });
            respuesta.ContentType = "text/plain";
            return respuesta;
        }
        #endregion
     

    }
}