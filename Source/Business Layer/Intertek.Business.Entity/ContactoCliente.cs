using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
  public   class ContactoCliente: BaseEntity
    {
  
        public int IDContactoCliente { get; set; }
        public string COC_Codigo { get; set; }
        public string COC_Nombres { get; set; }
        public string COC_Apellidos { get; set; }
        public string COC_Cargo { get; set; }
        public string COC_Telefono1 { get; set; }
        public string COC_Telefono2 { get; set; }
        public int IDCliente { get; set; }
        public string  COC_Anexo { get; set; }
        public string  COC_Email { get; set; }
        public Cliente Cliente { get; set; }

    }
}
