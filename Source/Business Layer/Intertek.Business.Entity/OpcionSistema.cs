using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
   public  class OpcionSistema:BaseEntity
    {
     
		public int IDOpcionSistema { get; set; }
		public string OSI_Nombre { get; set; }
		public string OSI_Modulo { get; set; }
		public string OSI_Nombre_en_US { get; set; }
		public string OSI_Modulo_en_US { get; set; }		
		public string OSI_RutaPagina { get; set; }	
		public string OSI_Codigo { get; set; }
    }
}
