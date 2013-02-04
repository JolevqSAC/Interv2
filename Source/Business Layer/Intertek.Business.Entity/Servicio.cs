using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Intertek.Business.Entity
{
    public class Servicio : BaseEntity
    {
        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public int IDServicio { get; set; }
        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string SER_Codigo { get; set; }
        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string SER_Nombre { get; set; }
        public string SER_NombreIngles { get; set; }
        public string SER_Descripcion { get; set; }

    }
}
