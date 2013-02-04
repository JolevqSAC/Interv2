using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Intertek.Business.Entity
{
      [Serializable, DataContract]
    public class Cliente : BaseEntity
    {
        public int IDCliente { get; set; }
        public string CLI_Codigo { get; set; }

        [ScaffoldColumn(true)]
       [StringLength(11, ErrorMessageResourceName = "Longitud", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CLI_RUC { get; set; }
     [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof(Recursos.Validacion))]
     [RegularExpression(@"^[a-zA-Z''-'\s]{1,60}$", ErrorMessageResourceName = "Nombre", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CLI_RazonSocial { get; set; }
        public string CLI_Direccion { get; set; }
        [RegularExpression(@"^[0-9]{2}-[0-9]{3}-[0-9]{4}$", ErrorMessageResourceName = "Telefono", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CLI_Telefono1 { get; set; }
        [RegularExpression(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$", ErrorMessageResourceName = "Correo", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CLI_Correo { get; set; }
        public string CLI_Fax { get; set; }
        public string CLI_Observaciones { get; set; }
        public Distrito Distrito { get; set; }
        [RegularExpression(@"^[0-9]{2}-[0-9]{3}-[0-9]{4}$", ErrorMessageResourceName = "Telefono", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string CLI_Telefono2 { get; set; }
        public string CLI_IndicadorArea { get; set; }
        public int   IDDistrito { get; set; }
        //public int  IDDistrito { get; set; }
        [RegularExpression(@"^[0-9][0-9]{1,}$", ErrorMessageResourceName = "Nombre", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public string   ClI_AnexoPlanta { get; set; }
       [RegularExpression(@"^[0-9][0-9]{1,}$", ErrorMessageResourceName = "Nombre", ErrorMessageResourceType = typeof(Recursos.Validacion))]
        public  string  CLI_AnexoOficina { get; set; }
        public List<ContactoCliente> ContactoClientes { get; set; }
        public ContactoCliente ContactoCliente { get; set; }
        public int  IDProvincia { get; set; }
       
        public int   IDDepartamento { get; set; }
        public int   IDPais { get; set; }
    }
}
