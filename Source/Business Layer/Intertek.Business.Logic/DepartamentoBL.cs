using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity.Generics;
using Intertek.Business.Entity;
using Intertek.DataAccess.Implementations;

namespace Intertek.Business.Logic
{
    public class DepartamentoBL : Singleton<DepartamentoBL>, IBaseLogic<Departamento>
    {

        public IList<Departamento> GetAllDepartamento(int IDPais)
        {
           return  new DepartamentoRepository().GetAllDepartamento(IDPais);
        }
        public IList<Departamento> GetAll()
        {
            throw new NotImplementedException();
        }

        public IList<Departamento> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Departamento Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Departamento entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Departamento entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
