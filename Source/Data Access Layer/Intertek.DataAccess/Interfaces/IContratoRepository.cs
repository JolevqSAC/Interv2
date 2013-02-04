using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.Business.Entity.Repository;

namespace Intertek.DataAccess.Interfaces
{
    public interface IContratoRepository : IRepository<Contrato>
    {
        IList<Cliente> Search(string nombre);

        string SearchNombre(int idCliente);
    }
}
