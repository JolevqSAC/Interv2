using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class Contrato : BaseEntity
    {
        public int IDContrato { get; set; }
        public string CON_Codigo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CON_Descripcion { get; set; }
        public DateTime CON_FechaInico { get; set; }
        public DateTime CON_FechaFin { get; set; }
        public string CON_EstadoContrato { get; set; }
        public int IDCliente { get; set; }

        public Cliente cliente { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string NombreCliente { get; set; }
    }
}
