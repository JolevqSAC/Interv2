using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
  public   class Provincia
    {
        public int IDProvincia { get; set; }
        public string  PRO_Nombre { get; set; }
        public Departamento Departamento { get; set; }
    }
}
