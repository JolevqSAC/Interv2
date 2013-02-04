using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class Ensayo : BaseEntity
    {
        public int IDEnsayo { get; set; }
        public string ENS_Codigo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string ENS_Nombre { get; set; }

        public string ENS_NombreIngles { get; set; }
        public int IDLaboratorio { get; set; }
        public string ENS_Descripcion { get; set; }
    }
}
