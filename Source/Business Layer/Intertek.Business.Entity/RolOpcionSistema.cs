using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Intertek.Business.Entity
{
 public    class RolOpcionSistema:BaseEntity
    {

       public int IDRolOpcionSistema { get; set; }      
        public int IDRol { get; set; }   
        public int IDOpcionSistema { get; set; }     
        public DateTime ROS_FechaAsignacion { get; set; }

        public IList<OpcionSistema> OpcionSistema { get; set; }

    
    }
}
