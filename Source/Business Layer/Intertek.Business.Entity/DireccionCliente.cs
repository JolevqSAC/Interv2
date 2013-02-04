using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
   public  class DireccionCliente:BaseEntity
    {


        public int IDDireccionCliente { get; set; }


        public string DIC_Codigo { get; set; }

        public string DIC_Tipo { get; set; }

        public string DIC_Descripcion { get; set; }
     
        public int IDCliente { get; set; }

        public Cliente Cliente { get; set; }
    }
}
