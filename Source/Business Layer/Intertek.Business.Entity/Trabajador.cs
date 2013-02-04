using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
    public class Trabajador : BaseEntity
    {
        public int IDPersonal { get; set; }
        public int IDCargo { get; set; }

        public int IDDistrito { get; set; }
        public string PER_Codigo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof (Recursos.Validacion))]
        public string PER_Nombres { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof (Recursos.Validacion))]
        public string PER_Apellidos { get; set; }

        public string PER_DNI { get; set; }
        public string PER_Direccion { get; set; }

        public Cargo Cargo { get; set; }

        [Required(ErrorMessageResourceName = "Requerido", ErrorMessageResourceType = typeof (Recursos.Validacion))]
        public string NombreCargo { get; set; }

        public Distrito Distrito { get; set; }
        public string NombreDistrito { get; set; }

        public Provincia Provincia { get; set; }
        public int IDProvincia { get; set; }
        public string NombreProvincia { get; set; }

        public Departamento Departamento { get; set; }
        public int IDDepartamento { get; set; }
        public string NombreDepartamento { get; set; }

        public Pais Pais { get; set; }
        public int IDPais { get; set; }
        public string NombrePais { get; set; }
    }
}
