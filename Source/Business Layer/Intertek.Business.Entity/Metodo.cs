using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class Metodo : BaseEntity
    {
        public int IDMetodo { get; set; }
        public string MET_Codigo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string MET_Nombre { get; set; }

        public string MET_NombreIngles { get; set; }
        public string MET_Descripcion { get; set; }
    }
}
