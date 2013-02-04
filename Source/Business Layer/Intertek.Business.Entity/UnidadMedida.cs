using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Web.Mvc;

namespace Intertek.Business.Entity
{
    public class UnidadMedida : BaseEntity
    {

        public int IDUnidadMedida { get; set; }


        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string UNM_Codigo { get; set; }
        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string UNM_Nombre { get; set; }
        public string UNM_NombreCorto { get; set; }
    }
}
