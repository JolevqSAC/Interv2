using System.Linq;
using System.Text;

namespace Intertek.Business.Logic
{
    using System;
    using System.Collections.Generic;
    using DataAccess.Implementations;
    using DataAccess.Interfaces;
    using Entity;
    using Entity.Generics;

    public class MetodoBL : Singleton<MetodoBL>, IBaseLogic<Metodo>
    {
        private readonly IMetodoRepository repository = new MetodoRepository();

        #region Miembros de IBaseLogic<Metodo>

        public IList<Metodo> GetAll()
        {
            try
            {
                return repository.GetAll();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IList<Metodo> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            try
            {
                return repository.GetAll(sidx, sord, rows, page, where);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Metodo Single(int id)
        {
            try
            {
                return repository.Single(id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Count(string whereCondition = "")
        {
            try
            {
                return whereCondition == null ? repository.Count() : repository.Count(whereCondition);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Add(Metodo entity)
        {
            try
            {
                return repository.Add(entity);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Update(Metodo entity)
        {
            try
            {
                return repository.Update(entity);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Delete(int id)
        {
            try
            {
                return repository.Delete(id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion
    }
}
