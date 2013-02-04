using System;
using System.Collections.Generic;
using System.ComponentModel;
using Intertek.Business.Entity.Enums;

namespace Intertek.Business.Entity
{
    public class BaseEntity
    {
        public dynamic  Id { get; set; }
        public string Accion { get; set; }

        public int IdModulo { get; set; }

        public int IdMenu { get; set; }

        /// <summary>
        /// Gets or sets the Estado value.
        /// </summary>
        [DisplayName("Estado :")]
        public string Estado { get; set; }

        public string NombreEstado
        {
            get { return Enum.Parse(typeof(TipoEstado), Estado).ToString(); }
        }

        /// <summary>
        /// Gets or sets the FechaCreacion value.
        /// </summary>

        public DateTime FechaHoraCreacion { get; set; }

        /// <summary>
        /// Gets or sets the FechaActualizacion value.
        /// </summary>

        public DateTime FechaHoraModificacion { get; set; }

        /// <summary>
        /// Gets or sets the UsuarioCreacion value.
        /// </summary>

        public string UsuarioCreacion { get; set; }

        /// <summary>
        /// Gets or sets the UsuarioModificacion value.
        /// </summary>

        public string UsuarioModificacion { get; set; }

        public IList<Comun> Estados { get; set; }
    }
}