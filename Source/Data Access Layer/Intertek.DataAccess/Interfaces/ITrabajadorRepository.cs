using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity.Repository;
using Intertek.Business.Entity;

namespace Intertek.DataAccess.Interfaces
{
  public  interface ITrabajadorRepository : IRepository<Trabajador>
    {
        /*Incio Metodo carga combo*/
        IList<Cargo> Search(string nombre);
        string SearchNombre(int idCliente);
        /*Fin Metodo*/
    }
}
