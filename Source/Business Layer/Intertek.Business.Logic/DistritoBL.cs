using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity.Generics;
using Intertek.Business.Entity;
using Intertek.DataAccess.Implementations;

namespace Intertek.Business.Logic
{
    public class DistritoBL : Singleton<DistritoBL>, IBaseLogic<Distrito>
    {
        public IList<Distrito> GetAll()
        {
            throw new NotImplementedException();
        }
        public IList<Distrito> GetAllDistrito(int IDProvincia)
        {
            return new DistritoRepository().GetAllDistrito(IDProvincia);
        }

        public IList<Distrito> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Distrito Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Distrito entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Distrito entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
