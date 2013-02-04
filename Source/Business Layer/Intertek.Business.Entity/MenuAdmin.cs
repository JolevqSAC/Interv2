namespace Intertek.Business.Entity
{
    public class MenuAdmin
    {
        public int IdMenu { get; set; }

        public string Nombre { get; set; }
        public string Nombre_US { get; set; }

        public string Url { get; set; }

        public int IdModulo { get; set; }
        public string NombreActual { get; set; }
        public string IdName
        {
            get { return string.Format("form{0}", IdMenu); }
        }

        //public string NombreFormat
        //{
        //    get
        //    {
        //        return (NombreActual.Length > 24) ? NombreActual.Substring(0, 24) : NombreActual;
        //    }
        //}

        public string  NombreFormat { get; set; }
    }
}