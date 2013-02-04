using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.Business.Entity.Generics;
using Intertek.DataAccess.Implementations;
using Intertek.DataAccess.Interfaces;

namespace Intertek.Business.Logic
{
    public class UnidadMedidaBL : Singleton<UnidadMedidaBL>, IBaseLogic<UnidadMedida>
    {
        private readonly IUnidadMedidaRepository repository = new UnidadMedidaRepository();

        public IList<UnidadMedida> GetAll()
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

        public IList<UnidadMedida> GetAll(string sidx, string sord, int rows, int page, string where)
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

        public UnidadMedida Single(int id)
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

        public int Add(UnidadMedida entity)
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

        public int Update(UnidadMedida entity)
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
    }
}
