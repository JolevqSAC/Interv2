using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class Cargo : BaseEntity
    {
        public int IDCargo { get; set; }
        public string CAR_Codigo { get; set; }
        public string CAR_Descripcion { get; set; }
        public string CAR_Nombre { get; set; }
        public int IDArea { get; set; }
    }
}
