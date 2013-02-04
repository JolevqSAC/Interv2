using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class TipoLaboratorio : BaseEntity
    {
        public int IDTipoLaboratorio { get; set; }
        public string TLA_Nombre { get; set; }
    }
}
