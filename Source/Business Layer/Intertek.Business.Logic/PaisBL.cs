using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Implementations;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;

namespace Intertek.Business.Logic
{
  public   class PaisBL
    {
      public List<Pais> GetAllPais()
      {
          return new PaisRepository().GetAllPais();
      }

    }
}
