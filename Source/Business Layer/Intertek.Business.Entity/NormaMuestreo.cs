using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class NormaMuestreo : BaseEntity
    {
        public int IDNormaMuestreo { get; set; }
        public string NOM_Codigo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof (Recursos.Validacion))]
        public string NOM_Nombre { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string NOM_Acreditador { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof (Recursos.Validacion))]
        public int NOM_Anio { get; set; }

        public string NOM_Descripcion { get; set; }
    }
}
