using log4net;

namespace Intertek.WebSite.Core.Helpers
{
    using System;
    using System.Collections.Generic;
    using System.Drawing;
    using System.Drawing.Imaging;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Net.Mail;
    using System.Text;
    using System.Text.RegularExpressions;
    using System.Web;
    using System.Web.Mvc;
    using System.Xml;
    using System.Xml.Serialization;
    using Business.Entity;
    using Business.Entity.Enums;
    using Business.Entity.JQGrid;
    using Newtonsoft.Json;
    using MailMessage = System.Net.Mail.MailMessage;
    using MailPriority = System.Net.Mail.MailPriority;

    public static class Utils
    {
        #region Imagenes

        public static double TamanhoPermitido(TipoArchivo tipoArchivo)
        {
            double tam = 0;
            switch (tipoArchivo)
            {
                case TipoArchivo.Documentos:
                    tam = 50 * Math.Pow(1024, 2);
                    break;
                case TipoArchivo.Imagenes:
                    tam = 5 * Math.Pow(1024, 2);
                    break;
                case TipoArchivo.Videos:
                    tam = 50 * Math.Pow(1024, 2);
                    break;
                default:
                    break;
            }
            return tam;
        }

        /// <summary>
        /// Obtiene el tipo de imagen segun la extension
        /// </summary>
        /// <param name="extension">Extension a evaluar</param>
        /// <returns></returns>
        public static ImageFormat GetImageFormat(string extension)
        {
            extension = extension.ToLowerInvariant();
            switch (extension)
            {
                case ".jpg":
                case ".jpeg":
                    return ImageFormat.Jpeg;
                case ".png":
                    return ImageFormat.Png;
                case ".gif":
                    return ImageFormat.Gif;
                default:
                    return null;
            }
        }

        public static List<string> CheckExtension(TipoArchivo tipoArchivo)
        {
            List<string> lst;
            switch (tipoArchivo)
            {
                case TipoArchivo.Documentos:
                    lst = new List<string> { ".pdf" };
                    break;
                case TipoArchivo.Imagenes:
                    lst = new List<string> { ".jpg", ".jpeg", ".png", ".gif" };
                    break;
                case TipoArchivo.Videos:
                    lst = new List<string> { ".flv" };
                    break;
                default:
                    lst = new List<string>();
                    break;
            }
            return lst;
        }

        /// <summary>
        /// Guarda una imagen en disco.
        /// </summary>
        /// <param name="caratula">array de bits a guardar</param>
        /// <param name="pathDirectorio">Directorio en donde se guardara el archivo.</param>
        /// <param name="nombreArchivo">nombre del archivo</param>
        public static void GuardarImagen(byte[] caratula, string pathDirectorio, string nombreArchivo)
        {
            try
            {
                if (!Directory.Exists(pathDirectorio))
                    Directory.CreateDirectory(pathDirectorio);

                string pathImagenActual = Path.Combine(pathDirectorio, nombreArchivo);
                string extension = Path.GetExtension(nombreArchivo).Substring(1);

                var ms = new MemoryStream(caratula);

                var imagensave = new Bitmap(ms);
                imagensave.Save(pathImagenActual, GetImageFormat(extension));
                imagensave.Dispose();
                ms.Close();
            }
            catch (Exception ex)
            {
                throw new IOException(ex.Message);
            }
        }

        #endregion Imagenes

        #region Guardar Archivos

        public static bool GuardarArchivo(byte[] buffer, string pathDirectrio, string nombreArchivo)
        {
            if (!Directory.Exists(pathDirectrio))
                Directory.CreateDirectory(pathDirectrio);

            string pathArchivo = Path.Combine(pathDirectrio, nombreArchivo);

            try
            {
                var fs = new FileStream(pathArchivo, FileMode.Create, FileAccess.ReadWrite);
                var bw = new BinaryWriter(fs);
                bw.Write(buffer);
                bw.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion Guardar Archivos

        #region Formatear datos

        /// <summary>
        /// Retira todos los caracteres especiales de un texto especificado
        /// </summary>
        /// <param name="text">texto a formatear</param>
        /// <returns>retorna un texto sin caracteres especiales</returns>
        public static string RemoveIllegalCharacters(string text)
        {
            if (string.IsNullOrEmpty(text))
                return text;

            Regex regex = new Regex(@"(\s|-)+", RegexOptions.Compiled);

            text = text.Replace(":", string.Empty);
            text = text.Replace("/", string.Empty);
            text = text.Replace("?", string.Empty);
            text = text.Replace("#", string.Empty);
            text = text.Replace("[", string.Empty);
            text = text.Replace("]", string.Empty);
            text = text.Replace("@", string.Empty);
            text = text.Replace("*", string.Empty);
            text = text.Replace(",", string.Empty);
            text = text.Replace(".", string.Empty);
            text = text.Replace(";", string.Empty);
            text = text.Replace("\"", string.Empty);
            text = text.Replace("&", string.Empty);
            text = text.Replace("'", string.Empty);
            text = regex.Replace(text, "-");
            text = RemoveCharacters(text);

            return text;
        }

        /// <summary>
        /// Remover caracteres especiales
        /// </summary>
        /// <param name="text">texto a analizar</param>
        /// <returns></returns>
        private static string RemoveCharacters(string text)
        {
            String normalized = text.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < normalized.Length; i++)
            {
                Char c = normalized[i];
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                    sb.Append(c);
            }

            return HttpUtility.UrlEncode(sb.ToString()).Replace("%", string.Empty); ;
        }

        /// <summary>
        /// Retira todas las etiquetas html del string especificado
        /// </summary>
        /// <param name="html">el estring que cntiene el html</param>
        /// <returns>un string sin etiquetas html</returns>
        public static string StripHtml(string html)
        {
            Regex strip_HTML = new Regex(@"<(.|\n)*?>", RegexOptions.Compiled);
            if (string.IsNullOrEmpty(html))
                return string.Empty;

            return strip_HTML.Replace(html, string.Empty);
        }

        #endregion Formatear datos

        #region Manejo de URLs

        private static string relativeWebRoot;

        /// <summary>
        /// Retorna la ruta relativa al sitio
        /// </summary>
        public static string RelativeWebRoot
        {
            get { return relativeWebRoot ?? (relativeWebRoot = VirtualPathUtility.ToAbsolute("~/")); }
        }

        /// <summary>
        /// Retorna la ruta absoluta al sitio
        /// </summary>
        public static Uri AbsoluteWebRoot
        {
            get
            {
                HttpContext context = HttpContext.Current;
                if (context == null)
                    throw new System.Net.WebException("El actual HttpContext es nulo");

                if (context.Items["absoluteurl"] == null)
                    context.Items["absoluteurl"] = new Uri(context.Request.Url.GetLeftPart(UriPartial.Authority) + RelativeWebRoot);

                return context.Items["absoluteurl"] as Uri;
            }
        }

        #endregion Manejo de URLs

        #region Emails

        static readonly ILog logger = LogManager.GetLogger(string.Empty);

        public static bool SendEmail(string address, string subject, string body, string fileUrl, string fileName)
        {
            var result = false;

            var message = new MailMessage();
            //foreach (string item in addresses)
            //{
            //    message.To.Add(item);
            //}
            message.To.Add(address);
            message.Subject = subject;
            message.SubjectEncoding = Encoding.UTF8;
            message.Body = body;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            message.Priority = MailPriority.Normal;

            if (!string.IsNullOrEmpty(fileUrl))
            {
                /* Create the email attachment with the uploaded file */
                Attachment attach = new Attachment(fileUrl);
                attach.Name = fileName;
                /* Attach the newly created email attachment */
                message.Attachments.Add(attach);
            }

            try
            {
                var smtp = new SmtpClient();
                //smtp.Host = "mail.mototravelperu.com";

                //smtp.Port = 587;
                //smtp.EnableSsl = true;
                //smtp.UseDefaultCredentials = false;
                //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                //smtp.Credentials = new System.Net.NetworkCredential("pruebas@mototravelperu.com", "Admin123");
                smtp.Send(message);
                result = true;
            }
            catch (SmtpException ex)
            {
                string inner = string.Empty;
                if (ex.InnerException != null)
                {
                    inner = ex.InnerException.Message;
                }

                logger.Error(string.Format("Mensaje: {0} Trace: {1} Inner:{2}", ex.Message, ex.StackTrace, inner));
            }
            finally
            {
                message.Dispose();
            }
            return result;
        }

        #endregion Emails

        #region Manejo de datos

        public static List<SelectListItem> ConvertToListItem<T>(IList<T> list, string value, string text)
        {
            var listItems = (from entity in list
                             let propiedad1 = entity.GetType().GetProperty(value)
                             where propiedad1 != null
                             let valor1 = propiedad1.GetValue(entity, null)
                             where valor1 != null
                             let propiedad2 = entity.GetType().GetProperty(text)
                             where propiedad2 != null
                             let valor2 = propiedad2.GetValue(entity, null)
                             where valor2 != null
                             select new SelectListItem
                             {
                                 Value = valor1.ToString(),
                                 Text = valor2.ToString()
                             })
                .OrderBy(p => p.Text)
                .ToList();
            listItems.Insert(0, new SelectListItem { Text = "-- Seleccionar --", Value = "0" });
            return listItems;
        }

        public static List<Comun> EnumToList<T>()
        {
            var enumType = typeof(T);

            if (enumType.BaseType != typeof(Enum))
                throw new ArgumentException("T debe ser de tipo System.Enum");

            var enumValArray = Enum.GetValues(enumType);
            var enumValList = (from object l in enumValArray
                               select new Comun
                               {
                                   IdComun = Convert.ToInt32(l).ToString(),
                                   Nombre = Enum.GetName(enumType, l)
                               })
                .OrderBy(p => p.Nombre)
                .ToList();
            return enumValList;
        }

        public static List<Comun> ConvertToComunList<T>(IList<T> list, string value, string text, bool allowValue)
        {
            var listItems = (from entity in list
                             let propiedad1 = entity.GetType().GetProperty(value)
                             where propiedad1 != null
                             let valor1 = propiedad1.GetValue(entity, null)
                             where valor1 != null
                             let propiedad2 = entity.GetType().GetProperty(text)
                             where propiedad2 != null
                             let valor2 = propiedad2.GetValue(entity, null)
                             where valor2 != null
                             select new Comun
                             {
                                 IdComun = Convert.ToInt32(valor1).ToString(),
                                 Nombre = valor2.ToString()
                             })
                .OrderBy(p => p.Nombre)
                .ToList();
            listItems.Insert(0,
                             allowValue
                                 ? new Comun { Nombre = "-- Seleccionar --", IdComun = "0" }
                                 : new Comun { Nombre = "-- Seleccionar --", IdComun = "" });

            return listItems;
        }

        public static List<Comun> ConvertToComunListString<T>(IList<T> list, string value, string text, bool allowValue)
        {
            var listItems = (from entity in list
                             let propiedad1 = entity.GetType().GetProperty(value)
                             where propiedad1 != null
                             let valor1 = propiedad1.GetValue(entity, null)
                             where valor1 != null
                             let propiedad2 = entity.GetType().GetProperty(text)
                             where propiedad2 != null
                             let valor2 = propiedad2.GetValue(entity, null)
                             where valor2 != null
                             select new Comun
                             {
                                 IdComun = valor1.ToString(),
                                 Nombre = valor2.ToString()
                             })
                .OrderBy(p => p.Nombre)
                .ToList();
            listItems.Insert(0,
                             allowValue
                                 ? new Comun { Nombre = "-- Seleccionar --", IdComun = "0" }
                                 : new Comun { Nombre = "-- Seleccionar --", IdComun = "" });

            return listItems;
        }

        public static List<Comun> ConvertToComunList<T>(IList<T> list, string value, string text)
        {
            var listItems = (from entity in list
                             let propiedad1 = entity.GetType().GetProperty(value)
                             where propiedad1 != null
                             let valor1 = propiedad1.GetValue(entity, null)
                             where valor1 != null
                             let propiedad2 = entity.GetType().GetProperty(text)
                             where propiedad2 != null
                             let valor2 = propiedad2.GetValue(entity, null)
                             where valor2 != null
                             select new Comun
                             {
                                 IdComun = Convert.ToInt32(valor1).ToString(),
                                 Nombre = valor2.ToString()
                             })
                .OrderBy(p => p.Nombre)
                .ToList();

            return listItems;
        }

        #endregion Manejo de datos

        #region "Xml"

        /// <summary>
        /// Converts a single XML tree to the type of T
        /// </summary>
        /// <typeparam name="T">Type to return</typeparam>
        /// <param name="xml">XML string to convert</param>
        /// <returns></returns>
        public static T XmlToObject<T>(string xml)
        {
            using (var xmlStream = new StringReader(xml))
            {
                var serializer = new XmlSerializer(typeof(T));
                return (T)serializer.Deserialize(XmlReader.Create(xmlStream));
            }
        }

        /// <summary>
        /// Converts the XML to a list of T
        /// </summary>
        /// <typeparam name="T">Type to return</typeparam>
        /// <param name="xml">XML string to convert</param>
        /// <param name="nodePath">XML Node path to select </param>
        /// <returns></returns>
        public static List<T> XmlToObjectList<T>(string xml, string nodePath)
        {
            var xmlDocument = new XmlDocument();
            xmlDocument.Load(xml);

            var returnItemsList = new List<T>();

            foreach (XmlNode xmlNode in xmlDocument.SelectNodes(nodePath))
            {
                returnItemsList.Add(XmlToObject<T>(xmlNode.OuterXml));
            }

            return returnItemsList;
        }

        #endregion "Xml"

        #region SQL

        public static string ConvertToSql(Business.Entity.JQGrid.Filter filtros)
        {
            var whereFiltro = string.Empty;

            var valor = string.Empty;
            if (filtros.rules == null)
            {
                filtros.rules = new List<Rule>();
            }

            foreach (var filtro in filtros.rules)
            {
                valor = string.Empty;
                var filterFormatString = string.Empty;

                switch (filtro.op)
                {
                    case "bw":
                        filterFormatString = " {0} {1} like '{2}%'";
                        valor = filtro.data;
                        break; // TODO: might not be correct. Was : Exit Select

                    //equal ==
                    case "eq":
                        filterFormatString = " {0} {1} = {2}";
                        valor = filtro.data;
                        break; // TODO: might not be correct. Was : Exit Select

                    //not equal !=
                    case "ne":
                        filterFormatString = " {0} {1} <> {2}";
                        valor = filtro.data;
                        break; // TODO: might not be correct. Was : Exit Select

                    //string.Contains()
                    case "cn":
                        filterFormatString = " {0} {1} like '%{2}%'";
                        valor = filtro.data;
                        break; // TODO: might not be correct. Was : Exit Select

                    case "fe":
                        filterFormatString = " {0} Cast({1} as date) = '{2}'";
                        valor = formatearFecha(filtro.data);
                        break; // TODO: might not be correct. Was : Exit Select
                }

                whereFiltro += string.Format(filterFormatString, filtros.groupOp, filtro.field, valor);
            }

            return filtros.rules.Count() == 0 ? string.Empty : whereFiltro.Substring(4);
        }
        public static string formatearFecha(string fecha)
        {
            var date = fecha.Split('/');
            return string.Format("{0}-{1}-{2}", date[2].ToString(), date[1].ToString(), date[0].ToString());

        }
        public static string GetWhere(string filters, List<Rule> rules)
        {
            var where = string.Empty;
            var filtro = (string.IsNullOrEmpty(filters)) ? null : JsonConvert.DeserializeObject<Business.Entity.JQGrid.Filter>(filters);

            if ((filtro != null))
            {
                where = ConvertToSql(filtro);
            }

            if ((rules != null))
            {
                foreach (var regla in rules.Where(regla => (!(string.IsNullOrEmpty(regla.data)) & regla.data != "0")))
                {
                    if (string.IsNullOrEmpty(regla.op))
                    {
                        regla.op = "=";
                    }
                    where += " and " + regla.field + regla.op + regla.data;
                }
            }

            return string.IsNullOrEmpty(@where) ? where : (where.StartsWith(" and ") ? where.Substring(4) : where);
        }

        #endregion SQL
    }
}