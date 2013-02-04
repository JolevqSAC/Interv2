using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
   public   class NormaLimite:BaseEntity
    {
        public int IDNormaLimite { get; set; }

        public int IDEnsayo { get; set; }

        public int IDMetodo { get; set; }

        public int IDNorma { get; set; }

        public string NOL_Minimo { get; set; }

        public string NOL_Maximo { get; set; }
      public string NOL_Forma { get; set; }

    }
}
