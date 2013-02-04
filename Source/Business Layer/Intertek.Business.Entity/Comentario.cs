using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class Comentario : BaseEntity
    {
        public int IDComentario { get; set; }
        public string COM_Codigo { get; set; }
        public string COM_Nombre { get; set; }
        public string COM_Descripcion { get; set; }
    }
}
