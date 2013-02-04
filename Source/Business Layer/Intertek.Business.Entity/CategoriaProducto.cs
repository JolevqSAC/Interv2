using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class CategoriaProducto : BaseEntity
    {
        public int IDCategoria { get; set; }
        public string CAT_Codigo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CAT_Nombre { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CAT_NombreIngles { get; set; }

        public string CAT_Descripcion { get; set; }
        public string CAT_IndicadorArea { get; set; }
    }
}
