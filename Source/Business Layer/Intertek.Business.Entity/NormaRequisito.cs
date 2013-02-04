using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;


namespace Intertek.Business.Entity
{
    public class NormaRequisito :BaseEntity
    {
        public int IDNormaRequisito { get; set; }
        public string NRE_Codigo { get; set; }
         [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))] 

        public string NRE_Nombre { get; set; }
         [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))] 

        public int NRE_Anio { get; set; }
         [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))] 
        public string NRE_Acreditador { get; set; }
        public string NRE_Descripcion { get; set; }
    }
}
