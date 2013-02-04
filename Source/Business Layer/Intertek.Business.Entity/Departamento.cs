using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
   public  class Departamento
    {
        public int IDDepartamento { get; set; }
        public string  DEP_Nombre { get; set; }
        public Pais Pais { get; set; }
    }
}
