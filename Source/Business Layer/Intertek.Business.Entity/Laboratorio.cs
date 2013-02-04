using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class Laboratorio : BaseEntity
    {
        public int IDLaboratorio { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof (Recursos.Validacion))]
        public string LAB_Nombre { get; set; }

        public int IDTipoLaboratorio { get; set; }

        public TipoLaboratorio TipoLaboratorio { get; set; }
        public string NombreTipoLaboratorio { get; set; }
    }
}
