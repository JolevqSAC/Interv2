using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public  class Producto:BaseEntity
    {
        
        public int IDProducto { get; set; }
        public int IDUnidadMedida { get; set; }
        public string PRO_Codigo { get; set; }
        public string PRO_Nombre { get; set; }     
        public string PRO_NombreIngles { get; set; }
        public string PRO_Descripcion { get; set; }
        public string PRO_Estado { get; set; }
        public string PRO_UsuarioCreacion { get; set; }
        public DateTime PRO_FechaHoraCreacion { get; set; }
        public string PRO_UsuarioModificacion { get; set; }
        public DateTime PRO_FechaHoraModificacion { get; set; }
       public int IDCategoria { get; set; }

    }
}
