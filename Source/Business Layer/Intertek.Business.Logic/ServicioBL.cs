using Intertek.Business.Entity;
using Intertek.Business.Entity.Generics;
using Intertek.DataAccess.Interfaces;
using Intertek.DataAccess.Implementations;
using System;

namespace Intertek.Business.Logic
{
    public class ServicioBL : Singleton<ServicioBL>, IBaseLogic<Servicio>
    {
        private readonly IServicioRepository repository = new ServicioRepository();

        public System.Collections.Generic.IList<Servicio> GetAll()
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

        public System.Collections.Generic.IList<Servicio> GetAll(string sidx, string sord, int rows, int page, string where)
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

        public Servicio Single(int id)
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

        public int Add(Servicio entity)
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

        public int Update(Servicio entity)
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
