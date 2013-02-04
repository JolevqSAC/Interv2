using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
  public   class Respuesta
    {
        public string Extra { get; set; }
        public List<string> Mensajes { get; set; }
        public string Mensaje { get; set; }
    }
}
