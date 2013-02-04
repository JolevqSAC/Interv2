using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Intertek.Business.Entity.Enums;
using System.Globalization;

namespace Intertek.Business.Entity
{
    public class Area: BaseEntity
    {
        public int IDArea { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string ARE_Codigo { get; set; }
        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string ARE_Nombre { get; set; }

        public string ARE_Descripcion { get; set; }


        
    }
}
