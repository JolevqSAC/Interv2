using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Intertek.Business.Entity
{
     [Serializable, DataContract]
  public   class Distrito
    {
        public dynamic  IDDistrito { get; set; }
        public string  DIS_Nombre { get; set; }
        public Provincia Provincia { get; set; }
    }
}
