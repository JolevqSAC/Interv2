using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Collections.Generic;
using Intertek.Business.Entity.Enums;
using System;
using System.Web.Mvc;
namespace Intertek.Business.Entity
{
    public class Idioma : BaseEntity
    {
        /// <summary>
        /// Gets or sets the IdIdioma value.
        /// </summary>

        public int IdIdioma { get; set; }

        /// <summary>
        /// Gets or sets the Nombre value.
        /// </summary>
        [Required(ErrorMessage = "Nombre requerido")]
        [DisplayName("Nombre :")]
        [Remote("ExisteNombreIdioma", "Validation", AdditionalFields = "Accion,IdIdioma")]
        public string Nombre { get; set; }

        /// <summary>
        /// Gets or sets the Estado value.
        /// </summary>
        [DisplayName("Codigo :")]
        [Remote("ExisteCodigoIdioma", "Validation", AdditionalFields = "Accion,IdIdioma")]
        public int Codigo { get; set; }

        /// <summary>
        /// Gets or sets the RutaImagen value.
        /// </summary>
        [DisplayName("Archivo :")]
        [Required(ErrorMessage = "Archivo requerido")]
        public string RutaImagen { get; set; }

        /// <summary>
        /// Gets or sets the EsPrincipal value.
        /// </summary>

        public string NombreCodigo
        {
            get { return Enum.Parse(typeof(TipoIdioma), Codigo.ToString()).ToString(); }
        }

        public IList<Comun> Codigos { get; set; }
    }
}