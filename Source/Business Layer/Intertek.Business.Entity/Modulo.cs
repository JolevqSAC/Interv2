using System.Collections.Generic;

namespace Intertek.Business.Entity
{
    public class Modulo
    {
        public int IdModulo { get; set; }

        public string Nombre { get; set; }

        public string  Nombre_US { get; set; }

        public string NombreActual { get; set; }


        public List<MenuAdmin> Menus { get; set; }

        public string IdName
        {
            get { return string.Format("modulo{0}", IdModulo); }
        }

        public string IdNameLink
        {
            get { return string.Format("a{0}", IdModulo); }
        }

        public string IdNameDiv
        {
            get { return string.Format("div{0}", IdModulo); }
        }


        public string NombreFormat
        {
            get
            {
                return (NombreActual.Length > 21) ? NombreActual.Substring(0, 21) : NombreActual;
            }
        }
    }
}