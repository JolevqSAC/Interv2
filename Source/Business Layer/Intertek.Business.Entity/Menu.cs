using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Intertek.Business.Entity.Enums;
using System.Web.Mvc;

namespace Intertek.Business.Entity
{
    public class Menu: BaseEntity
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Idioma requerido")]
        [DisplayName("Idioma :")]
        public int IdIdioma { get; set; }

        [Required(ErrorMessage = "Nombre requerido")]
        [DisplayName("Nombre :")]
        public string Nombre { get; set; }

        [DisplayName("Padre :")]
        public int IdPadre { get; set; }

        [Required(ErrorMessage = "Posición requerido")]
        [DisplayName("Posición :")]
        public int Posicion { get; set; }

        [Required(ErrorMessage = "Target requerido")]
        [DisplayName("Target :")]
        public int Target { get; set; }

        [DisplayName("Es Archivo :")]
        public int EsArchivo { get; set; }

        [Remote("ExisteTourIdioma", "Validation", AdditionalFields = "Accion,IdIdioma,Id")]
        [DisplayName("Es Tour :")]
        public int EsTour { get; set; }

        [DisplayName("Url :")]
        //[Required(ErrorMessage = "Url requerido")]
        public string Url { get; set; }

        [DisplayName("Archivo :")]
        public string RutaArchivo { get; set; }

        public string Idioma { get; set; }

        public IList<Idioma> Idiomas { get; set; }

        public IList<Comun> Posiciones { get; set; }

        public IList<Comun> Menus { get; set; }

        public IList<Comun> Targets { get; set; }

        public IList<Comun> Respuestas { get; set; }


    }
}