using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Intertek.Business.Entity
{
    public class CentroCosto : BaseEntity
    {
        public int IDCentroCosto { get; set; }
        public string CCO_Codigo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CCO_Nombre { get; set; }

        public string CCO_Descripcion { get; set; }
    }
}
