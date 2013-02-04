using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity.Generics;
using Intertek.Business.Entity;
using Intertek.DataAccess.Implementations;

namespace Intertek.Business.Logic
{
public     class ProvinciaBL : Singleton<DistritoBL>, IBaseLogic<Provincia>
    {

    public IList<Provincia> GetAllProvincia(int IdDepartamento)
    {
        return new ProvinciaRepository().GetAllProvincia(IdDepartamento);
    }

        public IList<Provincia> GetAll()
        {
            throw new NotImplementedException();
        }

        public IList<Provincia> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Provincia Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Provincia entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Provincia entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
